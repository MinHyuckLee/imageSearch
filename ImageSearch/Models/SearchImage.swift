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

//class SearchImage: Codable {
//    var meta: Meta?
//    var documents: [Documents]?
//
//    private enum CodingKeys: String, CodingKey {
//        case meta, documents
//    }
//
//    required init(from decoder: Decoder) throws {
//        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { return }
//
//        meta = try container.decodeIfPresent(Meta.self, forKey: .meta)
//        documents = try container.decodeIfPresent([Documents].self, forKey: .documents)
//    }
//}
//
//class Meta: Codable {
//    var total_count: Int?
//    var pageable_count: Int?
//    var is_end: Bool?
//
//    private enum CodingKeys: String, CodingKey {
//        case total_count, pageable_count, is_end
//    }
//
//    required init(from decoder: Decoder) throws {
//        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { return }
//
//        total_count = try container.decodeIfPresent(Int.self, forKey: .total_count)
//        pageable_count = try container.decodeIfPresent(Int.self, forKey: .pageable_count)
//        is_end = try container.decodeIfPresent(Bool.self, forKey: .is_end)
//    }
//}
//
//class Documents: Codable {
//    var collection: String?
//    var thumbnail_url: String?
//    var image_url: String?
//    var width: Int?
//    var height: Int?
//    var display_sitename: String?
//    var doc_url: String?
//    var datetime: String?
//
//    private enum CodingKeys: String, CodingKey {
//        case collection, thumbnail_url, image_url, width, height, display_sitename, doc_url, datetime
//    }
//
//    required init(from decoder: Decoder) throws {
//        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { return }
//
//        collection = try container.decodeIfPresent(String.self, forKey: .collection)
//        thumbnail_url = try container.decodeIfPresent(String.self, forKey: .thumbnail_url)
//        image_url = try container.decodeIfPresent(String.self, forKey: .image_url)
//        width = try container.decodeIfPresent(Int.self, forKey: .width)
//        height = try container.decodeIfPresent(Int.self, forKey: .height)
//        display_sitename = try container.decodeIfPresent(String.self, forKey: .display_sitename)
//        doc_url = try container.decodeIfPresent(String.self, forKey: .doc_url)
//        datetime = try container.decodeIfPresent(String.self, forKey: .datetime)
//    }
//}
