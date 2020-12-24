//
//  TechnicalListVC.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import UIKit

class TechnicalListVC: UIViewController {
    @IBOutlet weak var technicalTable:UITableView!
    var presenter:PresenterTechnicalList!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
            
    }
}

extension TechnicalListVC{
    
    private func setupViews(){
        presenter = PresenterTechnicalList(delegate: self)
       
        technicalTable.delegate = self
        technicalTable.dataSource = self
        
        technicalTable.reloadData()
    }
}

extension TechnicalListVC:TechnicalListView{
    func segueToVC(vcID: String) {
        guard let vc = storyboard?.instantiateViewController(identifier: vcID) else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension TechnicalListVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.returnTableViewCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        presenter.configureCell(cell: cell, index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectIndex(index: indexPath.row)
    }
}
