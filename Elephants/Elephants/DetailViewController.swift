//
//  ViewController.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var elephant : Elephant = Elephant()

    lazy var uitv_TableView : UITableView = {
       
        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.uitv_TableView)

    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        if let imageURL = elephant.image {
            if let url = URL(string: imageURL) {
                if let data = try? Data(contentsOf: url) {
                    content.image = UIImage(data: data)
                    content.imageProperties.reservedLayoutSize = CGSize(width: 50.0, height: 50.0)
                    content.imageProperties.maximumSize = CGSize(width: 50.0, height: 50.0)
                    //content.imageProperties.cornerRadius = (content.image?.size.height)! / 2
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


