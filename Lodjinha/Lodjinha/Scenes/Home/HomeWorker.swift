//
//  HomeWorker.swift
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

final class HomeWorker {
  func fetchBanner(completion: @escaping (() throws -> [Banner]) -> Void) {
    ALodjinhaAPI.getBanner(completion: completion)
  }

  func fetchCategories(completion: @escaping (() throws -> [Category]) -> Void) {
    ALodjinhaAPI.getCategories(completion: completion)
  }
}
