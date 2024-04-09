//
//  ContentView.swift
//  Pick-A-Pal
//
//  Created by Justin Hold on 4/9/24.
//

import SwiftUI

struct ContentView: View {
	
	// MARK: - PROPERTIES
	@State private var names: [String] = []
	@State private var nameToAdd: String = ""
	@State private var pickedName: String = ""
	@State private var nameIsBeingRemoved: Bool = false
	
	// MARK: - VIEW BODY
    var body: some View {
		
		VStack {
			
			VStack(spacing: 8) {
				
				Image(systemName: "person.3.sequence.fill")
					.foregroundStyle(.tint)
					.symbolRenderingMode(.hierarchical)
				
				Text("Pick-A-Pal")
					.font(.title)
					.bold()
			}
			
			Text(pickedName.isEmpty ? " " : pickedName)
				.font(.title2)
				.bold()
				.foregroundStyle(.tint)
			
			List {
				ForEach(names, id: \.self) { name in
					Text(name)
				}
			}
			.clipShape(RoundedRectangle(cornerRadius: 15))
			
			TextField("Enter your name", text: $nameToAdd)
				.autocorrectionDisabled()
				.padding()
				.border(Color.gray)
				.onSubmit {
					// If the "nameToAdd" textField is NOT empty
					if !nameToAdd.isEmpty {
						// Append the "names" array with
						// the contents of "nameToAdd" text
						names.append(nameToAdd)
						// Reset the "nameToAdd" textField
						// to an empty string
						nameToAdd = ""
					}
				}
			
			Toggle("Remove picked names", isOn: $nameIsBeingRemoved)
			
			Button {
				if let randomName = names.randomElement() {
					pickedName = randomName
					if nameIsBeingRemoved {
						names.removeAll { name in
							return (name == randomName)
						}
					}
				} else {
					pickedName = ""
				}
			} label: {
				Text("Pick Random Name")
					.padding(.vertical, 8)
					.padding(.horizontal, 16)
			}
			.buttonStyle(.borderedProminent)
			.font(.title2)
			
		}
		.padding()
    }
}

#Preview {
    ContentView()
}
