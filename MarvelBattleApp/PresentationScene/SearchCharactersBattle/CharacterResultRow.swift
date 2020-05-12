//
//  CharacterResultRow.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 11/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct CharacterResultRow: View {
    let viewModel: CharacterResultViewModel
    
    init(viewModel: CharacterResultViewModel) {
        self.viewModel = viewModel
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
            
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.title)
                Spacer()
                Text("Comics: \(String(viewModel.comicsCount))")
                    .font(.footnote)
            }
            .padding(.leading, 8)
        }
    }
}
