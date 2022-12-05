//
//  PostTableViewCell.swift
//  Reddit
//
//  Created by Kvng Eko on 11/30/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postUpsLabel: UILabel!
    
    
    var post: Post? {
        didSet {
            updateViews()
            
        }
    }
    
    func updateViews() {
        guard let post = post else {return}
        postTitleLabel.text = post.title
        postUpsLabel.text = "Upvotes: \(post.ups)"
        
        PostController.fetchThumbnailFor(post: post) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let thumbnail):
                    self.postImageView.image = thumbnail
                case .failure(let error):
                    self.postImageView.image = UIImage(systemName: "photo.on.rectangle.fill")
                    print("Error in \(#function) : \(error.localizedDescription) \n---n \(error)")
                }
            }
        }
    }
    
    
}
