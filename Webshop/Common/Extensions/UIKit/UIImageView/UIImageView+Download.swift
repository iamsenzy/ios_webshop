//
//  UIImageView+Download.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 01..
//  Copyright © 2020. gesben. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: ((UIImage) -> Void )? = nil) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                if completion == nil {
                    self?.image = image
                }
                
                completion?(image)
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: ((UIImage) -> Void )? = nil ) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode , completion: completion )
    }
}
