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
        .task {
            await fetchData()
        }
    }
}

private extension MainView {
    private var titleLabel: some View {
        Text("Animal facts:")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    
    private var dogFactsVStack: some View {
        VStack(spacing: 10) {
            Text("Dog Facts:")
                .font(.headline)
            Text(viewModel.dogFacts())
                .font(.subheadline)
        }
        .padding()
    }
    
    private var catFactVStack: some View {
        VStack {
            Text("Cat Fact:")
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
            Text("More facts")
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
