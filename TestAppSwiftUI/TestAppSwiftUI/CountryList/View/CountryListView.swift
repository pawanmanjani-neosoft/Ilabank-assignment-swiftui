//
//  CountryListView.swift
//  TestAppSwiftUI
//
//  Created by NeoSOFT on 27/06/24.
//

import SwiftUI

struct CountryListView: View {
    @StateObject var viewModel: CountryListVM = CountryListVM()
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        ImgScrollView(selectedIndex: $viewModel.selectedIndex, countries: viewModel.getListOfCountry)
                        CountryTableListView(data: viewModel.arrFilteredPlaces, searchTxt: $viewModel.searchTxt)
                    }
                }
                .safeAreaPadding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 0))
                floatingButton
            }
            .ignoresSafeArea(.keyboard)
            .sheet(isPresented: $viewModel.showBottomSheet) {
                BottomSheetView(countryData: viewModel.getListOfCountry)
                            .presentationDetents([.medium, .large])
            }
            .onAppear {
                viewModel.loadData()
            }
            .onChange(of: viewModel.searchTxt) {
                viewModel.filterDataby()
            }
            .onChange(of: viewModel.selectedIndex) {
                viewModel.searchTxt = ""
                viewModel.setTouristListBy(index: viewModel.selectedIndex)
            }
            .navigationBarTitle(Text("Places"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    var floatingButton: some View {
        Button {
            viewModel.showBottomSheet.toggle()
        } label: {
            Image(systemName: "ellipsis")
                .font(.title.weight(.semibold))
                .padding()
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
        }
        .background(Color.black)
        .clipShape(Circle())
        .padding()
    }
}
