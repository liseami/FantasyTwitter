//
//  File.swift
//  FantasyTwitter (iOS)
//
//  Created by 赵翔宇 on 2022/1/29.
//

import Foundation

extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}


extension String {
    func RFC3986()->String?{
        self.stringByAddingPercentEncodingForRFC3986()
    }
    func stringByAddingPercentEncodingForRFC3986() -> String? {
        let unreserved = "！#$&'()*,/：;=?@[]"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
    }
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    func hmac(key: String) -> [String] {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), key, key.count, self, self.count, &digest)
        let data = Data(bytes: digest)
        return data.map { String(format: "%02hhx", $0) }
    }
    
}

func randomString(_ length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
