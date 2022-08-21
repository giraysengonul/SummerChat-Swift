//
//  ChatViewController.swift
//  SummerChat-Swift
//
//  Created by hakkı can şengönül on 16.08.2022.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let error as NSError{
            let alert = AlertHelper.alert(withMessage: error.localizedDescription)
            present(alert, animated: true)
        }
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        
    }
}
// MARK: - Helpers
extension ChatViewController{
    private func style(){
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationItem.hidesBackButton = true
        navigationItem.title = "Summer Chat"
    }
}
