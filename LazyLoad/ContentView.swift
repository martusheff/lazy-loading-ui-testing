//
//  ContentView.swift
//  LazyLoad
//
//  Created by Andronick Martusheff on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    @State private var horzScrollReader: ScrollViewProxy?
    @State private var vertScrollReader: ScrollViewProxy?
    let numCells = 99
    var body: some View {
        VStack {
            
            Text("My Custom Scroll View")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            
            ScrollView {
                ScrollViewReader { reader in
                    LazyVStack(spacing: 15) {
                        ForEach(1...numCells, id: \.self) { value in
                            CustomCell(number: value, direction: .vertical)
                                .accessibilityIdentifier("UICellVertical\(value)")
                        }
                        .id("VTop")
                        .onAppear { self.vertScrollReader = reader}
                        
                    }
   
                    
                }
            }
            .accessibilityIdentifier("UIVerticalScrollView")
            
            ScrollView(.horizontal) {
                ScrollViewReader { reader in
                    LazyHStack(spacing: 0) {
                        ForEach(1...numCells, id: \.self) { value in
                            CustomCell(number: value, direction: .horizontal)
                                .accessibilityIdentifier("UICellHorizontal\(value)")
                        }
                        .id("HTop")
                        .onAppear { self.horzScrollReader = reader}
                        
                    }
   
                    
                }
            }
            .accessibilityIdentifier("UIHorizontalScrollView")
            
            HStack(spacing: 50) {
                Button {
                    vertScrollReader?.scrollTo("VTop", anchor: .top)
                } label: {
                    Image(systemName: "chevron.up")
                        .font(.title)
                        .frame(width: 35, height: 35, alignment: .center)
                }.accessibilityIdentifier("Up")
                
                Button {
                    vertScrollReader?.scrollTo(numCells)
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.title)
                        .frame(width: 35, height: 35, alignment: .center)
                }.accessibilityIdentifier("Down")
                
                Button {
                    horzScrollReader?.scrollTo("HTop", anchor: .top)
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .frame(width: 35, height: 35, alignment: .center)
                }.accessibilityIdentifier("Left")
                
                Button {
                    horzScrollReader?.scrollTo(numCells)
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .frame(width: 35, height: 35, alignment: .center)
                }.accessibilityIdentifier("Right")
            }
            .padding(.bottom, 0)
            
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
