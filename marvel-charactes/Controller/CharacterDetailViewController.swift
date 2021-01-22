//
//  CharacterDetailViewController.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 22.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit


class CharacterDetailViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var character: Character? {
        didSet {
            if let character = character {
                self.setTitle(character.name)
            }
            else {
                self.setTitle("")
            }
            
            self.setFavoriteButton()
        }
    }
    var data = Data<Comic>(total: 0, results: [])
    var page = 0
    
    var isFavoriteCharacter: Bool {
        get {
            return self.character?.id == Utility.sharedInstance.getFavoriteCharacter()
        }
    }
    var isFavoritePage = false
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.isFavoritePage {
            self.fetchFavoriteCharacter()
        }
        else {
            self.fetchComics()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.checkFavoriteCharacter()
    }
    
    
    // MARK: - Setup
    
    override func setupComponents() {
        super.setupComponents()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        self.showNavigationBar()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if let character = self.character {
            self.setTitle(character.name)
        }
        
        self.setFavoriteButton()
    }

    
    // MARK: - Actions
    
    @objc func favoriteButtonDidTapped(_ sender: UIBarButtonItem) {
        if self.isFavoriteCharacter {
            sender.image = ImageHelper.heart.systemImage
            Utility.sharedInstance.saveFavoriteCharacter(0)
        }
        else {
            sender.image = ImageHelper.heartFill.systemImage
            if let characterId = self.character?.id {
                Utility.sharedInstance.saveFavoriteCharacter(characterId)
            }
        }
        
        if isFavoritePage {
            self.fetchFavoriteCharacter()
        }
    }
    
    @objc func loadTable() {
        self.page += 1
        self.fetchComics()
    }
    
    
    // MARK: - Methods
    
    func setFavoriteButton() {
        if self.isFavoriteCharacter {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageHelper.heartFill.systemImage, style: .plain, target: self, action: #selector(self.favoriteButtonDidTapped(_:)))
        }
        else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageHelper.heart.systemImage, style: .plain, target: self, action: #selector(self.favoriteButtonDidTapped(_:)))
        }
    }
    
    func fetchComics() {
        if let character = self.character {
            self.showLoadingView()
            
            NetworkService.sharedInstance.fetchComics(character.id, self.page) { (isSuccess, response) in
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
    
    func fetchFavoriteCharacter() {
        let characterId = Utility.sharedInstance.getFavoriteCharacter()
        
        if characterId != 0 {
            self.showLoadingView()
            self.view.isUserInteractionEnabled = true
            
            NetworkService.sharedInstance.fetchCharacter(withId: characterId) { (isSuccess, response) in
                self.hideLoadingView()
                
                if isSuccess {
                    if let character = response.results.first {
                        self.character = character
                        self.data = Data<Comic>(total: 0, results: [])
                        self.fetchComics()
                    }
                }
                else {
                    self.character = nil
                    self.data = Data<Comic>(total: 0, results: [])
                    self.tableView.reloadData()
                    self.showResponseError()
                }
            }
        }
        else {
            self.character = nil
            self.data = Data<Comic>(total: 0, results: [])
            self.tableView.reloadData()
            self.view.isUserInteractionEnabled = false
            self.showAlert(title: "Warning", message: "Favorite character did not selected.")
        }
    }
    
    func checkFavoriteCharacter() {
        if self.isFavoritePage {
            if !self.isFavoriteCharacter {
                self.fetchFavoriteCharacter()
            }
        }
    }
}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.results.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHelper.characterInfo.id, for: indexPath) as? CharacterInfoTableViewCell else {
                return UITableViewCell()
            }
            
            cell.character = self.character
            
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHelper.comic.id, for: indexPath) as? ComicTableViewCell else {
                return UITableViewCell()
            }
            let comic = self.data.results[indexPath.row-1]
            
            cell.comic = comic
            cell.sizeToFit()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row-1 == self.data.results.count {
            if self.data.isAllCharactersFetched() {
                self.perform(#selector(loadTable), with: nil, afterDelay: 0.5)
            }
        }
    }
}
