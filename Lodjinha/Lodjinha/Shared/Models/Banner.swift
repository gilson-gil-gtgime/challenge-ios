//
//  Banner.swift
//  Lodjinha
//
//  Created by Gilson Gil on 23/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct Banner: Decodable {
  let identifier: Int
  let imageUrl: String
  let linkUrl: String

  enum CodingKeys: String, CodingKey {
    case identifier = "id"
    case imageUrl = "urlImagem"
    case linkUrl
  }
}
