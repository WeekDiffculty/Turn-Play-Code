//
//  CustomCell.swift
//  06故事板storyboard中的表格视图
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   func  updateCell(strInfo:String){
        titleLbl.text=strInfo
    }

}
