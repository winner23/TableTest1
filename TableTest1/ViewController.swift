//
//  ViewController.swift
//  TableTest1
//
//  Created by Volodymyr Viniarskyi on 3/26/18.
//  Copyright © 2018 Volodymyr Viniarskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var table: UITableView = UITableView()
  var array = [(a:String, b:String)]()
  
  @IBAction func test(_ sender: UIBarButtonItem) {
    guard let editViewController = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "EditViewController") as? EditViewController else { return }
    editViewController.navigationController?.title = "Add"
    editViewController.result = {
      //[unowned self]
      (titleItem, descriptionItem) in
      if titleItem.count>0 && descriptionItem.count>0 {
        self.array.append((titleItem, descriptionItem))
        self.table.reloadData()
      }

    }
    
    self.navigationController?.pushViewController(editViewController, animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "cell")
    cell.textLabel?.text = array[indexPath.row].a
    cell.detailTextLabel?.text = array[indexPath.row].b
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
}
