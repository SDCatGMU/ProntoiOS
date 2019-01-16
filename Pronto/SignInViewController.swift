//
//  SignInViewController.swift
//  Pronto
//
//  Created by Steve Sahayadarlin on 1/15/19.
//  Copyright © 2019 Steve Sahayadarlin. All rights reserved.
//
import UIKit
import Firebase

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                //self.present(alertController, animated: true, completion: nil)
                
                DispatchQueue.main.async {
                    self.getTopMostViewController()?.present(alertController, animated: true, completion: nil)
                }
            } else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabs") as! MainTabController
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func getTopMostViewController() -> UIViewController? {
        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
        
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        
        return topMostViewController
    }
    
}
