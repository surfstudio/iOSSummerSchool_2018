//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

struct Repo: Codable {
    let name: String?
}

let url = URL(string: "https://api.github.com/repositories")!

let session = URLSession.shared

let task = session.dataTask(with: url) {(data, response, error) in
    
    guard let content = data else {
        print("No content :(")
        return
    }
    
    do {
        let decoder = JSONDecoder()
        let repos = try decoder.decode([Repo].self, from: content)
        
        for repo in repos {
            if let name = repo.name {
                print(name)
            }
        }
    } catch let err {
        print("Err", err)
    }
    
}

task.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
