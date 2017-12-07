//
//  Login.swift
//  PlusOne
//
//  Created by Manjul Shrestha on 11/2/17.
//  Copyright © 2017 Manjul Shrestha. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit



class Login: UIViewController, FBSDKLoginButtonDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        loginButton.delegate = self
        loginButton.readPermissions =
        ["public_profile", "email", "user_friends"];
        view.addSubview(loginButton)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        let request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email, picture.type(normal)"])
        let connection = FBSDKGraphRequestConnection()
        connection.add(request, completionHandler: {(connection, result, error) in
            let userInfo = result as? [String: Any]
            let userName = userInfo!["name"] as! String
            let userID = userInfo!["id"] as! String
            
            let loggedUser  = User()
            loggedUser.Name = userName
            loggedUser.userID = userID
            
            let startStory : UIStoryboard = UIStoryboard(name: "StartPage", bundle: nil)
            let startView : StartPage = startStory.instantiateViewController(withIdentifier: "StartPage") as! StartPage
            startView.loggedInUser = loggedUser
            let navController : UINavigationController = UINavigationController(rootViewController: startView)
            self.present(navController, animated: true, completion: nil)

        })
         connection.start()
        
//        let startStory : UIStoryboard = UIStoryboard(name: "StartPage", bundle: nil)
//        let startView : UIViewController = startStory.instantiateViewController(withIdentifier: "StartPage")
//        let navController : UINavigationController = UINavigationController(rootViewController: startView)
//        self.present(navController, animated: true, completion: nil)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
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
