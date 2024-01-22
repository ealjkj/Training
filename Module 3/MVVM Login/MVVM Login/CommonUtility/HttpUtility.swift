//
//  httpUtility.swift
//  MVVM Login
//
//  Created by intekglobal02 on 1/18/24.
//

import Foundation

struct HttpUtility {
    
    func request<ResType: Decodable, ReqType: Encodable >(method: AuthAPI.Methods, body: ReqType, endpoint: String, completion: @escaping (_ data: ResType?, _ error: Error?) -> Void ) {
        
        if let url = URL(string: endpoint) {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            //Encode body
            do {
                let jsonData = try JSONEncoder().encode(body)
                request.httpBody = jsonData
            } catch {
                print(ErrorConstants.encodingError)
                completion(nil, error) // Maybe this should not be an
            }
            
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Make the API call
            URLSession.shared.dataTask(with: request) { data, _, error in
                
                if (error != nil) {
                    print("There was an error: \(error?.localizedDescription ?? "")")
                }
                
                guard let data = data else { return }
                
                do {
                    let decoded = try JSONDecoder().decode(ResType.self, from: data)
                    completion(decoded, nil)
                } catch {
                    print(ErrorConstants.decodingError)
                    completion(nil, error)
                }
                
            }.resume()
        }
    }
}
