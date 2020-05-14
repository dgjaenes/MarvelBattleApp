//
//  RankingView.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 14/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct RankingView: View {
    
    @ObservedObject var viewModel: RankingViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            List(self.viewModel.dataSource) { item in
                NavigationLink(destination: GeneralRouting.getDetailView(viewModel: item)) {
                    CharacterResultRow.init(viewModel: item, showButton: false, index: item.index, showIndex: true, action: {_ in })
                }
            }
            .padding(.leading, 8)
            .frame(alignment: .topLeading)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarTitle(Text("Ranking"))
        .listStyle(GroupedListStyle())
        .onAppear(perform: {
            self.viewModel.initView()
        })
    }
}

