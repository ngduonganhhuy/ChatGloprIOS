import Foundation
func + <K, V>(left: [K: V], right: [K: V]) -> [K: V] {
    var merge = left
    for (key, value) in right {
        merge[key] = value
    }
    return merge
}

func += <K, V>(left: inout [K: V], right: [K: V]) {
    left = left + right
}

extension Dictionary where Key: ExpressibleByStringLiteral {
    mutating func lowercaseKeys() {
        for key in self.keys {
            if let loweredKey = String(describing: key).lowercased() as? Key {
                self[loweredKey] = self.removeValue(forKey: key)
            }
        }
    }
}
