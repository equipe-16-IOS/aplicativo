//
//  CriarLista.swift
//  poc
//
//  Created by iredefbmac_28 on 06/07/25.
//
import SwiftUI

struct CriarLista: View {
    @State private var nomeLista = ""
    @State private var data = ""
    @State private var descricao = ""
    @State private var corSelecionada = 0

    let cores: [Color] = [.white, .green.opacity(0.5), .purple.opacity(0.5), .pink.opacity(0.5)]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {

            // TÍTULO
            Text("Criar Lista")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.blue)
                .padding(.top, 10)

            // CAMPOS
            Group {
                // NOME DA LISTA
                Text("Nome da Lista")
                    .font(.system(size: 30, weight: .semibold))

                TextField("Ex: Compras da Semana", text: $nomeLista)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 500)

                // DATA
                Text("Data")
                    .font(.system(size: 30, weight: .semibold))

                TextField("Ex: 30/06/2025", text: $data)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 500)

                // DESCRIÇÃO
                Text("Descrição")
                    .font(.system(size: 30, weight: .semibold))
                
                TextEditor(text: $descricao)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color.clear)
                    .frame(width: 500, height: 150)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1.10)
                )
            }

            // COR
            Text("Cor")
                .font(.system(size: 30, weight: .semibold))

            HStack {
                ForEach(0..<cores.count, id: \.self) { index in
                    Circle()
                        .fill(cores[index])
                        .frame(width: 50, height: 50)
                        .overlay(
                            Circle()
                                .stroke(corSelecionada == index ? Color.blue : Color.clear, lineWidth: 2)
                        )
                        .onTapGesture {
                            corSelecionada = index
                        }
                }
            }

            Spacer()

            // BOTÃO
            HStack {
                Spacer()

                Button(action: {
                    print("Lista criada: \(nomeLista), \(data), \(descricao), cor: \(corSelecionada)")
                }) {
                    HStack {
                        Text("Criar")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 70)
                    .padding(.vertical, 20)
                    .background(Color.blue)
                    .cornerRadius(30)
                }
                .padding(.trailing, 40)
            }
        }
        .padding(30)
    }
}

struct CriarLista_Previews: PreviewProvider {
    static var previews: some View {
        CriarLista()
    }
}
