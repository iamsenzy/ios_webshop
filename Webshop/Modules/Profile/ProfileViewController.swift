//
//  ProfileViewController.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 07..
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ProfileViewController: BaseTabbarProtocolController {

    // MARK: - Public properties -
    
    override var tabbarImage: UIImage? {
        UIImage(named: "profile")
    }
    
    override var selectedTabbarImage: UIImage? {
        UIImage(named: "profileGray")
    }

    var presenter: ProfilePresenterInterface!
    
    private var scrollView: UIScrollView!
    
    private var logutButton: UIButton!
    private var nameView: TextFieldWithTitle!
    private var emailView: TextFieldWithTitle!
    private var phoneView: TextFieldWithTitle!
    private var postNumberView: TextFieldWithTitle!
    private var cityView: TextFieldWithTitle!
    private var addressView: TextFieldWithTitle!
    private var saveButton: UIButton!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title =  "Profile".localized
        setup()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = true
        initLogoutButton()
    }
    
    private func setup() {
        initScrollView()
        initLogoutButton()
        initNameView()
        initEmailView()
        initPhoneView()
        initPostView()
        initCityView()
        initAddressView()
        initsaveButton()
    }
    
    private func initScrollView() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func initLogoutButton() {
        if presenter.logdInUser() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile.Logout".localized, style: .done, target: self, action: #selector(logoutButtonTapped))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
        
    }
    
    private func initNameView() {
        nameView = TextFieldWithTitle()
        nameView.delegate = self
        nameView.bind(title: "Profile.Name".localized, tag: 0)
        scrollView.addSubview(nameView)
        nameView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30.0)
            make.leading.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
        }
        
    }
    private func initEmailView() {
        emailView = TextFieldWithTitle()
        emailView.delegate = self
        emailView.bind(title: "Profile.Email".localized, tag: 1)
        scrollView.addSubview(emailView)
        emailView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(10.0)
            make.leading.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
        }
        
    }
    private func initPhoneView() {
        phoneView = TextFieldWithTitle()
        phoneView.delegate = self
        phoneView.bind(title: "Profile.Phone".localized, tag: 2)
        scrollView.addSubview(phoneView)
        phoneView.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).offset(10.0)
            make.leading.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
        }
    }
    private func initPostView() {
        postNumberView = TextFieldWithTitle()
        postNumberView.delegate = self
        postNumberView.bind(title: "Profile.PostNumber".localized, tag: 3)
        scrollView.addSubview(postNumberView)
        postNumberView.snp.makeConstraints { make in
            make.top.equalTo(phoneView.snp.bottom).offset(10.0)
            make.leading.equalToSuperview().offset(10.0)
            make.width.equalTo(130.0)
        }
    }
    private func initCityView() {
        cityView = TextFieldWithTitle()
        cityView.delegate = self
        cityView.bind(title: "Profile.City".localized, tag: 4)
        scrollView.addSubview(cityView)
        cityView.snp.makeConstraints { make in
            make.top.equalTo(phoneView.snp.bottom).offset(10.0)
            make.leading.equalTo(postNumberView.snp.trailing).offset(8.0)
            make.trailing.equalTo(phoneView.snp.trailing)
        }
    }
    private func initAddressView() {
        addressView = TextFieldWithTitle()
        addressView.delegate = self
        addressView.bind(title: "Profile.Address".localized, tag: 5)
        scrollView.addSubview(addressView)
        addressView.snp.makeConstraints { make in
            make.top.equalTo(cityView.snp.bottom).offset(10.0)
            make.leading.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initsaveButton() {
        saveButton = UIButton()
        saveButton.titleLabel?.font = FontDeliver.mediumRobotoFont(ofSize: 20.0)
        saveButton.setTitle("Profile.Save".localized, for: .normal)
        saveButton.backgroundColor = Colors.darkGray
        saveButton.cornerRadius = 8.0
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        scrollView.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(addressView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(44.0)
            make.leading.equalToSuperview().offset(16.0)
            make.bottom.equalToSuperview().offset(-250.0)
        }
    }
    
    @objc
    private func logoutButtonTapped() {
        presenter.logoutButtonTapped()
    }
    
    @objc
    private func saveButtonTapped() {
        presenter.saveButtonTapped()
    }

}

// MARK: - Extensions -

extension ProfileViewController: ProfileViewInterface {
    func changeTextFieldState(state: TextFieldState, tag: Int) {
        switch tag {
        case 0:
            nameView.setState(state: state)
        case 1:
            emailView.setState(state: state)
        case 2:
            phoneView.setState(state: state)
        case 3:
            postNumberView.setState(state: state)
        case 4:
            cityView.setState(state: state)
        case 5:
            addressView.setState(state: state)
        default:
            break
        }
    }
    
    func bind(user: User) {
        nameView.setInputText(text: user.name ?? "")
        emailView.setInputText(text: user.email ?? "")
        phoneView.setInputText(text: user.phoneNumber ?? "")
        postNumberView.setInputText(text: user.postNumber?.string ?? "")
        cityView.setInputText(text: user.city ?? "")
        addressView.setInputText(text: user.address ?? "")
        
        initLogoutButton()
    }
}

extension ProfileViewController: TextfieldDeleage {
    func textFieldChanged(text: String, tag: Int) {
        presenter.textFieldChanged(text: text, tag: tag)
    }
    
}
