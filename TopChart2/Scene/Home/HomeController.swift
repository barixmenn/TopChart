//
//  ViewController.swift
//  TopChart2
//
//  Created by MacBookAir on 19.08.2023.
//
import UIKit

private let resuseIdentifier = "cell"
class HomeController: UIViewController {

    //MARK: - UI Elements
    
    let mySegmentedControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Turkey","Global"])
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        
        return segment
    }()
    private let tableView = UITableView ()
    
    
    //MARK: - Propeties
    private let viewModel = HomeViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.delegate = self
        viewModel.getGlobalSong()
        viewModel.getTurkeySong()
        view.backgroundColor = .white
    }
    
    //MARK: - Setup
    private func setup() {
        style()
        layout()
        tableView.delegate = self
        tableView.dataSource = self
    }

    //MARK: - UI Styling
    private func style() {
        view.addSubview(mySegmentedControl)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: resuseIdentifier)
 
    }
    
    //MARK: - Autolayout
    private func layout() {
        NSLayoutConstraint.activate([
            mySegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mySegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mySegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: mySegmentedControl.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            
        ])
    }
}


extension HomeController: IHomeViewModel {
    func didErrorList(error: String) {
        print("Error")
    }
    
    func didSuccess() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func segmentedChange(_ sender: Any) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    }


//MARK: - TableViewDelegate - UITableViewDataSource
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch mySegmentedControl.selectedSegmentIndex {
        case 0:
            return viewModel.turkey?.feed.results.count ?? 0
        case 1:
            return viewModel.global?.feed.results.count ?? 0
        default:
            print("Error")
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let global = viewModel.global?.feed.results[indexPath.row]
        let turkey = viewModel.turkey?.feed.results[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseIdentifier, for: indexPath)
        
        switch mySegmentedControl.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = turkey?.name
        case 1:
            cell.textLabel?.text = global?.name
            
        default:
            print("cellForRowAt error")
        }
        return cell
    }
}
