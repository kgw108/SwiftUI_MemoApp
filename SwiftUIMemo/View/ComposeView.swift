//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 강고운 on 2022/08/17.
//

import SwiftUI

struct ComposeView: View {
    
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = "" //State variable 속성
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모편집" :  "내 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore()) // MemoStore를 커스텀공유데이터로 설정
    }
}
