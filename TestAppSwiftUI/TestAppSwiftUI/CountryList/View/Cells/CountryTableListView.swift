//
//  CountryTableListView.swift
//  TestAppSwiftUI
//
//  Created by NeoSOFT on 27/06/24.
//

import SwiftUI

struct CountryTableListView: View {
    let data: [TouristPlaceModel]
    @Binding var searchTxt: String
    var body: some View {
        listOrEmptyMsgView
    }
    @ViewBuilder var listOrEmptyMsgView: some View {
        LazyVStack(alignment: .leading, spacing: 5, pinnedViews: [.sectionHeaders]) {
            Section {
                if data.isEmpty {
                    Text("No Data Available")
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    ForEach(data, id: \.placeName) { data in
                        VStack(alignment: .leading, spacing: 2) {
                            HStack(spacing: 5) {
                                Image(data.placeUrl)
                                    .resizable()
                                    .cornerRadius(5.0)
                                    .frame(width: 50, height: 50)
                                Text(data.placeName)
                            }
                            Divider()
                        }
                        .padding(10)
                    }
                }
            } header: {
                SearchbarView(text: $searchTxt)
                    .frame(height: 50)
                    .background(Color.white)
            }
        }
    }
}


