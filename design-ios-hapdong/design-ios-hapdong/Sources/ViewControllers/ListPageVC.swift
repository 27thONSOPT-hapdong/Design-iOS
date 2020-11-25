//
//  ListPageVC.swift
//  design-ios-hapdong
//
//  Created by 이정엽 on 2020/11/14.
//

import UIKit

class ListPageVC: UIViewController{
    
    @IBOutlet var ListTable: UITableView!
    
    var frontPage : [[String]] = [["SOPT 솝커톤 아이디에이션","2020년 11월 21일"],["인적자원관리 과제 아이디에이션","2020년 05월 09일"],["Logistar Summit Forum","2020년 06월 15일"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        ListTable.dataSource = self
        ListTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        ListTable.delegate = self
        ListTable.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 250/255, alpha: 1.0)
        self.view.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 250/255, alpha: 1.0)

    }
    
    
    @IBAction func addBtn(_ sender: Any){
        self.frontPage.append(["Title","Date"])
        print(frontPage)
        self.ListTable.performBatchUpdates({self.ListTable.insertRows(at: [IndexPath(row:self.frontPage.count - 1, section: 0)], with: .automatic)}, completion: nil)
        
    }
    
}

extension ListPageVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
    }

}

extension ListPageVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frontPage.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(frontPage)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListPageCell.identifier) as? ListPageCell else {
            return UITableViewCell()
        }
        cell.setCellFeature()
        
        print(indexPath.row)
        print(frontPage.count)
        
        cell.setCell(title: frontPage[indexPath.row][0], date: frontPage[indexPath.row][1])
        return cell
    }

    
}
