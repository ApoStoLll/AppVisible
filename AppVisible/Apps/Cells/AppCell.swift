//
//  AppCell.swift
//  AppVisible
//
//  Created by Danylo on 20.08.2021.
//

import UIKit

class AppCell: UITableViewCell {
    
    static let cellIdentifier = "AppCell"
   
    
    @IBOutlet weak var appNameText: UILabel!
    
    @IBOutlet weak var organicSwitch: UISwitch!
    
    @IBOutlet weak var isShowedSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(data: AppCellModel){
        appNameText.text = data.appName
        organicSwitch.isOn = data.organic
        isShowedSwitch.isOn = data.isShowed
    }
    
}
