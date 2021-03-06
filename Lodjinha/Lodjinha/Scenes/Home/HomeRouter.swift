//
//  HomeRouter.swift
//  Lodjinha
//
//  Created by Gilson Gil on 22/02/19.
//  Copyright (c) 2019 Gilson Gil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeRoutingLogic {
  func routeToCategory(with category: Category)
  func routeToProductDetails(with product: Product)
}

protocol HomeDataPassing {
  var dataStore: HomeDataStore? { get }
}

final class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?

  func routeToCategory(with category: Category) {
    let viewController = CategoryViewController()
    guard let homeViewController = self.viewController,
      var destinationDataStore = viewController.router?.dataStore else { return }
    passDataToCategory(category: category, destination: &destinationDataStore)
    navigateToCategory(source: homeViewController, destination: viewController)
  }

  func routeToProductDetails(with product: Product) {
    let viewController = ProductDetailsViewController()
    guard let homeViewController = self.viewController,
      var destinationDataStore = viewController.router?.dataStore else { return }
    passDataToProductDetails(product: product, destination: &destinationDataStore)
    navigateToProductDetails(source: homeViewController, destination: viewController)
  }

  // MARK: Navigation

  func navigateToCategory(source: HomeViewController, destination: CategoryViewController) {
    source.navigationController?.pushViewController(destination, animated: true)
  }

  func navigateToProductDetails(source: HomeViewController, destination: ProductDetailsViewController) {
    source.navigationController?.pushViewController(destination, animated: true)
  }

  // MARK: Passing data

  func passDataToCategory(category: Category, destination: inout CategoryDataStore) {
    destination.category = category
  }

  func passDataToProductDetails(product: Product, destination: inout ProductDetailsDataStore) {
    destination.product = product
  }
}
