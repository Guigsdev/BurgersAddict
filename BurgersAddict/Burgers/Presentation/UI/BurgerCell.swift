//
//  BurgerCellView.swift
//  Burgers
//
//  Created by Guillaume-Webwag on 27/08/2022.
//

import SwiftUI
import Kingfisher

struct BurgerCell: View {
    let viewModel: BurgerCellViewModel
    @State private var isBasketted: Bool = false

    var body: some View {
        HStack(alignment: .center) {
            KFImage(viewModel.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipped()

            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text(viewModel.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(viewModel.getPrice())
                            .foregroundColor(Color.white.opacity(0.5))
                            .font(.title3)
                            .lineLimit(1)
                    }
                }
                Text(viewModel.description)
                    .font(.callout)
                    .fontWeight(.light)
                    .lineLimit(4)
            }

            Spacer()

            BasketStarView(isBasketed: isBasketted){
                withAnimation {
                    // TODO: update the state of burger (in basket or not)
                }
            }
        }
        .padding()
        .background(Color(red: 22/255, green: 32/255, blue: 53/255))
        .foregroundColor(.white)
    }
}

struct BurgerCell_Previews: PreviewProvider {
    static var previews: some View {
        BurgerCell(viewModel: BurgerCellViewModel(ref: "", title: "", description: "", thumbnail: URL(string: "")!, price: 0))
    }
}
