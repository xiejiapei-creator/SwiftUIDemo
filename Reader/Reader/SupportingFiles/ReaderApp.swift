//
//  ReaderApp.swift
//  Reader
//
//  Created by 谢佳培 on 2021/1/20.
//

import SwiftUI
import LocalAuthentication

@main
struct ReaderApp: App
{
    let motionManager = MotionManager()
    let CloudDataManager = CloudData.shared
    
    @State var locked = true
    
    var body: some Scene
    {
        WindowGroup
        {
            Group
            {
                if locked
                {
                    Locked(authorize: authorize)
                }
                else
                {
                    TabView
                    {
                        Master()
                            .environmentObject(motionManager)
                            .tabItem { Label("阅读列表", systemImage: "books.vertical") }
                        ReadingNote()
                            .tabItem { Label("笔记", systemImage: "note.text") }
                        CheckIn()
                            .environment(\.managedObjectContext, CloudDataManager.container.viewContext)
                            .tabItem { Label("签到", systemImage: "mappin.and.ellipse") }
                    }

                }
            }
            .onAppear { authorize() }
        }
    }
    
    func authorize()
    {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "解锁应用")
            { result, _ in
                if result
                {
                    locked = false
                }
            }
        }
    }
}







