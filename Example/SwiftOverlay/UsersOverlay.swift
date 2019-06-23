//
//  UsersOverlay.swift
//  SwiftOverlay_Example
//
//  Created by Samvel on 6/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SwiftOverlay
import Kingfisher

class UsersOverlay: OverlayVC  {
    
    @IBOutlet weak var tableContentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    private var data:[User] = []
    private var dataTask: URLSessionDataTask?
    private let defaultSession = URLSession(configuration: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.scrollView = tableView
        self.containerView = tableContentView
        self.setupPanView(pan: getPanView())
        //
        fetchUsers()
    }
    
    func getPanView() -> UIView {
        let panWidth:CGFloat = 50
        let x = UIScreen.main.bounds.width/2 - panWidth/2
        let panView = UIView(frame: .init(origin: .init(x: x, y: 25), size: .init(width: panWidth, height: 10)))
        panView.layer.cornerRadius = 5
        panView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        return panView
    }
    
    func fetchUsers() {
        if var urlComponents = URLComponents(string: "https://api.github.com/users") {
            
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                if let data = data,
                    let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    self.data = dict?.map({User(with: $0)}) ?? []
                    DispatchQueue.main.async { [weak self] in
                        self?.tableView.reloadData()
                    }
                }
            }
            dataTask?.resume()
        }
    }
    
}

extension UsersOverlay: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfile", for: indexPath)
        let user = data[indexPath.row]
        cell.textLabel?.text = user.username
        cell.imageView?.kf.setImage(with: user.avatar, placeholder: UIImage(named: "defoultAvatar"))
        return cell
    }
    
    
}
