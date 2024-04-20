import UIKit

final class ProductListItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ProductListItemCell.self)
    static let height = CGFloat(140)

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var productImageView: UIImageView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    private var viewModel: ProductsListItemViewModel!

    func fill(with viewModel: ProductsListItemViewModel) {
        self.viewModel = viewModel

        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price.description
        descriptionLabel.text = viewModel.description
        updateImage()
    }

    // MARK: - Private functions
    
    private func updateImage() {
        productImageView.image = nil
        activityIsRunning(true)

        viewModel.getImageData(completion: { [weak self] data in
            self?.activityIsRunning(false)
            self?.productImageView.image = UIImage(data: data)
        })
    }
    
    private func activityIsRunning(_ isRunning: Bool) {
        if isRunning {
            activityIndicatorView.isHidden = false
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
            activityIndicatorView.isHidden = true
        }
    }
}
