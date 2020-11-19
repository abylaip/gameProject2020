//
//  SearchViewController.swift
//  gameProject
//
//  Created by Abyl on 6/5/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit
import AlamofireImage
import PaginatedTableView

struct fileJSON: Decodable {
    let data: [dataMy]
}

struct dataMy: Decodable {
    let name: String
    let genres: [String]
}

class HomeViewController: UIViewController, PaginatedTableViewDelegate, PaginatedTableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    @IBOutlet var searchGame: UISearchBar!
    @IBOutlet var contentTableView: PaginatedTableView!
    
    var games = [dataMy]()
    var filteredData: [String]!
    var searchItem: String = ""
    
    
    var refreshControl = UIRefreshControl()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        refresh(sender: refreshControl)
        
        contentTableView.paginatedDelegate = self
        contentTableView.paginatedDataSource = self
        searchGame.delegate = self
        
//        refreshControl.attributedTitle = NSAttributedString(string: " ")
//        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
//        contentTableView.addSubview(refreshControl)
        
        contentTableView.loadData(refresh: true)
    }
    
    
    
    @objc func refresh(sender:AnyObject) {
        downloadJSON(pageNumber: 1, completion: { [weak self] _ in
            self?.contentTableView.reloadData()
        })
        refreshControl.endRefreshing()
    }
    
    func downloadJSON(pageNumber: Int, completion: ((_ sucess: Bool) -> Void)? ) {
        let url = URL(string: "http://199.247.31.99:4000/api/global-games?search=\(searchItem)&page=\(pageNumber)&limit=10")
        print(searchItem)
        guard let downloadURL = url else {return}
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                guard let data = data else { return }
                            
                do {
                    let decoder = JSONDecoder()
                    let gamess = try decoder.decode(fileJSON.self, from: data)
                    if pageNumber == 1 {
                            self.games = gamess.data
                    } else {
                        self.games.append(contentsOf: gamess.data)
                    }
                    completion?(true)
                    
                } catch let jsonErr {
                    print("Error serializing json:", jsonErr)
                    completion?(false)
                }
            })
        }.resume()
    }
    
    func loadMore(_ pageNumber: Int, _ pageSize: Int, onSuccess: ((Bool) -> Void)?, onError: ((Error) -> Void)?) {
        // Call your api here
        // Send true in onSuccess in case new data exists, sending false will disable pagination
        
        // If page number is first, reset the list
//        if pageNumber == 1 { games = [] }
        downloadJSON(pageNumber: pageNumber) { (success) in
            if success {
                onSuccess?(true)
            } else {
                onError?(NSError(domain: "Unknown error", code: 101, userInfo: [:]))
            }
        }
//         else append the data to list
//        self.list.append(apiResponseList)
        
        // If Api responds with error
//        onError?(apiError)

        // Else end success with flag true if more data available
//        let moreDataAvailable = !apiResponseList.isEmpty
//        onSuccess?(moreDataAvailable)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! searchCell

//        var src = games[indexPath.row].photos[0].src
//        src = src.replacingOccurrences(of: "public/", with: "")
        let url = URL(string: "https://bit.ly/2ZPFrgu")!

        cell.searchImage.layer.cornerRadius = 10
        cell.searchImage.af_setImage(withURL: url)
        cell.searchName.text = games[indexPath.row].name
        cell.searchGenre.text = games[indexPath.row].genres.joined(separator: ", ")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController
//        let first10 = String(games[indexPath.row].createdAt.prefix(10))
//        vc?.date = first10
//        vc?.name = games[indexPath.row].name
//        vc?.genre = games[indexPath.row].genres.joined(separator: ", ")
//
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SellGameViewController")
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchItem = (searchGame.text?.lowercased())!
        //print(searchItem)
        refresh(sender: refreshControl)

    }
    
}
