//
//  PostListTableViewController.swift
//  Reddit
//
//  Created by Kvng Eko on 11/30/22.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    //MARK: - Properties
    
    var posts: [Post] = []
    
    //MARK: - Lifecycles
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let post = posts[indexPath.row]
        cell.post = post
        
        
        return cell
    }
    
    
    
}

extension PostListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text,
              !searchTerm.isEmpty else { return }
        
        PostController.fetchPostsWith(searchTerm: searchTerm) { result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let posts):
                    self.posts = posts
                    searchBar.resignFirstResponder()
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---n \(error)")
                }
            }
        }
    }
}
