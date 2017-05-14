//
//  MainTableViewController.swift
//  JJSwiftMediator
//
//  Created by yejiajun on 2017/4/27.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

import UIKit
import JJMediator      // 导入JJMediator核心模块
import SwiftExtension  // 导入SwiftExtension模块
import OCExtension     // 导入OCExtension模块
/*
 * 1.SwiftModule模块不需要导入，在运行时会自动调用
 * 2.在JJMediator-Bridging-Header.h文件中导入OCModule模块
 */

class MainTableViewController: UITableViewController {
    
    let contentArray = ["OCModule",
                        "SwiftModule"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MainTableViewController"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = contentArray[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            print("\nOCModule:")
            // 无入参无返回值
            JJMediator.sharedInstance().JJMediator_ocModuleMethod()
            // 无入参返回对象类型
            let ocString = JJMediator.sharedInstance().JJMediator_ocFetchNameFromModuleMethod()
            print("fetchNameFromModuleMethod:\(ocString ?? "nil")") // OC函数的返回值在Swift中为Optional类型，因为可以返回nil
            // 有入参无返回值
            JJMediator.sharedInstance().JJMediator_ocModuleMethod(withName: "jj", callback: { (result) in
                print("moduleMethodWithName:\(result ?? "nil")")
            })
            // 有入参返回基本类型
            let swiftNumber = JJMediator.sharedInstance().JJMediator_ocFetchNumberFromModuleMethod(withNumber: 18)
            print("fetchNumberFromModuleMethodWithNumber:\(swiftNumber)")
        case 1:
            print("\nSwiftModule:")
            // 无入参无返回值
            JJMediator.sharedInstance().JJMediator_swiftModuleMethod()
            // 无入参返回对象类型
            let ocString = JJMediator.sharedInstance().JJMediator_swiftFetchNameFromModuleMethod()
            print("fetchNameFromModuleMethod:\(ocString ?? "nil")") // OC函数的返回值在Swift中为Optional类型，因为可以返回nil
            // 有入参无返回值
            JJMediator.sharedInstance().JJMediator_swiftModuleMethod(withName: "jj", callback: { (result) in
                print("moduleMethodWithName:\(result ?? "nil")")
            })
            // 有入参返回基本类型
            let swiftNumber = JJMediator.sharedInstance().JJMediator_swiftFetchNumberFromModuleMethod(withNumber: 18)
            print("fetchNumberFromModuleMethodWithNumber:\(swiftNumber)")
        default:
            print("\n")
        }
    }

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
