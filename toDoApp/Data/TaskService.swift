//
//  TaskService.swift
//  toDoApp
//
//  Created by iOS Developer on 05/08/24.
//

import Foundation
import UIKit

enum taskServiceError: Error{
    case invalidURL
    case invalidResponse
    case decodingError
}

struct TaskService{
    func getTasks() async throws -> [Taskz]{
        let urlString = "http://localhost:3000/tasks"
        guard let url = URL(string: urlString) else{
            throw taskServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            else{
            throw taskServiceError.invalidResponse
        }
        do{
            let tasks = try JSONDecoder().decode([Taskz].self, from: data)
            return tasks
        } catch{
            throw taskServiceError.decodingError
        }
    }
    
    func addTask(){
        
    }
    
    func toggleCompleted(){
        
    }
}
