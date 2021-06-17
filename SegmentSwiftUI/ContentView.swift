//
//  ContentView.swift
//  SegmentSwiftUI
//
//  Created by Vinay Nation on 17/06/21.
//

import SwiftUI

struct ContentView: View {
     
    @State private var selectedSide: SlideOfTheForce = .bike1
    
    var body: some View {
        NavigationView {
            
            VStack {
                Picker("Choose a slide", selection: $selectedSide) {
                    ForEach(SlideOfTheForce.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                ChosenBikeView(selectedSlide: selectedSide)
                Spacer()
            }
            .navigationTitle("Choose a slide")
        }

    }
}

enum SlideOfTheForce: String, CaseIterable {
    case bike1 = "bike1"
    case bike2 = "bike2"
    case bike3 = "bike3"
}

struct ChosenBikeView: View {
    
    var selectedSlide: SlideOfTheForce
    
    var body: some View {
        switch selectedSlide {
        case .bike1:
            BikeImageView(bikeName: "bike1")
        case .bike2:
            BikeImageView(bikeName: "bike2")
        case .bike3:
            BikeImageView(bikeName: "bike3")
        }
        
    }
}

struct BikeImageView: View {
    var bikeName: String
    var body: some View {
        
        Image(bikeName)
            .resizable()
            .frame(width: 320, height: 550)
            .shadow(color: .white, radius: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
