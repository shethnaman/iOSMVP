//
//  PresenterView.swift
//  iOS_Practical_Naman
//
//  Created by naman on 05/02/19.
//  Copyright © 2019 naman. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
protocol FactsView {
    func getFacts(model : FactsRootClass?)
    func showErrorWith(message: String)
    func showDetailFor(facts: FactsRow)
}
class PresenterView {
    fileprivate var factsView : FactsView?
    
    func appendView(_ view:FactsView){
        factsView = view
    }
    
    func startIndicator(){
        SVProgressHUD.show()
    }
    func stopIndicator() {
        SVProgressHUD.dismiss()
    }
    func stopIndicator(errorString : String ){
        SVProgressHUD.showError(withStatus: errorString)
    }
    
    func getFactsData() {
        if !Connectivity.isConnectedToInternet{
            self.factsView?.showErrorWith(message: constantText.noInternet)
            return
        }
        self.startIndicator()
        callGetApi(ApiURL, completionHandler: { (responseString) in
            let decoder = JSONDecoder()
            let model = try! decoder.decode(FactsRootClass.self, from: Data(responseString.utf8))
            self.stopIndicator()
            self.factsView?.getFacts(model: model)
            
        }) { (error) in
            print(error)
            self.stopIndicator(errorString: error.localizedDescription)
        }
    }
    
    public func onSelected(facts: FactsRow){
        if facts.description != nil  {
            self.factsView!.showDetailFor(facts: facts)
        } else {
            self.factsView!.showErrorWith(message: constantText.noDescription)
        }
    }
}
