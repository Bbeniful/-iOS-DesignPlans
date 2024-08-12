//
//  ColorChangeScreen.swift
//  DesignPractice
//
//  Created by Benjámin Szilágyi on 11/08/2024.
//

import SwiftUI

struct ColorChangeScreen: View {
    
    @State private var backgrounColor: Color = .white
    @State private var isExpanded: Bool = false
    @State private var expandedItemIndex = -1
    @State private var showPicker: Bool = false
    
    
    var body: some View {
        ZStack {
            buttonView()
            
            if showPicker {
                colorPickerView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgrounColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    
    @ViewBuilder
    private func buttonView() -> some View {
        Button {
            self.showPicker.toggle()
        } label: {
            Text(self.showPicker ? "Close" : "Open")
                .foregroundColor(.white)
                .padding(.all, 10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.blue)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
        }
        .padding()
        .padding(.horizontal, 25)
        .padding(.vertical, 25)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
    
    @ViewBuilder
    private func colorPickerView() -> some View {
        VStack {
            ForEach(Array(colors.enumerated()), id: \.offset) { index, item in
                ColorChangeItem(color: item, onColorClicked: { color in
                    handleColorClicked(color: color, index: index)
                }, onElementClick: {
                    handleElementClick(index: index)
                }, isExpanded: index == expandedItemIndex, selectedColor: backgrounColor)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: showPicker) // Apply animation here
    }
    
    private func handleColorClicked(color: Color, index: Int) {
        expandedItemIndex = expandedItemIndex == index ? -1 : index
        self.backgrounColor = color
    }
    
    private func handleElementClick(index: Int) {
        isExpanded.toggle()
        expandedItemIndex = expandedItemIndex == index ? -1 : index
    }
}

struct ColorChangeItem: View {
    
    var color: Color
    var onColorClicked: (Color) -> Void
    var onElementClick: () -> Void
    var isExpanded = false
    var selectedColor: Color
    
    
    var body: some View {
        ZStack {
            HStack(alignment: .center){
                color
                if selectedColor == color {
                    Text("Selected")
                        .padding(.trailing, 15)
                        .font(.system(size: 10))
                }
                Spacer()
                if isExpanded {
                    Button(action: {
                        onColorClicked(color)
                    }, label: {
                        Text("Select Color")
                    })
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
                }
                
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    onElementClick()
                }
            }
            .background(self.color)
            .frame(width: isExpanded ? 350 : 150, height: 60)
            .frame(maxWidth: .infinity, alignment: .trailing)
            
        }
    }
}

let colors: [Color] = [
    .red,
    .green,
    .yellow,
    .orange,
    .purple,
    .brown
]

#Preview {
    ColorChangeScreen()
}
