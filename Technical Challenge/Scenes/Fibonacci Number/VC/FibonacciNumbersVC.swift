//
//  FibonacciNumbersVC.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import UIKit

class FibonacciNumbersVC: UIViewController {
    @IBOutlet weak var numbersTxt:UITextField!
    
    var presenter:PresenterFibonacciSeq!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
      
    }
    
    @IBAction func firstApproach(_ sender:UIButton){
        guard let number:Int = Int(numbersTxt.text ?? "0") else {return}
        presenter.fiboRecurstion(num: number)
        
    }
    @IBAction func secondApproach(_ sender:UIButton){
        guard let number:Int = Int(numbersTxt.text ?? "0") else {return}
        presenter.fiboSequence(num: number)
    }

}
extension FibonacciNumbersVC{
    private func setupView(){
        presenter = PresenterFibonacciSeq(delegate: self)
    }
}
extension FibonacciNumbersVC:FibonacciSeqView{
    func showSequence(sequence: [Int]) {
       print(sequence)
    }
    
    
}
