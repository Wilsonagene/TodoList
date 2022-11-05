//
//  AddView.swift
//  TodoList
//
//  Created by wilson agene on 5/6/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textfield: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textfield, axis: .vertical)
//                    .lineLimit(5)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                
                Button {
                    saveButton()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            Spacer(minLength: 500)


                
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✍️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButton() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textfield)
            presentationMode.wrappedValue.dismiss()
        }
      
    }
    
    func textIsAppropriate() -> Bool {
        if  textfield.count < 3 {
            alertTitle = "Your new item must be at least 3 character long!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
