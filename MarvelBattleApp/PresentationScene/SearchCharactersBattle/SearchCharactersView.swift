//
//  SearchCharactersBattleView.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 11/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct SearchCharactersView: View {
    @ObservedObject var viewModel: SearchCharactersViewModel
    
    init(viewModel: SearchCharactersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                NavigationLink(destination: players()) {
                    HStack(alignment: .center)
                    {
                        Text("Battle")
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 20.0, bottom: 8.0, trailing: 40.0))
                .tag("Battle")
                .frame(height: 40, alignment: .leading)
                
                NavigationLink(destination: players()) {
                    HStack(alignment: .center)
                    {
                        Text("Ranking")
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(EdgeInsets(top: 8.0, leading: 20.0, bottom: 8.0, trailing: 40.0))
                .tag("Ranking")
                .frame(height: 40, alignment: .leading)
                
                searchField
                    .padding(.leading, 20)
                
                Divider()
                    .padding(.leading, 8)
                
                if viewModel.dataSource.isEmpty {
                    emptySection
                        .padding(.leading, 20)
                    
                } else {
                   listCharacters(list: viewModel.dataSource)
                    .padding(.leading, 8)
                    .frame(alignment: .topLeading)
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                     .navigationBarTitle(Text("Marvel"))
            .listStyle(GroupedListStyle())
        }
    }
}

private extension SearchCharactersView {
    
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("example: Hulk", text: $viewModel.name)
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}

struct SearchCharactersBattleView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesProvider.buildDefaultView()
    }
}


struct players: View {
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text("Player 1")
            
            Divider()
                .padding(.horizontal, 25)
            
            Text("Player 2")
        }
        .fixedSize(horizontal: true, vertical: true)
    }
}

struct listCharacters: View {
    var list : [CharacterResultViewModel]
    
     var body: some View {
        List(list) { item in
            NavigationLink(destination: CharacterDetailView(viewModel: item)) {
                CharacterResultRow.init(viewModel: item)
            }
        }
    }
}
