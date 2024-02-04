//
//  ProductTableViewCell.swift
//  MVVM_Demo
//
//  Created by Smita Kankayya on 04/02/24.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productRateLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    
    //observer property
    var product : Product?{
        didSet{
            productConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func productConfiguration(){
        guard let product else {
            return
        }
        productImageView.kf.setImage(with: URL(string: product.image))
        self.productIdLabel.text = String(product.id)
        self.productTitleLabel.text = product.title
        self.productPriceLabel.text = String(product.price)
        self.productCategoryLabel.text = product.category
        self.productRateLabel.text = String(product.rating.rate)
        self.productCountLabel.text = String(product.rating.count)
        
    }
    
}
