//
//  ViewController.swift
//  iOS_Practical_Naman
//
//  Created by naman on 02/02/19.
//  Copyright © 2019 naman. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
 
    private var presenter = PresenterView()
    private var modelFacts : FactsRootClass?
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var btnRefresh: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.appendView(self)
        presenter.getFactsData()
        
    }

    @IBAction func btnActionClicked(_ sender: Any) {
        self.modelFacts = nil
        presenter.getFactsData()
    }
}
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if userDevice == .phone {
            return CGSize(width: ScreenSize.SCREEN_WIDTH, height:150)
        }else {
            return CGSize(width: ScreenSize.SCREEN_WIDTH / 2 - 15, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelFacts?.rows?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FactsCollectionCell", for: indexPath as IndexPath) as! FactsCollectionCell
        DispatchQueue.main.async {
            if let imgUrl = self.modelFacts?.rows![indexPath.row].imageHref {
                cell.imgFacts!.sd_setImage(with: URL(string: imgUrl), completed: nil)
            }else {
                cell.imgFacts.image = UIImage(named: "default-thumb")
            }
            if let title = self.modelFacts?.rows![indexPath.row].title {
                cell.title.text = title
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.onSelected(facts: modelFacts!.rows![indexPath.row])
        

    }
    
}
extension ViewController : FactsView {
    func showDetailFor(facts: FactsRow) {
                let detailVc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                detailVc.imgUrl = facts.imageHref!
                detailVc.strTitle = facts.title!
                detailVc.txtDescription = facts.description!
                self.navigationController?.pushViewController(detailVc, animated: true)
    }
    
    
    func getFacts(model: FactsRootClass?) {
        modelFacts = model
        if model != nil {
            self.title = model?.title!
            self.collectionView.reloadData()
        }
    }
    
    func showErrorWith(message: String) {
        let alert = UIAlertController(title: "Facts", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
