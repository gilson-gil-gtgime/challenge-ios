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

@objc protocol HomeRoutingLogic {
}

protocol HomeDataPassing {
  var dataStore: HomeDataStore? { get }
}

final class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?
}