import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State private var score = 0
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            titleLabel
            dogFactsVStack
            catFactVStack
            refreshButton
        }
        .showErrorAlertWith(title: viewModel.alertTitle, message: viewModel.alertMessage, isShowing: $viewModel.showAlert)
        .task {
            await fetchData()
        }
    }
}

private extension MainView {
    private var titleLabel: some View {
        Text(Strings.MainView.titleLabel)
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    
    private var dogFactsVStack: some View {
        VStack(spacing: 10) {
            Text(Strings.MainView.dogFactsLabel)
                .font(.headline)
            Text(viewModel.dogFacts())
                .font(.subheadline)
        }
        .padding()
    }
    
    private var catFactVStack: some View {
        VStack {
            Text(Strings.MainView.catFactLabel)
                .font(.headline)
            Text(viewModel.catFact())
                .font(.subheadline)
        }
        .padding()
    }
    
    private var refreshButton: some View {
        Button {
            Task { await fetchData() }
        } label: {
            Text(Strings.MainView.refreshButtonTitle)
        }
        .padding()
        .buttonStyle(.borderedProminent)
        
    }
    
    private func fetchData() async {
        async let _ = await viewModel.fetchCatFact()
        async let _ = await viewModel.fetchDogFact()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
