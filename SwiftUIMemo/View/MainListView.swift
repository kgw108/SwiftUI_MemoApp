//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 강고운 on 2022/08/17.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    //공유데이터 목록 확인 후 동일한 타입의 인스턴스 존재할 경우, 속성을 해당 인스턴스로 자동 초기화
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .listStyle(.plain)
            .navigationTitle("내 메모") // NavigationView에 모디파이어(메소드) 추가
            .toolbar{
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus") 
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())//프리뷰에서 사용할 커스텀 공유 데이터 따로 등록!
    }
}

