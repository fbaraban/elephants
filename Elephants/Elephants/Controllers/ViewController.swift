//
//  ViewController.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    let api = API()
    var elephants : [Elephant] = []
    var error = ""

    lazy var uitv_TableView : UITableView = {
       
        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Elephants"
        
        self.view.addSubview(self.uitv_TableView)
        
        api.getElephants(urlString: api.setElephantsURL(), method: .GET) { elephants in
            self.elephants = elephants
            DispatchQueue.main.async {
                self.uitv_TableView.reloadData()
            }
            print("ELEPHANTS: \(self.elephants.count)")
        } errorReturned: { error in
            self.error = error
        }

    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elephants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        var content = cell.defaultContentConfiguration()
        let elephant = self.elephants[indexPath.row]
        if let imageURL = elephant.image {
            if let url = URL(string: imageURL) {
                if let data = try? Data(contentsOf: url) {
                    content.image = UIImage(data: data)
                    content.imageProperties.reservedLayoutSize = CGSize(width: 50.0, height: 50.0)
                    content.imageProperties.maximumSize = CGSize(width: 50.0, height: 50.0)
                    content.imageProperties.cornerRadius = (content.image?.size.height)! / 4
                }
            }
        }
        if let texto = elephant.name {
            content.text = texto
        }
        if let note = elephant.note {
            content.secondaryText = note
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailViewController()
        dvc.elephant = self.elephants[indexPath.row]
        dvc.title = dvc.elephant.name
        self.show(dvc, sender: nil)
    }
    
}

