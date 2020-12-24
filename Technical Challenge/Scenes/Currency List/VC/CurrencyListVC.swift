//
//  CurrencyListVC.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import UIKit

class CurrencyListVC: UIViewController {
    @IBOutlet weak var currencyTable:UITableView!
    var presenter:PresenterCurrency!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    

   
}
extension CurrencyListVC{
    private func setupView(){
        presenter = PresenterCurrency(delegate: self)
        presenter.getCurrncy()
        currencyTable.delegate = self
        currencyTable.dataSource = self
    }
}
extension CurrencyListVC: CurrencyView{
    func goToConvertCurrency(selectedCurrency: String) {
        if let currencyVC = storyboard?.instantiateViewController(withIdentifier: "CurrencyConverterVC") as? CurrencyConverterVC{
            currencyVC.selectedCurrenc = selectedCurrency
            self.navigationController?.pushViewController(currencyVC, animated: true)
        }
    }
    
    func currencyLoaded() {
        currencyTable.reloadData()
    }
}
extension  CurrencyListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.sendCountToTable()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        presenter.configureCell(cell: cell, index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCurrency(index: indexPath.row)
    }
    
}
