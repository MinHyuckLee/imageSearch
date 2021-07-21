//
//  SearchImage.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import Foundation

struct SearchImage: Codable {
    var meta: Meta
    var documents: [Documents]
}

struct Meta: Codable {
    var total_count: Int
    var pageable_count: Int
    var is_end: Bool
}

struct Documents: Codable {
    var collection: String
    var thumbnail_url: String
    var image_url: String
    var width: Int
    var height: Int
    var display_sitename: String
    var doc_url: String
    var datetime: String
}
