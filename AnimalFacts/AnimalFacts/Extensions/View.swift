import SwiftUI

extension View {
    func showErrorAlertWith(title: String, message: String, isShowing: Binding<Bool>, buttonTitle: String = "OK") -> some View {
        return alert(title, isPresented: isShowing) {
            //
        } message: {
            Text(message)
        }
    }
}
