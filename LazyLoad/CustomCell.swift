//
//  CustomCell.swift
//  LazyLoad
//
//  Created by Andronick Martusheff on 6/22/22.
//

import SwiftUI

struct CustomCell: View {
    var number: Int
    var direction: Direction
    
    
    var body: some View {
        ZStack {
            
            
            Text("#\(number)")
                .font(.title)
                .fontWeight(.bold)
            
            if direction == Direction.vertical {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.green)
                    .opacity(0.5)
                    .padding(.horizontal, 15)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 10, alignment: .center)
            } else if direction == Direction.horizontal {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.red)
                    .opacity(0.5)
                    .padding(.horizontal, 15)
                    .frame(width: UIScreen.main.bounds.size.width / 5, height: UIScreen.main.bounds.size.height / 2.7, alignment: .center)
            }
        }
        
    }
    
    enum Direction {
        case vertical
        case horizontal
    }
}

struct CustomCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomCell(number: 5, direction: .horizontal)
    }
}
