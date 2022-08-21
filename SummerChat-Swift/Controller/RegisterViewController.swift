//
//  RegisterViewController.swift
//  SummerChat-Swift
//
//  Created by hakkı can şengönül on 16.08.2022.
//

import UIKit
import FirebaseAuth
class RegisterViewController: UIViewController {
     // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
     // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
 // MARK: - Action
    @IBAction func registerButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil{
                    let alert = AlertHelper.alert(withMessage: error!.localizedDescription)
                    self.present(alert, animated: true)
                }else{
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
}
 // MARK: - Helpers
extension RegisterViewController{
    private func style(){
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.cornerRadius = 30
        passwordTextField.backgroundColor = .white
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.cornerRadius = 30
        emailTextField.backgroundColor = .white
    }
}
