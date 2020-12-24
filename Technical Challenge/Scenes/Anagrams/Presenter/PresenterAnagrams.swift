//
//  PresenterAnagrams.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import Foundation
protocol AnagramsView:class {
    func checkIsAngamr(isAngamr:Bool)
}
class PresenterAnagrams {
    private weak var delegate:AnagramsView?
    init(delegate:AnagramsView){
        self.delegate = delegate
    }
    
    func angamrCheck(stringA:String,stringB:String) {
        delegate?.checkIsAngamr(isAngamr: stringA.lowercased().sorted() == stringB.lowercased().sorted())
    }
}
