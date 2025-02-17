// MARK: - Models
// Book.swift
struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let description: String
    var isFavorite: Bool
}

// MARK: - ViewModels
// BookListViewModel.swift
import Combine

class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadBooks()
    }
    
    func loadBooks() {
        isLoading = true
        // Simulating network call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.books = [
                Book(title: "1984", author: "George Orwell",
                     description: "A dystopian novel", isFavorite: false),
                Book(title: "The Hobbit", author: "J.R.R. Tolkien",
                     description: "A fantasy novel", isFavorite: false)
            ]
            self.isLoading = false
        }
    }
    
    func toggleFavorite(for bookId: UUID) {
        if let index = books.firstIndex(where: { $0.id == bookId }) {
            books[index].isFavorite.toggle()
        }
    }
}
	
// BookDetailViewModel.swift
class BookDetailViewModel: ObservableObject {
    @Published var book: Book
    private let parentViewModel: BookListViewModel
    
    init(book: Book, parentViewModel: BookListViewModel) {
        self.book = book
        self.parentViewModel = parentViewModel
    }
    
    func toggleFavorite() {
        parentViewModel.toggleFavorite(for: book.id)
    }
}

// MARK: - Views
// BookListView.swift
import SwiftUI

struct BookListView: View {
    @StateObject private var viewModel = BookListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading books...")
                } else {
                    List(viewModel.books) { book in
                        NavigationLink(
                            destination: BookDetailView(
                                viewModel: BookDetailViewModel(
                                    book: book,
                                    parentViewModel: viewModel
                                )
                            )
                        ) {
                            BookRowView(book: book)
                        }
                    }
                }
            }
            .navigationTitle("My Books")
            .alert(item: Binding(
                get: { viewModel.errorMessage.map { ErrorWrapper($0) } },
                set: { _ in viewModel.errorMessage = nil }
            )) { error in
                Alert(title: Text("Error"), message: Text(error.message))
            }
        }
    }
}

// BookRowView.swift
struct BookRowView: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.headline)
            Text(book.author)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if book.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

// BookDetailView.swift
struct BookDetailView: View {
    @ObservedObject var viewModel: BookDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.book.title)
                    .font(.title)
                
                Text(viewModel.book.author)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(viewModel.book.description)
                    .font(.body)
                
                Button(action: {
                    viewModel.toggleFavorite()
                }) {
                    HStack {
                        Image(systemName: viewModel.book.isFavorite ? "star.fill" : "star")
                        Text(viewModel.book.isFavorite ? "Remove from Favorites" : "Add to Favorites")
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Helpers
struct ErrorWrapper: Identifiable {
    let id = UUID()
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
}

// MARK: - Preview Providers
struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookDetailView(
                viewModel: BookDetailViewModel(
                    book: Book(
                        title: "Preview Book",
                        author: "Preview Author",
                        description: "Preview Description",
                        isFavorite: false
                    ),
                    parentViewModel: BookListViewModel()
                )
            )
        }
    }
}
