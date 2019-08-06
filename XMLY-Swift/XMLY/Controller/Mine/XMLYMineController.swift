//
//  XMLYMineController.swift
//  XMLY
//
//  Created by sandsyu on 2019/8/1.
//  Copyright © 2019 sandsyu. All rights reserved.
//

import UIKit

class XMLYMineController: UIViewController{

    private let XMLYMineMakeCellID = "LBFMMineMakeCell"
    private let XMLYMineShopCellID = "LBFMMineShopCell"

    private lazy var dataSource: Array = {
        return [
            [
                ["icon":"钱数", "title":"分享赚钱"],
                ["icon":"沙漏", "title":"免流量服务"]
            ],
            [
                ["icon":"扫一扫", "title":"扫一扫"],
                ["icon":"月亮", "title":"夜间模式"]
            ],
            [
                ["icon":"意见反馈", "title":"帮助与反馈"],
            ],
        ]
    }()
    
    //懒加载tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: XMLYScreenWidth, height: XMLYScreenHeight), style: UITableView.Style.plain)
        tableView.dataSource = self as UITableViewDataSource
        tableView.delegate = self as UITableViewDelegate
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = XMLYDownColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(XMLYMineMakeCell.self, forCellReuseIdentifier: XMLYMineMakeCellID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNav()
        self.view.addSubview(self.tableView)
    }
    
    func configNav() {
        let selfNaviBar = self.navigationController?.navigationBar
//        selfNaviBar?.tintColor =
        selfNaviBar?.backgroundColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 0)
    }

}

// - 代理方法
extension XMLYMineController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: XMLYMineMakeCell = tableView.dequeueReusableCell(withIdentifier: "LBFMMineMakeCell", for: indexPath) as! XMLYMineMakeCell
            cell.selectionStyle = .none
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            let sectionArray = dataSource[indexPath.section-1]
            let dict: [String: String] = sectionArray[indexPath.row]
            cell.textLabel?.text = dict["title"]
            cell.imageView?.image = UIImage(named: dict["icon"] as! String)
            if indexPath.section == 3 && indexPath.row == 1{
                let cellSwitch = UISwitch.init()
                cell.accessoryView = cellSwitch
            }else {
                cell.accessoryType = .disclosureIndicator
            }
            return cell
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 || section == 2 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = XMLYDownColor
        return footerView
    }
}
