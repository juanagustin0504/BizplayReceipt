//
//  DataAccess.swift
//  gyeongnam
//
//  Created by vansa pha on 13/12/2019.
//  Copyright © 2019 Webcash. All rights reserved.
//

import Foundation

class DataAccess {
    
    private var sessionConfig: URLSessionConfiguration!
    private var session: URLSession!
    
    //Singleton configuration
    private init() {
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 120.0
        sessionConfig.timeoutIntervalForResource = 120.0
        sessionConfig.urlCache?.removeAllCachedResponses()
        session = URLSession(configuration: sessionConfig)
    }
    static let manager = DataAccess()
    
    //MARK: ------------------------- communication data function --------------------------------
    private func request<T: Encodable>(api: String, body: T) -> URLRequest {
        
        func queryString<T:Encodable>(body:T) -> String {
            let request = body
            guard let str = request.asJSONString() else { return "" }
            return str
        }
        
        var url: URL!
        var request: URLRequest!
        let apiInstance = APIInstance()
        
        let reqURL = apiInstance.baseServerURL + api
        url = URL(string: reqURL)
        request = URLRequest(url: url)
        request.httpMethod = "POST"
        let strQuery = queryString(body: body)
        let jsonBody = "JSONData=\(strQuery)"
        
        #if DEBUG
        print("\n\nRequest ----------------------------------------\n")
        print(jsonBody)
        print("\n--------------------------------------------------\n\n")
        #endif
        
        request.httpBody = jsonBody.data(using: .utf8)
        return request
    }
    
    /** Request data task with API and response data & error as completion */
    func fetch<I: Encodable , O : Decodable>(api: String,
                             body: I,
                             responseType : O.Type,
                             shouldShowLoading: Bool = true,
                             completion: @escaping (Result<O, NSError>) -> Void) {
        
        let req = request(api: api , body: body)
        session.dataTask(with: req) { (data, response, error) in
            
            // ❌❌❌ error -----------------------------
            if error != nil {
                completion(.failure(error! as NSError))
                return
            }
            
            // ❌❌❌ error -----------------------------
            guard let data = data else {
                completion(.failure(error! as NSError))
                return
            }
            
            guard let dataString = String(data: data, encoding: String.Encoding.utf8) else { return }
            guard let decodedDataString = dataString.removingPercentEncoding else { return }
        
            let replaceString = decodedDataString.replacingOccurrences(of: "+", with: " ")
            print("JSON String: \n", replaceString)
            print("\n\nApi key:", api)
            
            // ❌❌❌ error -----------------------------
            guard let responseDictionary = self.convertToDictionary(jsonString: replaceString) else {
                completion(.failure(error! as NSError))
                return
            }
            
            if let COMMON_HEAD = responseDictionary["COMMON_HEAD"] as? [String:Any] {
                let ERROR = COMMON_HEAD["ERROR"] as? Bool ?? false
                if !ERROR {
                    guard let dataResult = replaceString.data(using: .utf8) else { return }
                    do {
                        let responseObj = try JSONDecoder().decode(responseType, from: dataResult)
                        // ************************** 😊😊😊 success 😊😊😊 *****************************
                        print("Everything work fine.")
                        print("JSONString ::::",replaceString)
                        completion(.success(responseObj))
                        // ******************************************************************************
                    } catch {
                        completion(.failure(error as NSError))
                        return
                    }
                } else {
                    // ❌❌❌ error -----------------------------
                    let CODE = COMMON_HEAD["CODE"] as? String ?? "1002"
                    let MESSAGE = COMMON_HEAD["MESSAGE"] as? String ?? ""
                    
                    #if DEBUG
                    let outputErrorMessage = "[CODE : \(CODE)] \n\(MESSAGE)"
                    #else
                    let outputErrorMessage = MESSAGE
                    #endif
                    
                    if CODE == "E_S001" {
                        completion(.failure(NSError(domain: "오류", code:1168, userInfo: [NSLocalizedDescriptionKey : outputErrorMessage])))
                    } else if CODE == "C001" {
                        completion(.failure(NSError(domain: "오류", code:1007, userInfo: [NSLocalizedDescriptionKey : outputErrorMessage])))
                    } else if CODE.contains("JEX") {
                        completion(.failure(NSError(domain: "오류", code:1002, userInfo: [NSLocalizedDescriptionKey :"처리중 오류가 발생하였습니다."])))
                    } else if CODE == "L001" {
                        completion(.failure(NSError(domain: "오류", code:1008, userInfo: [NSLocalizedDescriptionKey : outputErrorMessage])))
                    } else {
                        completion(.failure(NSError(domain: "오류", code:1002 , userInfo: [NSLocalizedDescriptionKey : outputErrorMessage])))
                    }
                    return
                }
            } else {
                // ❌❌❌ error -----------------------------
                completion(.failure(error! as NSError))
                return
            }
            
        }.resume()
    }
    
    private func convertToDictionary(jsonString : String) -> [String:Any]? {
        guard let data = jsonString.data(using: .utf8) else { return nil }
        do { return try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] }
        catch {
            print("Cannon convert to Dictionary ::::> \(error.localizedDescription)")
            return nil
        }
    }
    
}
