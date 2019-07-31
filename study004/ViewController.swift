//
//  ViewController.swift
//  study004
//
//  Created by PeiYu Wang on 2019/7/17.
//  Copyright © 2019 PeiYu Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    //设置行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 3//0分区的行数
        }else{
            return 10
        }
    }
    //设置分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3//分区数
    }
    //设置单元
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell==nil{
            cell=UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
            
        }
        cell?.textLabel?.text="第\(indexPath.section)分区"
        cell?.detailTextLabel?.text="第\(indexPath.row)行"
        cell?.imageView?.image=UIImage(named: "chaojikeyuan")
        cell?.backgroundColor=UIColor.purple
        cell?.accessoryType = .checkmark
        return cell!
    }
    
//设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0{
            return 100
        }else{
            return 44
        }
    }
    //设置分区头视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //设置分区尾视图高
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    //z设置分区头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        view.backgroundColor=UIColor.blue
        return view
    }
    //z设置分区尾视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        view.backgroundColor=UIColor.green
        return view
    }
    //选中cell时调用
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("<#T##items: Any...##Any#>")
    }
    //设置cell的编辑模式类型
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section==0{
            return .insert
        }else{
            return .delete
        }
    }
    //设置某行数据载体cell是否支持位置移动
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //设置移动后回调的方法
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    //设置删除按钮标题
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删删"
    }
    //提交编辑操作时触发的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("编辑\(editingStyle)--\(indexPath)")
    }
    //添加分区索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["0","1","2"]
    }
    var refreshControl=UIRefreshControl()//下拉刷新
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshControl.attributedTitle=NSAttributedString(string: "松开后自动刷新")
        let tableView=UITableView(frame: self.view.bounds,style: .plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.isEditing=true//编辑模式
        
        tableView.addSubview(refreshControl)
        self.view.addSubview(tableView)
    }

//下拉响应
    @objc func refreshData(){
//        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        
    }
}

