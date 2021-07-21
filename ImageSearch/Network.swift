//
//  Network.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import Foundation
import Alamofire

final class Network {

    private static let hostUrl = "https://dapi.kakao.com"
    private static let apiKey = "334dd6477dc4cad5af3eaa72b09de5a4"

    private enum SubUrl: String {
        case image = "/v2/search/image"
    }

    static func requestSearchedImage(query: String,
                                     page: Int,
                                     completionHandler: @escaping (Bool, SearchImage?) -> Void) {

        let urlString = hostUrl + SubUrl.image.rawValue

        let parameters = ["query": query, "page": page, "size": 30] as [String: Any]

        let headers: HTTPHeaders = ["Authorization": "KakaoAK \(apiKey)"]
        AF.request(urlString, method: .get, parameters: parameters, headers: headers).responseJSON { (response) in
            print(response)
            switch response.result {
            case .success(let data):
                do {
                    if let jsonObject = data as? [String: Any] {
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject)
                        let decode = try JSONDecoder().decode(SearchImage.self, from: jsonData)
                        completionHandler(true, decode)
                    }
                } catch let error {
                    print("error: \(error.localizedDescription)")
                    completionHandler(false, nil)
                }
            case .failure(let error):
                print("requestError: \(error.localizedDescription)")
                completionHandler(false, nil)
            }
        }
    }
}
