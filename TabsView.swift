//
//  TabsView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 24/11/24.
//

/*import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
            TabView{
               TodayView()
                    .tabItem {
                        Image("Today_Tab")
                        Text("Home")
                    }
                WeeklyTabView()
                     .tabItem {
                         Image("Weekly_Tab")
                         Text("Account")
                     }
                WeatherDataTabView()
                    .tabItem{
                        Image("Weather_Data_Tab")
                        Text("Order")
                }
                
            }
        
        
    }
}

#Preview {
    AppetizerTabView()
}*/

 //Latest Working code
/* import SwiftUI

struct TabsView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
            //NavbarView()
            //.frame(height: 30)
            //.padding(.top, 0)
            
            // TabView content
        VStack{
            TabView {
                TodayView()
                    .tabItem {
                        Image("Today_Tab")
                        Text("Home")
                    }
                WeeklyTabView()
                    .tabItem {
                        Image("Weekly_Tab")
                        Text("Account")
                    }
                WeatherDataTabView()
                    .tabItem {
                        Image("Weather_Data_Tab")
                        Text("Order")
                    }
            }
            .navigationBarBackButtonHidden(true)
            
            
        }
        .toolbar {
            // Leading button
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    // Action for Weather button
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                    Text("Weather")
                        .foregroundColor(.blue) // Weather button text in blue
                })
            }
            // Title in the center
            ToolbarItem(placement: .principal) {
                Text("Los Angeles")
                    .font(.headline)
                    .foregroundColor(.black) // Title in black
            }
            // Trailing button
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    // Action for Twitter button
                }, label: {
                    Image("twitter-x") // Replace with the actual image you want to use
                        .renderingMode(.template) // Enables color tinting
                        .foregroundColor(.blue)   // Changes icon color to blue
                })
            }
        }
        .toolbarBackground(.white, for: .navigationBar)
    }
}

#Preview {
    TabsView()
}
*/
/*
 Latest code
 
import SwiftUI

struct TabsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                // TabView content
                TabView {
                    TodayView()
                        .tabItem {
                            Image("Today_Tab")
                            Text("Home")
                        }
                    WeeklyTabView()
                        .tabItem {
                            Image("Weekly_Tab")
                            Text("Account")
                        }
                    WeatherDataTabView()
                        .tabItem {
                            Image("Weather_Data_Tab")
                            Text("Order")
                        }
                }
                .navigationBarBackButtonHidden(true)
            }
            .toolbar {
                // Leading button
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        // Action for Weather button
                        dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Weather")
                        }
                        .foregroundColor(.blue) // Weather button text in blue
                    })
                }
                
                // Title in the center
                ToolbarItem(placement: .principal) {
                    Text("Los Angeles")
                        .font(.headline)
                        .foregroundColor(.black) // Title in black
                }
                
                // Trailing button
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Action for Twitter button
                    }, label: {
                        Image("twitter-x") // Replace with the actual image you want to use
                            .renderingMode(.template) // Enables color tinting
                            .foregroundColor(.blue)   // Changes icon color to blue
                    })
                }
            }
            .toolbarBackground(.white, for: .navigationBar)
        }
    }
}

#Preview {
    TabsView()
}
*/
import SwiftUI

struct TabsView: View {
    @Binding var humidity: Double
    @Binding var temperature: Double
    @Binding var weatherCode: Double
    
    @Binding var areaRangeData: [(startTime: String, minTemperature: Double,maxTemperature: Double)]
    @Binding var uvIndex: Double
    @Binding var cloudCover: Double
    @Binding var visibility: Double
    @Binding var pressure: Double
    @Binding var windSpeed: Double
    @Binding var precipitationProbability: Double
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
           
            ZStack {
                Spacer()
                Image("App_background") // Background image
                    .resizable()
                    //.edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen
                
                //VStack {
                    //Spacer() // Push content down below the toolbar
                    
                    TabView {
                        TodayView(humidity: $humidity,temperature:$temperature,weatherCode: $weatherCode,uvIndex: $uvIndex,cloudCover: $cloudCover,visibility:$visibility, pressure:$pressure, windSpeed: $windSpeed,precipitationProbability: $precipitationProbability)
                            .tabItem {
                                Image("Today_Tab")
                                Text("TODAY")
                            }
                            .background(Color.white) // White background for individual tab
                        
                        WeeklyTabView(areaRangeData: $areaRangeData,temperature: $temperature,weatherCode:$weatherCode)
                            .tabItem {
                                Image("Weekly_Tab")
                                Text("WEEKLY")
                            }
                            .background(Color.white) // White background for individual tab
                        
                        WeatherDataTabView(humidity: $humidity,precipitationProbability: $precipitationProbability,cloudCover:$cloudCover )
                            .tabItem {
                                Image("Weather_Data_Tab")
                                Text("WEATHER DATA")
                            }
                            .background(Color.white) // White background for individual tab
                    }
                    .navigationBarBackButtonHidden(true)
                    .background(Color.white.ignoresSafeArea()) // White background for the entire TabView
               // }
            }
            .toolbar {
                // Leading button
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        // Action for Weather button
                        dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Weather")
                        }
                        .foregroundColor(.blue) // Weather button text in blue
                    })
                }
                
                // Title in the center
                ToolbarItem(placement: .principal) {
                    Text("Los Angeles")
                        .font(.headline)
                        .foregroundColor(.black) // Title in black
                }
                
                // Trailing button
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        shareOnTwitter()
                    }, label: {
                        Image("twitter-x") // Replace with the actual image you want to use
                            .renderingMode(.template) // Enables color tinting
                            .foregroundColor(.blue)   // Changes icon color to blue
                    })
                }
            }
            .toolbarBackground(Color.white, for: .navigationBar) // Toolbar background white
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
    }
    private func shareOnTwitter() {
            let tweetText = "Hello"
            let encodedTweet = tweetText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            
            // Construct the Twitter share URL
            let twitterURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedTweet)")!
            
            // Open the URL in Safari
            if UIApplication.shared.canOpenURL(twitterURL) {
                UIApplication.shared.open(twitterURL, options: [:], completionHandler: nil)
            }
        }
}

#Preview {
    TabsView(humidity: .constant(0),temperature: .constant(0),weatherCode: .constant(0),areaRangeData: .constant([
        (startTime: "2024-12-11T06:00:00-08:00",minTemperature: 15.3, maxTemperature: 25.5 ),
        (startTime: "2024-12-12T06:00:00-08:00",minTemperature: 18.5, maxTemperature: 28.0),
        (startTime: "2024-12-13T06:00:00-08:00",minTemperature: 20.0, maxTemperature: 30.2),
        (startTime: "2024-12-14T06:00:00-08:00",minTemperature: 17.6, maxTemperature: 27.8)
    ]), uvIndex: .constant(0),cloudCover:.constant(0),visibility:.constant(0),pressure:.constant(0), windSpeed:.constant(0),precipitationProbability:.constant(0) )
}
