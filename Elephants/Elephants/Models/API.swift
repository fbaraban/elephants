//
//  API.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import Foundation

/// API model
struct API {

    let baseURL = "https://elephant-api.herokuapp.com"

    /// returns the string URL to Elephants endpoint
    func setElephantsURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)"
    }

    func getElephants(
        urlString: String,
        method: HTTPMethods,
        response: @escaping ([Elephant]) -> Void,
        errorReturned: @escaping (String) -> Void
    ) {

        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)

        guard let url: URL = URL(string: urlString) else { return }
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "\(method)"

        let task = session.dataTask(
            with: urlRequest,
            completionHandler: { (result, urlResponse, error) in
            var statusCode: Int = 0

            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
            }

            guard let data = result else {

                errorReturned("Não retornou nada")
                return
            }

            do {

                let decoder = JSONDecoder()
                let decodableData: [Elephant] = try decoder.decode([Elephant].self, from: data)
                if decodableData.count < 1 {
                    errorReturned("Array de Elephants é igual a ZERO")
                }

                switch statusCode {
                case 200:
                    response(decodableData)
                case 404:
                    errorReturned("Página não encontrada")
                    return
                case 500:
                    errorReturned("Erro do servidor")
                    return
                default:
                    break
                }

            } catch {
                errorReturned("Impossível decodificar")
            }
        })
        task.resume()
    }

}
