//
//  AppCell.swift
//  AppVisible
//
//  Created by Danylo on 20.08.2021.
//

import UIKit

protocol AppCellDeligate: AnyObject {
    func changeOrganicTap(appPackage: String, organic: Bool)
    func changeVisibleTap(appPackage: String, isShow : Bool)
}

class AppCell: UITableViewCell {
    
    static let cellIdentifier = "AppCell"
    weak var delegate : AppCellDeligate?
    
    @IBOutlet weak var appNameText: UILabel!
    
    @IBOutlet weak var organicSwitch: UISwitch!
    
    @IBOutlet weak var isShowedSwitch: UISwitch!
    
    
    @IBAction func organicChangedSwitch(_ sender: UISwitch) {
        guard let appPackage = appPackage else {
            return
        }
        delegate?.changeOrganicTap(appPackage: appPackage, organic: sender.isOn)
    }
    @IBAction func visibleChangedSwitch(_ sender: UISwitch) {
        guard let appPackage = appPackage else {
            return
        }
        delegate?.changeVisibleTap(appPackage: appPackage, isShow: sender.isOn)
    }
    private var appPackage: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(data: AppCellModel){
        appPackage = data.appPackage
        appNameText.text = data.appName
        organicSwitch.isOn = data.organic
        isShowedSwitch.isOn = data.isShowed
    }
    
}
