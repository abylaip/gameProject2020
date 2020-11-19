//
//  HomeViewController.swift
//  gameProject
//
//  Created by Abyl on 6/5/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit
import AlamofireImage
import PaginatedTableView

struct jsonFile: Decodable {
    let data: [MyData]
}

struct MyData: Decodable {
    let name: String
    let genres: [String]
    let createdAt: String
    let size: [Size]
}

struct Size: Decodable {
    let unit: String
    let value: Double
}

class HomeOneViewController: UIViewController, PaginatedTableViewDelegate, PaginatedTableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    @IBOutlet var contentTableView: PaginatedTableView!

    var games = [MyData]()
    
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        refresh(sender: refreshControl)
        
        contentTableView.paginatedDelegate = self
        contentTableView.paginatedDataSource = self
        
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
        let url = URL(string: "http://199.247.31.99:4000/api/global-games?page=\(pageNumber)&limit=10")

        guard let downloadURL = url else {return}
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                guard let data = data else { return }
                            
                do {
                    let decoder = JSONDecoder()
                    let gamess = try decoder.decode(jsonFile.self, from: data)
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
        // else append the data to list
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! gameCell

//        var src = games[indexPath.row].photos[0].src
//        src = src.replacingOccurrences(of: "public/", with: "")
        let url = URL(string: "https://bit.ly/2ZPFrgu")!

        cell.gameImage.layer.cornerRadius = 10
        cell.gameImage.af_setImage(withURL: url)
        cell.gameName.text = games[indexPath.row].name
        cell.gameGenre.text = games[indexPath.row].genres.joined(separator: ", ")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController
        let first10 = String(games[indexPath.row].createdAt.prefix(10))
        vc?.date = first10
        vc?.name = games[indexPath.row].name
        vc?.genre = games[indexPath.row].genres.joined(separator: ", ")
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
