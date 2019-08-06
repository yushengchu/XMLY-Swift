//
//  XMLYNavigationController.swift
//  XMLY
//
//  Created by sandsyu on 2019/8/5.
//  Copyright © 2019 sandsyu. All rights reserved.
//
//  通用导航栏视图控制器
//
import UIKit

class XMLYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationAppearence()
    }
    
    func setupNavigationAppearence() {
        //设置导航栏默认颜色
    }

}

extension XMLYNavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
