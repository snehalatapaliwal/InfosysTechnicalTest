//
//  ViewController.swift
//  InfosysTechnicalTest
//
//  Created by apple on 28/06/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel: ViewModel?
    let tableView = UITableView() // view
    
    



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        viewModel = ViewModel(viewDelegate: self)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(tableViewCell.self, forCellReuseIdentifier: "cell")

        navigationItem.title = "Contacts"
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableViewCell
                
        cell.model = viewModel!.items[indexPath.row]

        return cell
    }
    
   
    


}

extension ViewController: reloadTableViewDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}
