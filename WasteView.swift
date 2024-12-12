//
//  WasteView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 25/11/24.
//
/*
import SwiftUI
import Alamofire

struct WasteView: View {
    @State private var searchText = ""
    @State private var selectedLocation: String? = nil
    @State private var latitude: Double?
    @State private var longitude: Double?
    @State private var weatherData: APIResponse? // Hold the response from the Tomorrow API

    // Assuming you have a LocationManager or some manager for the list
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        NavigationStack {
            ZStack {
                FrontView()
                VStack {
                    // White background containing the search bar
                    Color.white
                        .frame(height: 139) // Adjust height for the search bar container
                        .edgesIgnoringSafeArea(.top)
                        .overlay(
                            VStack {
                                // Use SwiftUI's searchable modifier
                                List(locationManager.results, id: \.id) { prediction in
                                    Text(prediction.description)
                                        .onTapGesture {
                                            // Handle selection (e.g., fetch coordinates)
                                            self.selectedLocation = prediction.description
                                            print("Selected: \(prediction.description)")

                                            // Get coordinates based on the selected location
                                            NetworkManager.shared.getCoordinates(for: prediction.description) { result in
                                                switch result {
                                                case .success(let location):
                                                    self.latitude = location.lat
                                                    self.longitude = location.lng
                                                    
                                                    // Now fetch tomorrow's weather data using the latitude and longitude
                                                    fetchTomorrowData()
                                                    
                                                case .failure(let error):
                                                    print("Error fetching coordinates: \(error)")
                                                }
                                            }
                                        }
                                }
                                .searchable(text: $searchText, prompt: "Enter city name...")
                                .onChange(of: searchText) { newValue in
                                    locationManager.query = newValue // Trigger search in manager
                                }
                                .listStyle(.plain) // Simplify the dropdown list style
                                .frame(maxHeight: searchText.isEmpty ? 0 : 250) // Show list only when there is text
                                .background(Color.white) // Ensure dropdown list background is white
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
                                .padding(.horizontal, 16) // Center the search box horizontally
                                .zIndex(5)
                                .scrollContentBackground(.hidden) // Allow for scrollable content
                            }
                        )
                        .zIndex(1) // Ensures the search bar and its results are on top of other views
                    
                    // Main content (add your other views here)
                    Spacer()

                    // Show the weather data after it's fetched
                    if let weatherData = weatherData {
                        Text("Tomorrow's weather: \(weatherData.temperature)")
                            .padding()
                    }
                }
            }
        }
    }

    func fetchTomorrowData() {
        guard let lat = latitude, let lon = longitude else { return }

        NetworkManager.shared.getTomorrowData(latitude: lat, longitude: lon) { result in
            switch result {
            case .success(let data):
                self.weatherData = data
            case .failure(let error):
                print("Error fetching tomorrow's data: \(error)")
            }
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let geocodeBaseURL = "https://maps.googleapis.com/maps/api/geocode/json"
    private let tomorrowBaseURL = "https://api.tomorrow.io/v4/timelines"

    private init() {}

    // Function to get coordinates based on location description (city)
    func getCoordinates(for locationDescription: String, completed: @escaping (Result<Location, GeocodeError>) -> Void) {
        let urlString = "\(geocodeBaseURL)?address=\(locationDescription)&key=YOUR_GOOGLE_API_KEY"
        
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }

        AF.request(url)
            .validate()
            .responseDecodable(of: GeocodeResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    if let location = decodedResponse.results.first?.geometry.location {
                        completed(.success(location))
                    } else {
                        completed(.failure(.invalidData))
                    }
                case .failure(let error):
                    completed(.failure(.unableToComplete))
                    print("Request failed: \(error.localizedDescription)")
                }
            }
    }

    // Function to get Tomorrow's data using latitude and longitude
    func getTomorrowData(latitude: Double, longitude: Double, completed: @escaping (Result<APIResponse, TomorrowError>) -> Void) {
        let urlString = "\(tomorrowBaseURL)?location=\(latitude),\(longitude)&fields=temperature&units=imperial&timesteps=1d&startTime=now&timezone=America/Los_Angeles&apikey=YOUR_TOMORROW_API_KEY"
        
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }

        AF.request(url)
            .validate()
            .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    completed(.success(decodedResponse))
                case .failure(let error):
                    completed(.failure(.unableToComplete))
                    print("Request failed: \(error.localizedDescription)")
                }
            }
    }
}

// Assume these are the response models for API response
struct GeocodeResponse: Codable {
    let results: [GeocodeResult]
}

struct GeocodeResult: Codable {
    let geometry: Geometry
}

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat: Double
    let lng: Double
}

struct APIResponse: Codable {
    let temperature: Double
}

enum GeocodeError: Error {
    case invalidURL
    case unableToComplete
    case invalidData
}

enum TomorrowError: Error {
    case invalidURL
    case unableToComplete
}

#Preview {
    WasteView()
}
*/
