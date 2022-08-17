//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 강고운 on 2022/08/17.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject { //Identifiable : 데이터 리스트에 쉽게 바인딩하기위해, ObservableObject 메모 편집할 때 뷰 자동 업데이트시 필요
    let id: UUID
    @Published var content: String // Published 특성으로 저장하면 업데이트할 때 마다 바인딩되어있는 뷰도 자동 업데이트
    let insertData: Date
    init (content: String, insertData: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertData = insertData
    }
}
