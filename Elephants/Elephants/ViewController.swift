//
//  ViewController.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import UIKit

class ViewController: UIViewController {

    let api = API()
    var elephants: [Elephant] = []
    var error = ""

    lazy var uitvTableView: UITableView = {

        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.addSubview(self.uitvTableView)

        api.getElephants(urlString: api.setElephantsURL(), method: .GET) { elephants in
            self.elephants = elephants
            DispatchQueue.main.async {
                self.uitvTableView.reloadData()
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
        var content = cell.defaultContentConfiguration()
        let elephant = self.elephants[indexPath.row]
        if let imageURL = elephant.image {
            if let url = URL(string: imageURL) {
                if let data = try? Data(contentsOf: url) {
                    content.image = UIImage(data: data)
                    content.imageProperties.reservedLayoutSize = CGSize(width: 50.0, height: 50.0)
                    content.imageProperties.maximumSize = CGSize(width: 50.0, height: 50.0)
                    // content.imageProperties.cornerRadius = (content.image?.size.height)! / 2
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

}
