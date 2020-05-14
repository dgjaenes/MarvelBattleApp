//
//  CharacterResultRow.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 11/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct CharacterResultRow: View , Identifiable{
    
    var id = UUID()
    var index: Int?
    let viewModel: CharacterResultViewModel
    var showButton = false
    var action : (_ ind : Int) -> Void
    
    init(viewModel: CharacterResultViewModel, showButton : Bool, index: Int?, action: @escaping (_ ind : Int) -> Void) {
        self.viewModel = viewModel
        self.index = index
        self.showButton = showButton
        self.action = action
    }
    
    var body: some View {
        HStack {
            VStack {
                if (viewModel.image != nil ) {
                    Image(uiImage: UIImage(data: viewModel.image!)!)
                        .resizable()
                        .frame(width: 90, height: 80)
                        .scaledToFit()
                        .cornerRadius(6)
                        .shadow(radius: 7)
                } else {
                    Text("Not Image")
                }
            }
            Spacer()
            VStack(alignment: .center) {
                Text(viewModel.name)
                    .font(.title)
                Spacer()
                Text("Comics: \(String(viewModel.comicsCount))")
                    .font(.footnote)
            }
            .padding(.leading, 8)
            
            Spacer()

            if showButton {
                VStack() {
                    Button("Select", action: self.executeAction)
                }
                .frame(alignment: .trailing)
                .foregroundColor(Color.white)
                .padding()
                .cornerRadius(9)
                .background(Color(.black))
            }
        }
    }
    
    private func executeAction() {
        if let ind = index {
            self.action(ind)
        }
    }
    
}
