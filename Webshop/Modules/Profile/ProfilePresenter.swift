//
//  ProfilePresenter.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 07..
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ProfilePresenter {

    // MARK: - Private properties -

    private unowned let view: ProfileViewInterface
    private let interactor: ProfileInteractorInterface
    private let wireframe: ProfileWireframeInterface
    
    private var user: User = User()

    // MARK: - Lifecycle -

    init(view: ProfileViewInterface, interactor: ProfileInteractorInterface, wireframe: ProfileWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        if let user = UserManager.shared.loggedInUser {
            self.user = user
            view.bind(user: user)
        }
    }
}

// MARK: - Extensions -

extension ProfilePresenter: ProfilePresenterInterface {
    func logdInUser() -> Bool {
        UserManager.shared.loggedInUser != nil
    }
    
    func logoutButtonTapped() {
        UserManager.shared.logout()
        self.user = User()
        UIView.animate(withDuration: 0.3) {
            self.view.bind(user: User())
        }
    }
    
    func textFieldChanged(text: String, tag: Int) {
        switch tag {
        case 0:
            user.name = text
            validateText(text: text, tag: tag)
        case 1:
            user.email = text
            validateEmail()
        case 2:
            user.phoneNumber = text
            validatePhoneNumber()
        case 3:
            user.postNumber = text.int
            validatePostNumber()
        case 4:
            user.city = text
            validateText(text: text, tag: tag)
        case 5:
            user.address = text
            validateText(text: text, tag: tag)
        default:
            break
        }
        
    }
    
    private func validateField(text: String) -> Bool {
        text.count > 4
    }
    
    private func validateText(text: String, tag: Int) -> Bool {
        if !validateField(text: text) {
            view.changeTextFieldState(state: .bad, tag: tag)
            return false
        } else {
            view.changeTextFieldState(state: .good, tag: tag)
            return true
        }
    }
    
    private func validateEmail() -> Bool {
        if let email = user.email {
            if email.matches(pattern: Regex.Email) {
                view.changeTextFieldState(state: .good, tag: 1)
                return true
            } else {
                view.changeTextFieldState(state: .bad, tag: 1)
                return false
            }
        }
        view.changeTextFieldState(state: .bad, tag: 1)
        return false
    }
    
    private func validatePhoneNumber() -> Bool {
        if let number = user.phoneNumber {
            if number.matches(pattern: Regex.PhoneNumber) {
                view.changeTextFieldState(state: .good, tag: 2)
                return true
            } else {
                view.changeTextFieldState(state: .bad, tag: 2)
                return false
            }
        }
        view.changeTextFieldState(state: .bad, tag: 2)
        return false
    }
    
    private func validatePostNumber() -> Bool {
        if let number = user.postNumber?.string {
            if number.matches(pattern: Regex.PostNumber) {
                view.changeTextFieldState(state: .good, tag: 3)
                return true
            } else {
                view.changeTextFieldState(state: .bad, tag: 3)
                return false
            }
        }
        view.changeTextFieldState(state: .bad, tag: 3)
        return false
    }
    
    private func checkEverything() -> Bool {
       let name = validateText(text: user.name ?? "", tag: 0)
       let email = validateEmail()
       let phone = validatePhoneNumber()
       let postNumber = validatePostNumber()
       let city = validateText(text: user.city ?? "", tag: 4)
       let address = validateText(text: user.address ?? "", tag: 5)
        
       return name && email && phone && postNumber && city && address
        
    }
    
    private func setAllFieldToNormal() {
        for index in 0...5 {
            view.changeTextFieldState(state: .normal, tag: index)
        }
    }
    
    func saveButtonTapped() {
        if user.email != "" || checkEverything() {
            setAllFieldToNormal()
            interactor.getProfileByEmail(email: user.email ?? "") { result in
                switch result {
                case .success(let profileResponse):
                    if profileResponse.status == 200 {
                        self.user = profileResponse.data?[0] ?? User()
                        self.interactor.updateProfile(data: self.user ?? User()) { updateResult in
                            switch updateResult {
                            case .success(let updateResponse):
                                self.interactor.createCart(customerId: self.user.id ?? 0) { cartResult in
                                    switch cartResult {
                                    case .success(let cartResponse):
                                        self.user.cartId = cartResponse.cartId
                                        UserManager.shared.loggedInUser = self.user
                                        self.view.bind(user: self.user)
                                        self.setAllFieldToNormal()
                                    case .failure(let error):
                                        log.error(error.localizedDescription)
                                    }
                                }
                            case .failure(let error):
                                log.error(error.localizedDescription)
                            }
                        }
                    } else {
                        if self.checkEverything() {
                            self.interactor.createProfile(data: self.user ?? User(), completion: { createResult in
                                switch createResult {
                                case .success(let createResponse):
                                    self.user.id = createResponse.userId
                                    self.interactor.createCart(customerId: self.user.id ?? 0) { cartResult in
                                        switch cartResult {
                                        case .success(let cartResponse):
                                            self.user.cartId = cartResponse.cartId
                                            UserManager.shared.loggedInUser = self.user
                                            self.view.bind(user: self.user)
                                            self.setAllFieldToNormal()
                                        case .failure(let error):
                                            log.error(error.localizedDescription)
                                        }
                                    }
                                case .failure(let error):
                                    log.error(error.localizedDescription)
                                }
                            })
                        }
                    }
                case .failure(let error):
                    log.error(error.localizedDescription)
                }
            }
        }
    }
    
}
