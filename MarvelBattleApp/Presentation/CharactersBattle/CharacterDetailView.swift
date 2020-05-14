//
//  CharacterDetailView.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 12/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let viewModel: CharacterResultViewModel
    
    init(viewModel: CharacterResultViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView([ .vertical ], showsIndicators: false)
        {
            HStack {
                VStack(alignment: .leading) {
                    if (viewModel.image != nil ) {
                        Image(uiImage: UIImage(data: viewModel.image!)!)
                            .resizable()
                            .frame(width: 180, height: 160)
                            .scaledToFit()
                            .cornerRadius(6)
                            .shadow(radius: 8)
                    } else {
                        Text("Not Image")
                    }
                }
                .padding(.leading, 8)
                
                VStack(alignment: .leading) {
                    Text(viewModel.name)
                        .font(.title)
                    Text("Comics: \(String(viewModel.comicsCount))")
                        .font(.footnote)
                }
                .padding(.leading, 8)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.description)
                    .font(.title)
            }
            .padding(.leading, 8)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
