# RecyclerView_SwiftUI
#### ScrollView + LazyVStaack(LazzyHStak) = RecyclerView

## * Hou To Use?
```swift
RecyclerView(
    setAxis: .HORIZONTAL,
    setShowBar: true,
    setSpacing: 0,
    setContent: {
        ForEach(1...100, id: \.self) { count in
            Text("Placeholder \(count)")
        }
    }
)
```
## * Full source code

```swift

enum RecyclerViewAxis {
    case HORIZONTAL, VERTICAL
}

struct RecyclerView<GetViewHolder : View>: View {
    
    private var getAxis : RecyclerViewAxis
    private var getShowBar : Bool
    private var getSpacing : CGFloat
    private var getHorizontalAlignment : HorizontalAlignment
    private var getVerticalAlignment : VerticalAlignment
    @ViewBuilder private var getContent : GetViewHolder
    
    init(
        setAxis : RecyclerViewAxis,
        setShowBar : Bool,
        setSpacing : CGFloat,
        setHorizontalAlignment : HorizontalAlignment? = HorizontalAlignment.center,
        setVerticalAlignment : VerticalAlignment? = VerticalAlignment.center,
        setContent : @escaping () -> GetViewHolder
    ) {
        self.getContent = setContent()
        self.getAxis = setAxis
        self.getShowBar = setShowBar
        self.getSpacing = setSpacing
        self.getHorizontalAlignment = setHorizontalAlignment ?? HorizontalAlignment.center
        self.getVerticalAlignment = setVerticalAlignment ?? VerticalAlignment.center
    }
    
    var body: some View {
        ScrollView(setScrollAxis(get: getAxis), showsIndicators : getShowBar){
            switch getAxis {
            case .VERTICAL :
                LazyVStack(alignment: getHorizontalAlignment, spacing: getSpacing){
                    getContent
                }
            case .HORIZONTAL :
                LazyHStack( alignment: getVerticalAlignment, spacing: getSpacing){
                    getContent
                }
            }
        }
           
    }
       
    
    // scrollview의 스크롤 방향을 설정한다.
    private func setScrollAxis(get : RecyclerViewAxis) -> Axis.Set {
        switch get {
        case .VERTICAL :
            return Axis.Set.vertical
        case .HORIZONTAL :
            return Axis.Set.horizontal
        }
    }
}
    
```
