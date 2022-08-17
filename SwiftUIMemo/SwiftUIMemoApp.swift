//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 강고운 on 2022/08/17.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    @StateObject var store = MemoStore() //메모 저장소 속성으로 저장
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store) // MainListView와 이어지는 뷰에서 동일한 객체 쉽게 사용 가능
        }
    }
} 
