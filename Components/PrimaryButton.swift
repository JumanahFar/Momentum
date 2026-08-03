//
//  PrimaryButton.swift
//  Momentum
//
//  Created by Jumana on 22/07/2026.
//
import SwiftUI

struct PrimaryButton: View {

    let title: String
    var backgroundColor: Color = Colors.primary

    @State private var isPressed = false

    var body: some View {

        Text(title)
            .font(Fonts.headline)
            .foregroundStyle(.white)
            .frame(width: Constants.buttonWidth)
            .frame(height: Constants.buttonHeight)
            .background(backgroundColor)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: Constants.cornerRadius
                )
            )
            /*.scaleEffect(isPressed ? 0.96 : 1)
            .animation(.easeInOut(duration: 0.12), value: isPressed)
            .onLongPressGesture(
                minimumDuration: 0,
                pressing: { pressing in
                    isPressed = pressing
                },
                perform: { }
            )*/

    }
}

#Preview {
    PrimaryButton(title: "Get Started")
        .padding()
}
