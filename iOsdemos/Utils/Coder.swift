//
//  Coder.swift
//  Techtest
//
//  Created by Irvin Leon on 29/07/22.
//

import Foundation

class Coder {
    
    let encoder : JSONEncoder
    let decoder : JSONDecoder
    
    public static let Shared = Coder()
    
    init() {
        encoder = JSONEncoder()
        decoder = JSONDecoder()
    }
    
    public func encode<T>(toEncode:T) -> Data? where T: Codable{
        
        if let encoded = try? encoder.encode(toEncode) {
            return encoded
        }
        return nil
    }
    
    public func decode<T>(for type: T.Type, toDecode: Data ) -> T?  where T: Codable {
        var decoded: T?
        do {
            decoded = try self.decoder.decode(type, from: toDecode)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
            return nil
        }
        return decoded
    }
}
