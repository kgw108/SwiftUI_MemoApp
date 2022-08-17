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
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                VStack(alignment: .leading) {
                    Text(memo.content)
                        .font(.body)
                        .lineLimit(1) // 텍스트 최대 1줄만 나오게
                    
                    Text(memo.insertData, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(.plain)
            .navigationTitle("내 메모") // NavigationView에 모디파이어(메소드) 추가
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())//프리뷰에서 사용할 커스텀 공유 데이터 따로 등록!
    }
}
