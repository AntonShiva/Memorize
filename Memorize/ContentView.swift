//
//  ContentView.swift
//  Memory_Training_CS193P
//
//  Created by Anton Rasen on 06.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🛶", "🛳️", "🚀", "🚘", "🚁",  "🛺", "🛸", "✈️", "🚜", "🚎", "🚲", "🛰️", "🛴", "🚚", "🚤", "🛵", "🚕", "🚃", "⛵️", "🏍️", "🛻", "🚂", "🏎️", "🚢", ]
  @State  var emojiCount = 20
    
    
    var body: some View {
        VStack {
          ScrollView {
              LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji).aspectRatio(2/3,  contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
            remove
            Spacer()
           add
        }
            .font(.largeTitle)
            .padding(.horizontal)
    }
            .padding(.horizontal)
            
    }
     
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
                   }
                 } label: {
                    Image(systemName: "minus.circle")
            }

    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
                     }
                    } label: {
                      Image(systemName: "plus.circle")
            }
        }
    
    }


    struct CardView: View {
        var content: String
      @State  var isFacUp: Bool = true
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20.0)
                   if isFacUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                }  else {
                    shape.fill()
                }
            }
            
            .onTapGesture {
                isFacUp = !isFacUp
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 14 Pro")
        }
    }


