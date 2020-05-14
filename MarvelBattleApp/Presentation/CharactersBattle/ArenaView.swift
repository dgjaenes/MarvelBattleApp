//
//  ArenaView.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 12/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct ArenaView: View {
    @ObservedObject var viewModel: ArenaViewModel
    
    init(viewModel: ArenaViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if viewModel.alertPLayWinner {
                
                HStack(alignment: .center) {
                    Spacer()
                    Text("The winner is \(viewModel.playerWinner?.name ?? "")")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .frame(height: 30, alignment: .center)
                    
                    
                    Spacer()
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(50)
                
                HStack(alignment: .center) {
                    Spacer()
                    NavigationLink(destination: GeneralRouting.getRankingView()) {
                        Text("Ver Ranking")
                            .frame(alignment: .center)
                            .foregroundColor(Color.white)
                            .padding(8)
                            .cornerRadius(10)
                            .background(Color(.blue))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
                
            } else {
                
                HStack(alignment: .center) {
                    Spacer()
                    Text(viewModel.player1?.name ?? "player1?")
                        .fontWeight(.semibold)
                        .frame(height: 30, alignment: .center)
                        .foregroundColor(.secondary)
                    
                    if (viewModel.player1?.image != nil ) {
                        Image(uiImage: UIImage(data: (viewModel.player1!.image!))!)
                            .resizable()
                            .frame(width: 45, height: 40)
                            .scaledToFit()
                            .cornerRadius(6)
                            .shadow(radius: 7)
                    }
                    
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .topLeading)
                .padding(.top, 10)
                
                HStack(alignment: .center) {
                    Spacer()
                    Text("VS")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .frame(height: 30, alignment: .center)
                    
                    
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .topLeading)
                .padding(10)
                
                HStack(alignment: .center) {
                    Spacer()
                    Text(viewModel.player2?.name ?? "player2?")
                        .fontWeight(.semibold)
                        .frame(height: 30, alignment: .center)
                        .foregroundColor(.secondary)
                    if (viewModel.player2?.image != nil ) {
                        Image(uiImage: UIImage(data: (viewModel.player2!.image!))!)
                            .resizable()
                            .frame(width: 45, height: 40)
                            .scaledToFit()
                            .cornerRadius(6)
                            .shadow(radius: 7)
                    }
                    
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .topLeading)
                .padding(.top, 10)
                
                HStack(alignment: .center) {
                    Button ("Play Battle", action: self.playBattle)
                        .frame(alignment: .trailing)
                        .foregroundColor(Color.white)
                        .padding(8)
                        .cornerRadius(10)
                        .background(Color(.blue))
                        .disabled(!viewModel.enableButton)
                    
                    Button ("Reset", action: self.initView)
                        .frame(alignment: .trailing)
                        .foregroundColor(Color.white)
                        .padding(8)
                        .cornerRadius(10)
                        .background(Color(.blue))
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .center)
                .padding(10)
                
                Divider()
                    .padding(.leading, 8)
                
                searchField
                    .padding(.leading, 20)
                
                Divider()
                    .padding(.leading, 8)
                
                if viewModel.dataSource.isEmpty {
                    emptySection
                        .padding(.leading, 20)
                    
                } else {
                    Form {
                        Section {
                            List {
                                ForEach(0 ..< viewModel.dataSource.count) {
                                    CharacterResultRow.init(viewModel: self.viewModel.dataSource[$0], showButton: true, index: $0, showIndex: false, action: {index in
                                        self.selectedItem(selec: self.viewModel.dataSource[index])
                                    })
                                }
                            }
                        }
                    }
                    
                }
                
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .listStyle(GroupedListStyle())
        .onAppear(perform: {
            self.initView()
        })
    }
}

private extension ArenaView {
    
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("example: Hulk, Iron Man, Thanos ...", text: $viewModel.name)
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
    
    func selectedItem(selec: CharacterResultViewModel) {
        print("You selected: \(selec.name)")
        viewModel.setItem(item: selec)
    }
    
    func playBattle() {
        viewModel.playBattle()
    }
    
    func initView() {
        viewModel.initView()
    }
    
    func showRankink() {
        print("ir a ranking")
    }
}

struct ArenaView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesProvider.buildArenaView()
    }
}
