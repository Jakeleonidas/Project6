//
//  PostCell.swift
//  BeReal.
//
//  Created by Jorge Marquez on 2/25/24.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    @IBOutlet private weak var blurView: UIVisualEffectView!

    private var imageDataRequest: DataRequest?

    func configure(with post: Post) {
        
        if let user = post.user {
            usernameLabel.text = user.username
        }

        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {

            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    
                    self?.postImageView.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }

        
        captionLabel.text = post.caption

        
        if let date = post.createdAt {
            dateLabel.text = DateFormatter.postFormatter.string(from: date)
        }

       
        if let currentUser = User.current,

           
           let lastPostedDate = currentUser.lastPostedDate,

  
           let postCreatedDate = post.createdAt,

           let diffHours = Calendar.current.dateComponents([.hour], from: postCreatedDate, to: lastPostedDate).hour {

             // Hide the blur view if the given post was created within 24 hours of the current user's last post. (before or after)
             blurView.isHidden = abs(diffHours) < 24
         } else {

             // Default to blur if we can't get or compute the date's above for some reason.
             blurView.isHidden = false
         }

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        postImageView.image = nil

        imageDataRequest?.cancel()
    }
}
