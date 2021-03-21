//
//  TabNoteData.swift
//  Reader
//
//  Created by 谢佳培 on 2021/2/7.
//

import SwiftUI

// Model
struct Note: Codable, Identifiable
{
    var id: UUID
    var title: String
    var content: String
    var imageURLAppendix: String?
}


// ModelView
class TabNoteData: ObservableObject
{
    @Published var notes: [Note] = []
    
    static let sandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    static let cloudSandboxURL = FileManager.default.url(forUbiquityContainerIdentifier: nil)?.appendingPathComponent("Documents")
    //  将 sandboxURL 更换为 cloudSandboxURL 即可改为云沙盒
    let notesURL = sandboxURL.appendingPathComponent("notes.json")
    
    init()
    {
        notes = getNotes()
    }
    
    func getNotes() -> [Note]
    {
        var result: [Note] = []
        if FileManager.default.fileExists(atPath: notesURL.path)
        {
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        return result
    }
    
    func saveNotes()
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
    
    func getImage(_ imageURLAppendix: String) -> UIImage
    {
        let url = TabNoteData.sandboxURL.appendingPathComponent(imageURLAppendix)
        let imageData = try! Data(contentsOf: url)
        return UIImage(data: imageData, scale: 0.5)!
    }
    
    func saveImage(id: UUID, data: Data)
    {
        DispatchQueue.global(qos: .userInitiated).async {
            let url = TabNoteData.sandboxURL.appendingPathComponent("\(id).png")
            try? data.write(to: url)
        }
    }
}



