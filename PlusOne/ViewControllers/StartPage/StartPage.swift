//
//  StartPage.swift
//  PlusOne
//
//  Created by Manjul Shrestha on 11/1/17.
//  Copyright © 2017 Manjul Shrestha. All rights reserved.
//

import UIKit

class StartPage: UIViewController {
    @IBOutlet weak var hostBtn: UIButton!
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var profileImgView: UIImageView!
    

    var loggedInUser : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        profileImgView.layer.borderWidth = 1
        profileImgView.layer.masksToBounds = false
        profileImgView.layer.borderColor = UIColor.black.cgColor
        profileImgView.layer.cornerRadius = profileImgView.frame.height/2
        profileImgView.clipsToBounds = true
        let picURL = "https://graph.facebook.com/\(loggedInUser.userID as String)/picture?type=large"
        let url = URL(string: picURL)
        let data = try? Data(contentsOf: url!)
        profileImgView.image = UIImage(data: data!)
    
        nameLbl.text = loggedInUser.Name
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hostAction(_ sender: UIButton) {
        let eventCreateStory : UIStoryboard = UIStoryboard(name: "EventCreate", bundle: nil)
        let eventCreate : UIViewController = eventCreateStory.instantiateViewController(withIdentifier: "EventCreate")
        self.navigationController?.pushViewController(eventCreate, animated: true)
    }
    
    
    @IBAction func guestAction(_ sender: UIButton) {
        let mapStoryboard : UIStoryboard = UIStoryboard(name: "MapPage", bundle: nil)
        let mapPage : UIViewController = mapStoryboard.instantiateViewController(withIdentifier: "MapPage")
        self.navigationController?.pushViewController(mapPage, animated: true)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
