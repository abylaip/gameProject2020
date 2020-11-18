//
//  GameViewController.swift
//  gameProject
//
//  Created by Abyl on 6/22/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var gameName: UILabel!
    @IBOutlet var gameGenre: UILabel!
    @IBOutlet var gameSize: UILabel!
    @IBOutlet var gameDate: UILabel!
    @IBOutlet var gameDesc: UITextView!
    
    var name = ""
    var genre = ""
    var size = ""
    var date = ""

    override func viewDidLoad() {
        super.viewDidLoad()
//        gameName.text = name
//        gameGenre.text = genre
//        gameDate.text = date
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
