//
//  BottomSheetView.swift
//  TestApp
//
//  Created by NeoSOFT on 26/06/24.
//

import SwiftUI

struct BottomSheetView: View {
    let countryData: [CountryModel]
    @StateObject var viewModel: BottomSheetVM = BottomSheetVM()
    var body: some View {
        NavigationView {
            List(viewModel.displayData, id: \.id) { data in
                VStack(alignment: .leading) {
                    Text(data.title)
                    ForEach(data.occurrence, id: \.value) { occ in
                        Text(occ.title)
                    }
                }
                .foregroundColor(Color.black)
                .listRowBackground(Color.secondary.opacity(0.2))
            }
            .scrollContentBackground(.hidden)
            .background(Color.white)
            .onAppear {
                viewModel.setupData(countryData: countryData)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
