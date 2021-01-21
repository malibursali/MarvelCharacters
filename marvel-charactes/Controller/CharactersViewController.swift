//
//  CharactersViewController.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

import UIKit

class CharactersViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = Data<Character>(total: 0, results: [])
    var page = 0
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - Setup
    
    override func setupComponents() {
        super.setupComponents()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        self.setTitle("Characters")
    }

    
    // MARK: - Actions
    
    @objc func loadTable() {
        self.page += 1
        self.fetchCharacters()
    }
    
    
    // MARK: - Methods
    
    private func fetchCharacters() {
        self.showLoadingView()
        NetworkService.sharedInstance.fetchCharacters(self.page) { (isSuccess, response) in
            self.hideLoadingView()
            
            if isSuccess {
                self.data.total = response.total
                self.data.results.append(contentsOf: response.results)
                self.tableView.reloadData()
            }
            else {
                self.showResponseError()
            }
        }
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHelper.character.id, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        let character = self.data.results[indexPath.row]
        
        cell.character = character
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.3
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.data.results.count - 1 {
            if self.data.isAllCharactersFetched() {
                self.perform(#selector(loadTable), with: nil, afterDelay: 0.5)
            }
        }
    }
}
