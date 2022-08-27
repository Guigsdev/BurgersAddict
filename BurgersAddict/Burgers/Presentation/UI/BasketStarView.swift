//
//  BasketStarView.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import SwiftUI

struct BasketStarView: View {
    var isBasketed: Bool
    var size = CGSize(width: 20, height: 20)
    var circleSize = CGSize(width: 30, height: 30)
    var color: Color = .black
    var showBackground: Bool = true
    var basketAction: () -> Void

    var body: some View {
        Button {
            basketAction()
        } label: {
            ZStack {
                if showBackground {
                    Circle()
                        .fill(Color.white)
                        .frame(width: circleSize.width, height: circleSize.height)
                        .opacity(0.6)
                }
                Image(isBasketed ? "" : "basket")
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .padding() // expand tap area
                    .foregroundColor(color)
                    .contentShape(Rectangle())
            }
        }
        .frame(width: size.width, height: size.height)
        //.buttonStyle(DefaultButtonStyle())
    }
}

struct DefaultButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .contentShape(Rectangle())
            .foregroundColor(Color.clear)
    }
}

struct BasketStarView_Previews: PreviewProvider {
    static var previews: some View {
        BasketStarView(isBasketed: false) {
        }
    }
}
