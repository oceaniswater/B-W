//
//  FiveStarsView.swift
//  B&W
//
//  Created by Mark Golubev on 17/04/2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

public enum FiveStarsViewType {
    case onlyStars, short, full
}

/// A view displaying a star rating with a given rating value.
public struct FiveStarView: View {
    var rating: Decimal
    var color: Color
    var backgroundColor: Color
    var type: FiveStarsViewType
    
    public init(
        rating: Decimal,
        color: Color = .red,
        backgroundColor: Color = .gray,
        type: FiveStarsViewType = .full
    ) {
        self.rating = rating
        self.color = color
        self.backgroundColor = backgroundColor
        self.type = type
    }
    
    public var body: some View {
        HStack {
            ZStack {
                BackgroundStars(backgroundColor)
                ForegroundStars(rating: rating, color: color)
            }
            .scaledToFit()
            .accessibilityHidden(true)
            
            switch type {
            case .onlyStars:
                Text("")
            case .short:
                Text("\(rating)")
                    .scaledToFill()
            case .full:
                Text("avg. \(rating) (\(Int.random(in: 100...10000)))")
                    .scaledToFill()
            }
        }
    }
}

/// A single rating star view used in the star rating.
struct RatingStar: View {
    var rating: CGFloat
    var color: Color
    var index: Int
    
    /// Calculates the mask ratio for the star based on the rating value.
    var maskRatio: CGFloat {
        let mask = rating - CGFloat(index)
        
        switch mask {
        case 1...: return 1
        case ..<0: return 0
        default: return mask
        }
    }
    
    
    init(rating: Decimal, color: Color, index: Int) {
        
        self.rating = CGFloat(Double(rating.description) ?? 0)
        self.color = color
        self.index = index
    }
    
    
    var body: some View {
        GeometryReader { star in
            StarImage()
                .foregroundColor(self.color)
                .mask(
                    Rectangle()
                        .size(
                            width: star.size.width * self.maskRatio,
                            height: star.size.height
                        )
                )
        }
    }
}

/// A single star image view used in the star rating.
private struct StarImage: View {
    
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

/// A view representing the background stars in the star rating.
private struct BackgroundStars: View {
    var color: Color
    
    
    init(_ color: Color) {
        self.color = color
    }
    
    
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                StarImage()
            }
        }.foregroundColor(color)
    }
}

/// A view representing the foreground stars (filled stars) in the star rating based on the given rating value.
private struct ForegroundStars: View {
    var rating: Decimal
    var color: Color
    
    
    init(rating: Decimal, color: Color) {
        self.rating = rating
        self.color = color
    }
    
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                RatingStar(
                    rating: self.rating,
                    color: self.color,
                    index: index
                )
            }
        }
    }
}

#Preview {
    FiveStarView(rating: Decimal(3.6), type: .onlyStars)
        .frame(minWidth: 1, idealWidth: 200,maxWidth: 300, minHeight: 1, idealHeight: 16, maxHeight: 30, alignment: .center)
}
