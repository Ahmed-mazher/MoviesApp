//
//  ViewController.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    lazy var viewModel: MoviesListViewModel = {
        return MoviesListViewModel()
    }()
    
    var resultsArr = [Results]()
    
    var moviesTableView: UITableView = {
        let moviesTableView = UITableView()
        moviesTableView.rowHeight = 150
        moviesTableView.backgroundColor = .white
        moviesTableView.separatorColor = UIColor.systemGray4.withAlphaComponent(0.2)
        moviesTableView.registerNib(cell: MovieTVCell.self)
        return moviesTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies List"
        configureTableView()
        initVM()
    }
    
    func configureTableView() {
        view.addSubview(moviesTableView)
        moviesTableView.frame = view.bounds
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    func initVM(){
        // Naive binding
        
        viewModel.updateTableView = { [weak self] () in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                let movies = self.viewModel.getMovies
                self.resultsArr = movies 
                self.moviesTableView.reloadData()
            }
        }
        
        viewModel.getMoviesData()
    
    }
    
    
}


extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as MovieTVCell
        
        let item = resultsArr[indexPath.row]
        
        cell.movieTitle.text = item.title
        cell.movieOverview.text = item.overview
        cell.movieReleaseDate.text = item.release_date
        
        return cell
    }
    
}

extension MoviesListViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (moviesTableView.contentSize.height-100-scrollView.frame.size.height){
            
            guard !viewModel.isPaginating else{
                // already add pagination
                return
            }
            print("Fetch")
            viewModel.getMoviesData(pagination: true)
        }
    }
}
