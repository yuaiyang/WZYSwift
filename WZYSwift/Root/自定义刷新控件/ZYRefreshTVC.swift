//
//  ZYRefreshTVC.swift
//  WZYSwift
//
//  Created by ylcf on 2017/4/20.
//  Copyright © 2017年 wzy. All rights reserved.
//  有些小问题

import UIKit

class ZYRefreshTVC: UITableViewController {

    // 懒加载刷新控件
    lazy var refreshC: ZYRefreshControl = ZYRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置 contentInset
//        tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        // 添加刷新控件
        tableView.addSubview(refreshC)
        // 监听方法
        refreshC.addTarget(self, action: #selector(loadData), for: .valueChanged)
        loadData()
    }
    
    func loadData() {
        print("开始刷新")
        refreshC.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            print("结束刷新")
            self.refreshC.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
