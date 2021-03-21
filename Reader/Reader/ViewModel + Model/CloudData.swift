//
//  CloudData.swift
//  Reader
//
//  Created by 谢佳培 on 2021/3/3.
//

import Foundation
import CoreData

struct CloudData
{
    static let shared = CloudData()
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false)
    {
        container = NSPersistentCloudKitContainer(name: "Reader")
        if inMemory
        {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, _ in })
    }
}
