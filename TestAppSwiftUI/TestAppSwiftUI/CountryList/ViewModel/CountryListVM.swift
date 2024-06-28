//
//  CountryListVM.swift
//  TestApp
//
//  Created by NeoSOFT on 27/06/24.
//

import Foundation
import SwiftUI

final class CountryListVM: ObservableObject {
    private var listCountries: [CountryModel] = [] //All Data Variable
    private var arrCurrentPlaces: [TouristPlaceModel] = [] //Selected Places Variable
    private var requestManager: FileReaderProtocol = FileReader()
    @Published var arrFilteredPlaces: [TouristPlaceModel] = [] //Filtered Data Variable
    @Published var searchTxt: String = ""
    @Published var selectedIndex: Int = 0
    @Published var showBottomSheet: Bool = false
    // MARK: Get List of Countries
    var getListOfCountry: [CountryModel] {
        return listCountries
    }
    // MARK: Getting data from local path
    func loadData() {
        do {
            let response: CountryListModel = try requestManager.loadDataFrom(file: "DataResponse", type: "json")
            listCountries = response.countries
            setTouristListBy(index: .zero) //initial loaded first index
            objectWillChange.send()
        } catch {
            print(error.localizedDescription)
        }
    }
    // MARK: Setting selected data and reloading
    func setTouristListBy(index: Int) {
        guard listCountries.indices.contains(index) else { return }
        let places = listCountries[index].touristPlaces
        arrCurrentPlaces = places
        arrFilteredPlaces = places
    }
    // MARK: Filter data by search text
    func filterDataby() {
        if searchTxt.isEmpty {
            arrFilteredPlaces = arrCurrentPlaces
        } else {
            arrFilteredPlaces = arrCurrentPlaces.filter { model in
                return model.placeName.lowercased().range(of: searchTxt.lowercased()) != nil
            }
        }
    }
}
