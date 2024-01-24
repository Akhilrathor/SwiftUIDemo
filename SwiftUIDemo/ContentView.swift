//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Akhilesh Rathor on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    var arrImages = ["pick1", "pick2", "pick3", "pick4" ]
    var body: some View {
        NavigationView{
            List(arrImages, id: \.self){ image in
                VStack {
//                    Image(image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(20)
//                        .shadow(radius: 20)
//                    Text("Hello, world!")
//                        .padding()
                    PicsImgView()
            
                    Text("My Name is Akhilesh")
                    
//                    Button{
//                        print("Button Tapped!!")
//                    } label: {
//                        Text("Tap me")
//                    }
                }
            }.navigationTitle("Gallery")
        }
    }
}

#Preview {
    ContentView()
}

struct PicsImgView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/id/0/5000/3333")){ phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .shadow(radius: 20)
            case .failure:
                Image(systemName: "photo")
            default:
                EmptyView()
            }}
    }
}
