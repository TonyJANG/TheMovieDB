//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var moviesArray = [AnyObject]()
    let base_url = ["https://image.tmdb.org/t/p"]
    let file_size = ["/w92"]
    var urlImage = [String]()
    var countMoviesArray = [Int]()
    var img = [Int: UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1").responseJSON { response in
            if let dict = response.result.value as? [String: AnyObject] {
                if let innerDict = dict["results"] {
                    self.moviesArray = innerDict as! [AnyObject]
//                    print(self.moviesArray.count)
                    

                    
                    for item in 0...(self.moviesArray.count-1) {
                        Alamofire.request("https://image.tmdb.org/t/p/w92"+"\(self.moviesArray[item]["poster_path"] as! String)").responseImage { response in
//                            print(response.request)
                            if let image = response.result.value as UIImage! {
                                self.img[item] = image
                                //tenìa self.img = [item: image] horas para caer en cuenta
                                print(self.img.count)
//                                self.tableView.reloadData()
//                                print(self.img)
                            }
                        }
                    }
                    
//                    print("end")
                    self.tableView.reloadData()
                }
            }
        }
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell
        let title = moviesArray[indexPath.row]["title"]
        cell?.titleLabel.text = title as? String
        let fck = img
        cell?.imageCell.image = fck[indexPath.row]
        print(img[0])
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

