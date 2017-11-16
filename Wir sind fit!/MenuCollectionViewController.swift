//
//  MenuCollectionViewController.swift
//  Wir sind fit!
//
//  Created by Andreas Bachmaier on 13.11.17.
//  Copyright © 2017 Andreas Bachmaier. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MenuCell"

class MenuCollectionViewController: UICollectionViewController {

    let menuLabels = ["Website", "Standorte", "Kurse", "Jumping", "Groupfitness", "Specials", "Team", "Social Media", "FAQ"]
    
    let links = ["Website":        "https://www.wirsindfit.at/",
                 "Jumping":         "https://app1.edoobox.com/de/wsf/?q=jumping",
                 "Groupfitness":    "https://app1.edoobox.com/de/wsf/?q=Groupfitness",
                 "Specials":        "https://app1.edoobox.com/de/wsf/?q=special"]

    

    
    var deviceWidth : CGFloat {
        get {
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                return 126
            } else {
                return (view.bounds.size.width - 2) / 3
            }
        }
    }
    
    func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = deviceWidth
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)

        if (UIDevice.current.userInterfaceIdiom == .pad) {
            layout.minimumInteritemSpacing = 80.0
            layout.minimumLineSpacing = 60.0
            layout.footerReferenceSize = CGSize(width: collectionView!.bounds.size.width, height: 48.0)
            layout.headerReferenceSize = CGSize(width: collectionView!.bounds.size.width, height: 48.0)
        } else {
            layout.minimumInteritemSpacing = 1.0
            layout.minimumLineSpacing = 36.0
            layout.footerReferenceSize = CGSize(width: collectionView!.bounds.size.width, height: 24.0)
            layout.headerReferenceSize = CGSize(width: collectionView!.bounds.size.width, height: 24.0)
        }
        


        collectionView!.collectionViewLayout = layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        setupCollectionViewLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.menuLabels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
    
        // Configure the cell
        cell.label.text =  menuLabels[indexPath.row]
        
        switch indexPath.row {
        case 0,3,4,5:
            cell.imageView.image = UIImage(named: "Logo")
        case 1:
            cell.imageView.image = UIImage(named: "location")
        case 2:
            cell.imageView.image = UIImage(named: "calendar")
        case 6:
            cell.imageView.image = UIImage(named: "Team")
        case 7:
            cell.imageView.image = UIImage(named: "Social-Media")
        //case 8:
        //    cell.imageView.image = UIImage(named: "impressum")
        case 8:
            cell.imageView.image = UIImage(named: "FAQ")
        default:
            //cell.imageView.image = UIImage(named: "NoImage")
            break
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let label = self.menuLabels[indexPath.row]
        switch label {
        case "Website",
             "Jumping",
             "Groupfitness",
             "Specials":
            performSegue(withIdentifier: "Website", sender: label)
        case "Impressum", "Social Media":
            performSegue(withIdentifier: label, sender: nil)
        default: break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Website" {
            let label = sender as! String
            
            switch label {
            case "Website",
                 "Jumping",
                 "Groupfitness",
                 "Specials":
                let destVC = segue.destination as! WebsiteViewController
                destVC.title = label
                destVC.webUrl = URL(string: links[label]!)
            default: break
            }
        
        }
    }


}

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!

}
