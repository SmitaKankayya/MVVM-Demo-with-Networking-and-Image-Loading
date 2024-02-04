//
//  ProductListViewController.swift
//  MVVM_Demo
//
//  Created by Smita Kankayya on 04/02/24.
//

import UIKit

class ProductListViewController: UIViewController {
    private var viewModel = ProductViewModel()
    @IBOutlet weak var productTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
        configuration()
    }
}

extension ProductListViewController{
    func configuration(){
        registerXIBWithTableView()
        initViewModel()
        observeEvent()
    }
    
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "ProductTableViewCell" )
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event
            in
            guard let self else {
                return
            }
            
            switch event{
            case .loading :
                print("Products Loaded")
            case .stopLoading:
                print("Stop Loading")
            case.dataLoaded:
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
            
        }
    }
}

//MARK : UITableViewDataSource
extension ProductListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        productTableViewCell.layer.borderWidth = 0.5
        productTableViewCell.layer.borderColor = UIColor.black.cgColor
        productTableViewCell.product = viewModel.products[indexPath.row]
        return productTableViewCell
    }
}

//MARK : UITableViewDelegate
extension ProductListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
}
