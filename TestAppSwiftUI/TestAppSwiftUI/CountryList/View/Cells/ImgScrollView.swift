//
//  ImgScrollView.swift
//  TestAppSwiftUI
//
//  Created by NeoSOFT on 27/06/24.
//

import SwiftUI

struct ImgScrollView: View {
    @Binding var selectedIndex: Int
    let countries: [CountryModel]
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<countries.count, id: \.self) { index in
                let model = countries[index]
                Image(model.countryFlagUrl)
                    .resizable()
                    .cornerRadius(5.0)
                    .overlay{
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(.black, lineWidth: 1)
                    }
                    .padding([.leading, .trailing], 10)
                    .frame(height: 200)
                    .tag(index)
            }
        }
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .tabViewStyle(.page)
        .frame(height: 290)
    }
}
