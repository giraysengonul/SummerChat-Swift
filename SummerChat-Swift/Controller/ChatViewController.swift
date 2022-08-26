//
//  ChatViewController.swift
//  SummerChat-Swift
//
//  Created by hakkı can şengönül on 16.08.2022.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var message:[Message] = [
        Message(sender: "1@gmail.com", body: "Hello!!"),
        Message(sender: "2@gmail.com", body: "Hello!!"),
        Message(sender: "3@gmail.com", body: "Hello!!"),
        Message(sender: "4@gmail.com", body: "Hello!!")
    ]
    // MARK: - LifeCycle
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
        //tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
    }
}
// MARK: - TableView Delegate and DataSource
extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message[indexPath.row].body
        return cell
    }
    
}
