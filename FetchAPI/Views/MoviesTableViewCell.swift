//
//  MoviesTableViewCell.swift
//  FetchAPI
//
//  Created by Kerem Demir on 24.07.2023.
//

import Foundation
import UIKit

final class MoviesTableViewCell: UITableViewCell {
    static let cellIdentifier = "MoviesTableViewCell"
    
    public var id: UILabel = {
        let id = UILabel()
        id.translatesAutoresizingMaskIntoConstraints = false
        id.text = "id"
        id.textColor = .label
        id.font = UIFont(name:"", size: 20)
        return id
    }()
    
    public var name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "name"
        name.textColor = .label
        name.font = UIFont.boldSystemFont(ofSize: 20)
        return name
    }()
    
    public var year: UILabel = {
        let year = UILabel()
        year.translatesAutoresizingMaskIntoConstraints = false
        year.text = "year"
        year.textColor = .label
        year.font = UIFont(name:"", size: 20)
        return year
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func configure(){
        self.contentView.addSubViews(id, name, year)
        addConstraints()
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            id.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            id.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            
            name.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            year.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            year.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
    }
}
