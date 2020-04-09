//
//  APIRequest.swift
//  TeamCleaningOptimisation
//
//  Created by Oona on 8.4.2020.
//  Copyright © 2020 TeamCleaningOptimization. All rights reserved.
//

import Foundation

class APIRequest {
    let endpoint = "https://cleaner-app-api.azurewebsites.net/api/hospital0"
    let getRoomsString = "/rooms"
    let getRoomString = "/room/"
    let getReportString = "/reports"
    
    func getRoom(roomID: String) {
        guard let url = URL(string: endpoint+getRoomString+roomID) else { return }
        print("URL: \(url)")
        doGETRequest(url: url)
    }
    
    func getRooms() {
        guard let url = URL(string: endpoint+getRoomsString) else { return }
        print("URL: \(url)")
        doGETRequest(url: url)
    }
    
    func getReport() {
        guard let url = URL(string: endpoint+getReportString) else { return }
        print("URL: \(url)")
        doGETRequest(url: url)
    }
    
    private func doGETRequest(url: URL) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for errors
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Read status code
            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }
            
            // Read data and convert to a string
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data: \(dataString)")
            }
        }
        task.resume()
    }
}
