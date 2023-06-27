//
//  cell.swift
//  iOsdemos
//
//  Created by Irvin Leon on 31/03/23.
//

import UIKit


final class CatImageCell: UICollectionViewCell {

    private var imageView: UIImageView!
    var maxRetry = 3
    var succeed = false

    convenience init(imageView: UIImageView) {
        self.init()

        self.imageView = imageView
    }

    func set(model: CatImageCellModel) {
        
        repeat {
            model.fetchCatImage { result in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.imageView.image = success
                    }
                    self.succeed = true
                case .failure(let failure):
                    if failure == .timeout {
                        self.maxRetry = self.maxRetry - 1
                    } else {
                        DispatchQueue.main.async {
                            self.imageView.image = model.placeholderImage
                        }
                    }
                }
            }
        } while maxRetry > 0 && !succeed
    }
    
    override func prepareForReuse() {
        maxRetry = 3
        DispatchQueue.main.async {
            self.imageView.image = nil
        }
    }
    
}


enum ImageFetchingError: Error {
    
    case timeout
    case unknown
}

protocol CatImageCellModel {
    var placeholderImage: UIImage { get }
    func fetchCatImage(completion: @escaping (Result<UIImage, ImageFetchingError>) -> Void)
    
}
