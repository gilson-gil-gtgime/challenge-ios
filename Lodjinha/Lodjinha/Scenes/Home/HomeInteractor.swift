//
//  HomeInteractor.swift
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

protocol HomeBusinessLogic {
  func fetchBanner()
  func didTapBanner(at index: Int)
  func fetchCategories()
  func didTapCategory(at index: Int)
  func fetchBestsellers()
  func didTapBestseller(at index: Int)
}

protocol HomeDataStore {
  var banners: [Banner] { get set }
  var categories: [Category] { get set }
  var bestsellers: [Product] { get set }
}

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {
  var presenter: HomePresentationLogic?
  lazy var worker: HomeWorker? = { HomeWorker() }()
  var banners: [Banner] = []
  var categories: [Category] = []
  var bestsellers: [Product] = []

  func fetchBanner() {
    worker?.fetchBanner { [weak self] callback in
      do {
        let banners = try callback()
        self?.banners = banners
        let response = Home.FetchBanner.Response(banners: banners)
        self?.presenter?.presentBanners(response: response)
      } catch {
        self?.presenter?.presentError(error)
      }
    }
  }

  func didTapBanner(at index: Int) {
    let banner = banners[index]
    let response = Home.PresentBannerLink.Response(banner: banner)
    presenter?.presentBanner(response: response)
  }

  func fetchCategories() {
    worker?.fetchCategories { [weak self] callback in
      do {
        let categories = try callback()
        self?.categories = categories
        let response = Home.FetchCategories.Response(categories: categories)
        self?.presenter?.presentCategories(response: response)
      } catch {
        self?.presenter?.presentError(error)
      }
    }
  }

  func didTapCategory(at index: Int) {
    let category = categories[index]
    let response = Home.PresentCategory.Response(category: category)
    presenter?.presentCategory(response: response)
  }

  func fetchBestsellers() {
    worker?.fetchBestsellers { [weak self] callback in
      do {
        let bestsellers = try callback()
        self?.bestsellers = bestsellers
        let response = Home.FetchBestsellers.Response(products: bestsellers)
        self?.presenter?.presentBestsellers(response: response)
      } catch {
        self?.presenter?.presentError(error)
      }
    }
  }

  func didTapBestseller(at index: Int) {
    let product = bestsellers[index]
    let response = Home.PresentBestsellers.Response(product: product)
    presenter?.presentBestseller(response: response)
  }
}
