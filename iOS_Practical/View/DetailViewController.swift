//
//  DetailViewController.swift
//  iOS_Practical_Naman
//
//  Created by naman on 05/02/19.
//  Copyright © 2019 naman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imgFact: UIImageView!
    @IBOutlet var lblDescription: UILabel!
    var strTitle = ""
    var imgUrl = ""
    var txtDescription = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = strTitle == "" ? constantText.noTitle : strTitle
        self.lblDescription.text = txtDescription == "" ? constantText.noDescription : txtDescription
        self.imgFact.sd_setImage(with: URL(string: imgUrl)) { (image, error, SDImageCacheType, URL) in
            if error != nil {
                self.imgFact.image = UIImage(named: "default-thumb")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
