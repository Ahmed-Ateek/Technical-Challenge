//
//  AnagramsVC.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import UIKit

class AnagramsVC: UIViewController {
    @IBOutlet weak var firstString:UITextField!
    @IBOutlet weak var secondString:UITextField!
    @IBOutlet weak var stateLlb:UILabel!
    var presenter:PresenterAnagrams!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func checkIsAngamr(_ sender:UIButton) {
        guard let stringOne = firstString.text else {return}
        guard let stringTwo = secondString.text else {return}
        presenter.angamrCheck(stringA: stringOne, stringB: stringTwo)
    }
}
extension AnagramsVC{
    private func setupView(){
        presenter = PresenterAnagrams(delegate:  self )
    }
}
extension AnagramsVC:AnagramsView{
    func checkIsAngamr(isAngamr: Bool) {
        stateLlb.text = "Anagrams State: \(isAngamr)"
    }
    
    
}
