//
//  UserTableViewCell.swift
//  CoreDataMachineTest
//
//  Created by Prashant Gaikwad on 31/05/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    var user: User? {
        didSet {
            setupData()
        }
    }
    
    private func setupData() {
        guard let user = user else { return }
        if let url = URL(string: user.avatar) {
            userImageView.kf.setImage(with: url)
        }
        
        userNameLabel.text = user.first_name
        userEmailLabel.text = user.email
    }
    
    override func prepareForReuse() {
        userNameLabel.text = nil
        userEmailLabel.text = nil
        userImageView.image = nil
    }
}
