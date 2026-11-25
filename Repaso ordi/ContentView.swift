//
//  ContentView.swift
//  Repaso ordi
//
//  Created by Daniel on 11/25/26.
//

import SwiftUI

// View: todo lo que se ve en pantalla es un struct que cumple el protocolo View
struct ContentView: View {

    // let: constante, se asigna una vez y no cambia
    let titulo: String = "Repaso SwiftUI"

    // var: propiedad que puede recibir otro valor al crear la vista (param)
    var colorTarjeta: Color = .blue

    // @State: valor que SÍ cambia; cuando cambia, SwiftUI redibuja la vista
    @State private var grande = false
    @State private var contador = 0

    // body: lo que la vista muestra en pantalla
    var body: some View {

        // ScrollView: permite desplazar el contenido si no cabe en pantalla
        ScrollView {

            // VStack: apila sus elementos en vertical (de arriba hacia abajo)
            VStack(spacing: 24) {

                // Text: muestra texto
                Text(titulo)
                    .font(.largeTitle)   // .font: cambia tamaño/estilo de letra
                    .bold()

                // Image: muestra una imagen; systemName usa íconos de SF Symbols
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)

                // ZStack: apila en profundidad (el último queda al frente)
                ZStack {
                    // RoundedRectangle: rectángulo con esquinas redondeadas
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colorTarjeta)
                        .frame(width: 220, height: 120)

                    // Label: ícono + texto juntos
                    Label("Swift", systemImage: "swift")
                        .font(.title2)
                        .foregroundStyle(.white)
                }

                // Circle: figura circular
                Circle()
                    .fill(.orange)
                    // el tamaño depende del estado: 150 si grande es true, 80 si no
                    .frame(width: grande ? 150 : 80, height: grande ? 150 : 80)
                    // .overlay: pone una vista ENCIMA de esta
                    .overlay {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.white)
                    }

                // Text que lee el @State: se actualiza solo cuando contador cambia
                Text("Contador: \(contador)")
                    .font(.headline)

                // HStack: apila sus elementos en horizontal (izquierda a derecha)
                HStack(spacing: 16) {

                    // Button: ejecuta una acción al tocarlo
                    Button("Animar") {
                        // withAnimation: anima el cambio de estado que va dentro
                        withAnimation {
                            grande.toggle()   // cambia true <-> false
                        }
                    }
                    .padding()             // espacio alrededor del texto
                    .background(.green)    // .background: pone algo DETRÁS
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    Button("Sumar") {
                        contador += 1      // modifica el @State, la vista se redibuja
                    }
                    .padding()
                    .background(.purple)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}

#Preview {
    // Aquí se crea la vista; puedes pasar params: ContentView(colorTarjeta: .red)
    ContentView()
}
