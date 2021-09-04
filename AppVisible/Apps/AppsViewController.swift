//
//  AppsViewController.swift
//  AppVisible
//
//  Created by Danylo on 20.08.2021.
//

import UIKit


protocol AppsDisplayLogic : AnyObject {
    func displayData(data: [AppCellModel])
}

class AppsViewController: UIViewController {
    
    //MARK: IBoutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Internal vars
    private let refreshControl = UIRefreshControl()
    private var interactor: AppsBusinessLogic?
    private var dataToDisplay = [AppCellModel]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let presenter = AppsPresenter()
        let interactor = AppsInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    
    // MARK: External vars
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        interactor?.fetchApps()
        // Do any additional setup after loading the view.
    }

    @objc func refresh(_ sender: AnyObject) {
        interactor?.fetchApps()
        refreshControl.endRefreshing()
    }

    private func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "AppCell", bundle: nil), forCellReuseIdentifier: AppCell.cellIdentifier)
        
    }

}

extension AppsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->   UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AppCell.cellIdentifier,for: indexPath) as? AppCell
        else {return UITableViewCell()}
        cell.setup(data: dataToDisplay[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    
}

extension AppsViewController: AppCellDeligate{
    func changeOrganicTap(appPackage: String, organic: Bool) {
        interactor?.changeOrganic(appPackage: appPackage, organic: organic)
    }
    func changeVisibleTap(appPackage: String, isShow: Bool) {
        interactor?.changeVisibile(appPackage: appPackage, visible: isShow)
    }
    
}

extension AppsViewController: AppsDisplayLogic{
    func displayData(data: [AppCellModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
}
