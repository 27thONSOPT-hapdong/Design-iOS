//
//  ListPageCell.swift
//  design-ios-hapdong
//
//  Created by 이정엽 on 2020/11/14.
//

import UIKit

class ListPageCell: UITableViewCell {
    
    static let identifier = "ListPageCell"
    
    @IBOutlet var cellView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellFeature(){
        self.contentView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 250/255, alpha: 1.0)
        cellView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 250/255, alpha: 1.0)
        cellView.layer.shadowOpacity = 1.0
        cellView.layer.shadowOffset = CGSize(width: 3, height: 5)
        cellView.layer.shadowRadius = 4
        cellView.layer.masksToBounds = false
        cellView.layer.shadowColor = CGColor(red: 216/255, green: 225/255, blue: 232/255, alpha: 1.0)
    }
    func setCell(title : String, date : String){
        titleLabel.text = title
        dateLabel.text = date
    }

//    @IBAction func cellBtn(_ sender: Any) {
//    }
}
