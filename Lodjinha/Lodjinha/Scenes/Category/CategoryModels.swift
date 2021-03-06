//
//  CategoryModels.swift
//  Lodjinha
//
//  Created by Gilson Gil on 24/02/19.
//  Copyright (c) 2019 Gilson Gil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum CategoryScene {
  enum DisplayTitle {
    struct Request {}
    struct Response {
      let category: Category
    }
    struct ViewModel {
      let title: String
    }
  }

  enum FetchProducts {
    struct Request {}
    struct Response {
      let products: [Product]
      let shouldLoadMore: Bool
    }
    struct ViewModel {
      let displayedProducts: [DisplayedProduct]
      let shouldLoadMore: Bool
    }
  }

  enum PresentProduct {
    struct Request {
      let index: Int
    }
    struct Response {
      let product: Product
    }
    struct ViewModel {
      let product: Product
    }
  }
}
