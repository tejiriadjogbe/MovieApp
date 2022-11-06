//
//  HomeViewController.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 30/10/2022.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var banner: CarbonBanner!
    @IBOutlet weak var topMovies: HorizontalScrollView!
    @IBOutlet weak var badassMovies: HorizontalScrollView!
    
    let acivityView = ActivityView()
    var mainMovie: Movies? = nil
    var movieList: [Movies] = []
    var badAssList: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acivityView.showActivityIndicator(on: view)
        loadMainMovie()
        loadMovies()
        loadBadAssMovies()
        banner.model = CarbonBannerModel(imageURL: "movie.poster", title: "Game", type: "sdsd")
    }

    func loadMovies() {
        Task {
            do {
                let movies = try await Webservice().load(Movies.all())
                movieList = movies.search
                acivityView.hideActivityIndicator()
                var moviePosters: [MoviePoster] = []
                DispatchQueue.main.async { [weak self] in
                    self?.movieList.forEach() {
                        let poster = MoviePoster(size: (150, 200))
                        poster.model = MoviePosterModel(title: $0.title, image: $0.poster)
                        moviePosters.append(poster)
                    }
                    self?.topMovies.addItems(moviePosters)
                }
            } catch {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func loadBadAssMovies() {
        Task {
            do {
                let movies = try await Webservice().load(Movies.all(page: 2))
                movieList = movies.search
                acivityView.hideActivityIndicator()
                var moviePosters: [MoviePoster] = []
                DispatchQueue.main.async { [weak self] in
                    self?.movieList.forEach() {
                        let poster = MoviePoster(size: (150, 200))
                        poster.model = MoviePosterModel(title: $0.title, image: $0.poster)
                        moviePosters.append(poster)
                    }
                    self?.badassMovies.addItems(moviePosters)
                }
            } catch {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func loadMainMovie() {
        Task {
            do {
                let movie = try await Webservice().load(Movies.main)
                print(movie)
                acivityView.hideActivityIndicator()
                mainMovie = movie
                DispatchQueue.main.async { [weak self] in
                    self?.banner.model = CarbonBannerModel(imageURL: movie.poster, title: movie.title, type: movie.plot ?? "")
                }
            } catch {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
