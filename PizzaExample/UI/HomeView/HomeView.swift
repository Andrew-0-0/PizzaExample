//
//  ContentView.swift
//  PizzaExample
//
//  Created by Andrew I on 18.08.2026.
//

import SwiftUI

struct HomeView: View {

    @State var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            Image(.ellipse)
                .resizable()
                .ignoresSafeArea()
                .padding(.bottom, 300)

            PizzaCarouselView(
                currentImageName: viewModel.currentPizzaImageName,
                previousImageName: viewModel.previousPizzaImageName,
                nextImageName: viewModel.nextPizzaImageName,
                currentDimension: viewModel.currentDimension,
                onPreviousPizza: {
                    viewModel.selectPizza(viewModel.previousPizza)
                },
                onNextPizza: {
                    viewModel.selectPizza(viewModel.nextPizza)
                }
            )
            .animation(
                .spring(response: 0.4, dampingFraction: 0.7),
                value: viewModel.state.currentPizza
            )

            .padding(.bottom, 350)

            .onTapGesture {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    viewModel.zoomIn()
                }

            }

            Image(.banana)

            SizePickerView(
                selectedSize: .binding(
                    get: viewModel.state.selectedSize,
                    set: { newSize in
                        viewModel.selectSize(newSize)
                    }
                )
            )
            .offset(y: 30)

            if let pizza = viewModel.state.selectedPizza {
                VStack(spacing: 8) {
                    Text(pizza.description)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 90)
            }
            if viewModel.state.isZoomed {
                Image(viewModel.state.zoomImageName)
                    .onTapGesture {
                        viewModel.dismissZoom()
                    }
                    .simultaneousGesture(
                        MagnificationGesture()
                            .onChanged { value in
                                viewModel.updateZoomScale(value)
                            }
                            .onEnded { _ in
                                viewModel.finalizeZoomScale()
                            }
                    )
                    .transition(.scale(scale: 0.4).combined(with: .opacity))
            }
        }

        bottomBar
            .task {
                await viewModel.loadPizzas()
            }
            .toolbar { toolbarItems }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
    }

    @ToolbarContentBuilder
    var toolbarItems: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                // Back action
            } label: {
                Image(systemName: "chevron.left")
            }
        }

        ToolbarItem(placement: .principal) {
            Text(viewModel.state.currentPizza.rawValue)
                .font(.title)
                .bold()
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                // Like action
            } label: {
                Label("Like", systemImage: "heart")
            }
            .padding()
        }
    }
    @ViewBuilder
    private var bottomBar: some View {
        HStack(spacing: 16) {
            HStack(spacing: 12) {
                Button(action: { viewModel.decrementQuantity() }) {
                    Image(systemName: "minus")
                        .font(.body.weight(.bold))
                        .foregroundStyle(.black)
                        .frame(width: 44, height: 44)
                        .background(.white, in: Circle())
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 2,
                            x: 0,
                            y: 1
                        )
                }
                Text("\(viewModel.state.quantity)")
                    .font(.headline)
                    .frame(minWidth: 10)

                Button(action: { viewModel.incrementQuantity() }) {
                    Image(systemName: "plus")
                        .font(.body.weight(.bold))
                        .foregroundStyle(.black)
                        .frame(width: 44, height: 44)
                        .background(.white, in: Circle())
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 2,
                            x: 0,
                            y: 1
                        )
                }
            }
            .padding(4)
            .background(Color(white: 0.95), in: Capsule())

            // Display Calculated Total Price
            Text(viewModel.state.totalPrice, format: .currency(code: "USD"))
                .font(.headline)
                .fontWeight(.bold)

            Spacer()

            // Action Button
            Button(action: { viewModel.addToCart() }) {
                Text("Add")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 14)
                    .background(Color.cyan, in: Capsule())
            }
        }
        .padding(.horizontal)
    }
}
