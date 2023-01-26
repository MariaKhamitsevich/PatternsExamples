import Foundation

struct ColorSet {
    let red: Int
    let green: Int
    let blue: Int
}

final class ColorSetFactory {
    var colorSetArray: [ColorSet] = []
    
    func getColorSet(red: Int, green: Int, blue: Int) -> ColorSet {
        for color in colorSetArray {
            if color.red == red, color.green == green, color.blue == blue {
                return color
            }
        }
        let colorSet = ColorSet(red: red, green: green, blue: blue)
        colorSetArray.append(colorSet)
        return colorSet
    }
}
