//
//  Disk.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 02/02/2023.
//  Copyright © 2023 nbpApps. All rights reserved.
//
import Foundation

struct MemoryData: Codable {
    let strings: [String]
    let ints: [Int64]
}

enum DocumentsDirectory: CaseIterable {
    case memoryData
    
    var path: String {
        switch self {
        case .memoryData: return "memoryData"
        }
    }
}


struct DiskStore {
    
    static let shared = DiskStore()
    private let diskStoreBackgroundQueue = DispatchQueue(label: "com.DiscontBankApp.diskStoreBackgroundQueue", qos: .background)
    
    private init() {}
    
    func saveWithWorkItem<T: Codable>(_ data: T, to directory: DocumentsDirectory) {
        let encoder = JSONEncoder()
        guard let dataUrl = url(for: directory.path) else {return}
        guard let data = try? encoder.encode(data) else {return}
        
        let storeWorkItem = DispatchWorkItem(flags: .barrier) {
            do {
                try data.write(to: dataUrl, options: [.atomic])
            }
            catch {
                print("fail save")
            }
        }
        
        diskStoreBackgroundQueue.async(execute: storeWorkItem)
//        storeWorkItem.notify(queue: DispatchQueue.main) {
//            print("store all")
//        }
    }
    
    func fetch<T: Codable>(from directory: DocumentsDirectory) -> T? {
        do {
            guard let url = url(for: directory.path) else {return nil}
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: data)
            return object
        }
        catch {
            //            dataStoreLogError("could not fetch \(T.self) " + error.localizedDescription)
            return nil
        }
    }
    
    func deleteData(from directory: DocumentsDirectory) throws {
        do {
            guard let url = url(for: directory.path) else {return}
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: url.path) {
                try fileManager.removeItem(at: url)
            }
        }
        catch{
            throw error
        }
    }
    
    private func url(for path: String) -> URL? {
        return getDocumentsDirectory()?.appendingPathComponent(path)
    }
    
    private func getDocumentsDirectory() -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
//        let fileManager = FileManager.default
//        let container = fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroup())
//        return container
    }
}

