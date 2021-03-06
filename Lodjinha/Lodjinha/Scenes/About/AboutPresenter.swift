//
//  AboutPresenter.swift
//  Lodjinha
//
//  Created by Gilson Gil on 27/02/19.
//  Copyright (c) 2019 Gilson Gil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AboutPresentationLogic {
  func presentInfo(response: About.GetInfo.Response)
}

final class AboutPresenter: AboutPresentationLogic {
  weak var viewController: AboutDisplayLogic?

  // MARK: Present Info

  func presentInfo(response: About.GetInfo.Response) {
    let name = response.name
    let date = DateFormatter.displayDateFormatter.string(from: response.date)
    let viewModel = About.GetInfo.ViewModel(name: name, date: date)
    viewController?.displayInfo(viewModel: viewModel)
  }
}
