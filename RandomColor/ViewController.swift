//
//  ViewController.swift
//  RandomColor
//
//  Created by LUIS GONZALEZ on 01/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var colors : [UIColor] = []
    
    enum cells {
        static let colorCell = "colorCell"
    }
    
    enum segues {
        static let toDetailView = "ToColorsDetailVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }

    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailViewController
        destVC.color = sender as? UIColor
    }
}



extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cells.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: segues.toDetailView, sender: color)
    }
    
}
