import Foundation

protocol Object: AnyObject {
    var childrenObjects: [Object] { get set }
    var parentObject: Object? { get set }
}

extension Object {
    
    func addObject(object: Object) {
        childrenObjects.append(object)
        object.parentObject = self
    }
    
    func findSuperObject() -> Object {
        if let parentObject = parentObject {
            return parentObject.findSuperObject()
        } else {
            return self
        }
    }
}
