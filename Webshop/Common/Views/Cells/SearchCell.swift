//
//  SearchCell.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 17..
//  Copyright © 2020. GesBen. All rights reserved.
//

import UIKit

protocol SearchCellBindable {
    var title: String? { get }
}

class SearchCell: UITableViewCell {
   
    private var indexPath: IndexPath!
    
    private var wholeView: UIView!
    private var titleLabel: UILabel!
    private var settingsButton: UIButton!
    private var assignmentsLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .clear
        initWholeView()
        initTitleLabel()
    }
    
    private func initWholeView() {
        wholeView = UIView()
        contentView.addSubview(wholeView)
        wholeView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16.0)
        }
        
        wholeView.cornerRadius = 8.0
        wholeView.clipsToBounds = false
        wholeView.layer.masksToBounds = false
        wholeView.layer.shadowRadius = 5.0
        wholeView.layer.shadowOpacity = 1.0
        wholeView.layer.shadowColor = Colors.lightGray.cgColor
        wholeView.layer.shadowOffset = CGSize(width: 0 , height: 2)
        wholeView.backgroundColor = .white
        
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = FontDeliver.boldRobotoFont(ofSize: 22.0)
        titleLabel.textColor = Colors.gray
        titleLabel.numberOfLines = 2
        wholeView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16.0)
        }
    }

    func setIndexPath(_ indexpath: IndexPath) {
        indexPath = indexpath
    }
    
    func bind(_ model: SearchCellBindable) {
        if model.title == nil {
            setAllHidden( true )
            return
        }
        
        titleLabel.text = model.title
        
        UIView.animate(withDuration: 0.5, animations: {
            self.setAllHidden( false )
        })
            
    }
    
    func setAllHidden(_ hide: Bool ) {
        let alpha: CGFloat = hide ? 0.0 : 1.0
        titleLabel.alpha = alpha
        
        titleLabel.isUserInteractionEnabled = !hide
        
    }

}
