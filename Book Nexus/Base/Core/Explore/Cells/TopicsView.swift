//
//  TopicsView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 26/01/2023.
//

import SwiftUI


struct TopicModel: Identifiable, Hashable{
    var id = UUID()
    let name: String
}
protocol ItemsViewModel{
    associatedtype Item: Hashable
    func getItems() -> [Item]
    func selectItem(for item: Item)
}

class TopicsViewModel: ItemsViewModel{
    typealias Item = TopicModel
    
    init() { }
    
    func getItems() -> [Item] {
        return [TopicModel(name: "Personal growth"), TopicModel(name: "Culture & Society"), TopicModel(name: " Mind & Philosopht"), TopicModel(name: "Fiction"), TopicModel(name: "Health & Fitness"), TopicModel(name: "Biographies"), TopicModel(name: "Education"), TopicModel(name: "History"), TopicModel(name: "Future"), TopicModel(name: "Technology")]
    }
    func selectItem(for item: TopicModel) {
        print(item.id)
    }

}

struct TopicsView: View {
    @State var viewModel = TopicsViewModel()
    var body: some View {
//        ScrollView {
            FlowLayout(viewModel.getItems()) { item in
            Button(action: {
              viewModel.selectItem(for: item)
            }, label: {
              Text(item.name)
                    .font(.footnote)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color(uiColor: UIColor(red: 98/255, green: 102/255, blue: 102/255, alpha: 1)))
                .cornerRadius(10)
            })

          }
          .padding()
//        }
        .background(Color(uiColor: ColorsManager.backgroudColor))

        
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TopicsView()
    }
}

struct FlowLayout<Data, RowContent>: View where Data: RandomAccessCollection, RowContent: View, Data.Element: Identifiable, Data.Element: Hashable {
  
    @State private var height: CGFloat = .zero

    private var data: Data
    private var spacing: CGFloat
    private var rowContent: (Data.Element) -> RowContent

    public init(_ data: Data, spacing: CGFloat = 4, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) {
        self.data = data
        self.spacing = spacing
        self.rowContent = rowContent
    }

    var body: some View {
        GeometryReader { geometry in
            content(in: geometry)
            .background(viewHeight(for: $height))
        }
        .frame(height: height)
    }

  private func content(in geometry: GeometryProxy) -> some View {
    var bounds = CGSize.zero

    return ZStack {
      ForEach(data) { item in
          rowContent(item)
            .padding(.all, spacing)
            .alignmentGuide(VerticalAlignment.center) { dimension in
              let result = bounds.height

              if let firstItem = data.first, item == firstItem {
                bounds.height = 0
              }
              return result
            }
            .alignmentGuide(HorizontalAlignment.center) { dimension in
              if abs(bounds.width - dimension.width) > geometry.size.width {
                bounds.width = 0
                bounds.height -= dimension.height
              }

              let result = bounds.width

              if let firstItem = data.first, item == firstItem {
                bounds.width = 0
              } else {
                bounds.width -= dimension.width
              }
              return result
            }

                  
      }
    }
  }

  private func viewHeight(for binding: Binding<CGFloat>) -> some View {
    GeometryReader { geometry -> Color in
      let rect = geometry.frame(in: .local)

      DispatchQueue.main.async {
        binding.wrappedValue = rect.size.height
      }
      return .clear
    }
  }
}
