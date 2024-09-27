//
//  WordDetailView.swift
//  SampleApp
//
//  Created by Benjamin Patch on 9/26/24.
//

import SwiftUI

struct WordDetailView: View {
    let entry: WordEntry
    @Binding var navigationStack: [Destination]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Definition")
                    .font(.title)
                ForEach(entry.definitions, id: \.self) { definition in
                    Text("- " + definition)
                }
            }
            .padding(.horizontal)
            .navigationTitle(entry.word)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Next") {
                        navigationStack.append(.detailViewSynonyms(entry))
                    }
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    NavigationStack {
        WordDetailView(entry: .Previews.happy, navigationStack: .constant([]))
    }
}
