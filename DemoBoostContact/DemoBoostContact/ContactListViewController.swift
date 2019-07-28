//
//  ContactListViewController.swift
//  DemoBoostContact
//
//  Created by Amit Gupta on 28/07/2019.
//  Copyright © 2019 Amit Gupta. All rights reserved.
//

import UIKit

class ContactTblViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgViewContact: UIImageView!
}

class ContactListViewController: UIViewController {

    // MARK: - Identifiers
    private var arrContactList: [Contact]?
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblViewRoutesList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = NSLocalizedString("Contacts", comment: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.arrContactList = self.loadJson(filename: "data")
        self.tblViewRoutesList.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Mapping JSON data to Array Objects
    func loadJson(filename fileName: String) -> [Contact]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Contact].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

extension ContactListViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self .arrayHotelList .count
        return self.arrContactList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: .cellContactList, for: indexPath) as! ContactTblViewCell
        
        cell.imgViewContact.layer.cornerRadius = cell.imgViewContact.frame.height/2.0
        
        let objContact = self.arrContactList?[indexPath.row]
        
        cell.lblName.text = "\(objContact?.firstName ?? "") \(objContact?.lastName ?? "")"
        
        cell .selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


