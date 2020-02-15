//
//  FavoritesViewController.swift
//  inTheWorld
//
//  Created by Shengsheng Xu on 2/14/20.
//  Copyright © 2020 Shengsheng Xu. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var exitButton: UIButton!
    
    var favPlaces : [String] = DataManager.sharedInstance.listFavorites()
    
    weak var delegate: PlacesFavoriteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func exit(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.favoritePlace(name: favPlaces[indexPath.row])
        dismiss(animated: true)
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "favCell")
        cell.textLabel?.text = favPlaces[indexPath.row]
        return cell
    }
}
