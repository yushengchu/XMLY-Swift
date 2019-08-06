//
//  XMLYMineMakeCell.swift
//  XMLY
//
//  Created by sandsyu on 2019/8/2.
//  Copyright © 2019 sandsyu. All rights reserved.
//

import UIKit
import SnapKit

class XMLYMineMakeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        setUpLayout()
    }
    
    func setUpLayout() {
        let margin:CGFloat = XMLYScreenWidth / 8
        let titleArr = ["我的录音","我的直播","我的作品","主播工作台"]
        let iconArr = ["麦克风","直播","视频","工作台"]

        for index in 0..<4 {
            let title = titleArr[index]
            let icon = iconArr[index]
            
            let button = UIButton.init(frame: CGRect(x: margin*CGFloat(index)*2+margin/2, y: 10, width: margin, height: margin))
            button.setImage(UIImage(named: icon), for: UIControl.State.normal)
            self.addSubview(button)
            
            let titleLabel = UILabel()
            titleLabel.textAlignment = .center
            titleLabel.text = title
            titleLabel.font = UIFont.systemFont(ofSize: 15)
            titleLabel.textColor = UIColor.gray
            self.addSubview(titleLabel)
            
            titleLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(button)
                make.width.equalTo(margin+30)
                make.top.equalTo(margin+15)
            }
            
            button.tag = index
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
