//
//  ViewController.swift
//  FetchAPI
//
//  Created by Kerem Demir on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var myMovies: [Movies]? {
        didSet {
            DispatchQueue.main.async { [self] in 
                movieTableView.reloadData()
            }
            print("Movies was set.")
        }
    }
    
    private let movieTableView: UITableView = {
        let movieTableView = UITableView()
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.backgroundColor = .systemBackground
        movieTableView.tableFooterView = UIView()
        movieTableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.cellIdentifier)
        return movieTableView
    }()
    
    let movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configure()
        movieManager.fetchMovies { movies in
            DispatchQueue.main.async { [self] in
                navigationItem.title = movies.title
            }
            self.myMovies = movies.movies
        }
    }
    
    private func configure(){
        view.addSubview(movieTableView)
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = myMovies?[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.cellIdentifier, for: indexPath) as? MoviesTableViewCell else {
            fatalError("Unsupported cell..")
         }
        
        cell.id.text = "\(movies?.id ?? "")."
        cell.name.text = movies?.title
        cell.year.text = movies?.releaseYear
        
        return cell
    }
}
