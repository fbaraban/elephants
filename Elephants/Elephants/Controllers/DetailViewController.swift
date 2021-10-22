//
//  ViewController.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var elephant : Elephant = Elephant()
    private let reuseIdentifier =  "Cell"

    lazy var uitv_TableView : UITableView = {
       
        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.uitv_TableView)
        self.uitv_TableView.reloadData()

    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        return self.returnElephantCell(indexPath: indexPath)
    }
    
    func setImage(elephant: Elephant, cell: UITableViewCell) -> UITableViewCell {
        guard let cell = cell as? ImageViewCell else {return UITableViewCell() }
        guard let urlString = elephant.image else { return UITableViewCell() }
        guard let url = URL(string: urlString) else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setImageView(url: url)
        return cell
        
    }
    
    func setName(elephant: Elephant) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.selectionStyle = .none
        guard let name = elephant.name else { return UITableViewCell() }
        cell.textLabel?.text = "Name: \(name)"
        return cell
    }
    
    func setSpecies(elephant: Elephant) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.selectionStyle = .none
        guard let species = elephant.species else { return UITableViewCell() }
        cell.textLabel?.text = "Species: \(species)"
        return cell
    }
    
    func setSex(elephant: Elephant) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.selectionStyle = .none
        guard let sex = elephant.sex else { return UITableViewCell() }
        cell.textLabel?.text = "Sex: \(sex)"
        return cell
    }
    
    func setWikilink(elephant: Elephant) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        guard let wikilink = elephant.wikilink else { return UITableViewCell() }
        cell.textLabel?.text = "Wikilink: \(wikilink)"
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func setNote(elephant: Elephant) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.selectionStyle = .none
        guard let note = elephant.note else { return UITableViewCell() }
        cell.textLabel?.text = "Note: \(note)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
    func returnElephantCell(indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let imageCell = ImageViewCell()
                return setImage(elephant: elephant, cell: imageCell)
            case 1:
                return setName(elephant: elephant)
            case 2:
                return setSpecies(elephant: elephant)
            case 3:
                return setSex(elephant: elephant)
            case 4:
                return setWikilink(elephant: elephant)
            case 5:
                return setNote(elephant: elephant)
            default:
                return UITableViewCell()
        }
    }
    
}



