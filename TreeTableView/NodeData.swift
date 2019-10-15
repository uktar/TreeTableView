//
//  NodeData.swift
//  TreeTableView
//
//  Created by uktar on 2019/10/8.
//  Copyright © 2019 uktar. All rights reserved.
//

import Foundation

enum NodeType: Int {
    case layerZero = 0
    case layerOne = 1
    case layerTwo = 2
    case content = 10
}

protocol FolderValue {
    var id: String { get set }
    var isExpandable: Bool { get set }
    var isExpanded: Bool { get set }
    var isVisiable: Bool { get set }
    var isSelected: Bool { get set }
}


struct NodeData: Identifiable, FolderValue {
    var id: String = ""
    var isExpandable: Bool = false
    var isExpanded: Bool = false
    var isVisiable: Bool = false
    var isSelected: Bool = false
    var name: String = ""
    var type: NodeType = .layerZero
}

extension TreeNode where T: FolderValue {
    func search(id: String) -> TreeNode? {
        if id == self.value.id {
            return self
        }
        for child in children {
            if let found = child.search(id: id) {
                return found
            }
        }
        return nil
    }
    
    func addChild(node: TreeNode, parentNodeId: String) {
        if let parentNode = search(id: parentNodeId) {
            parentNode.addChild(node: node)
        }
    }

    func printTree() {
        var s = ""
        if !children.isEmpty {
            s += " {" + children.map { $0.value.id }.joined(separator: ", ") + "}"
            print(s)
        }
        for child in children {
            child.printTree()
        }
        
    }
    
    func printPreOrderTraversal() {
        
        print(value.id)
        for child in children {
            child.printPreOrderTraversal()
        }
    }
    
    func doPreOrderTraversal(process: @escaping (T) -> ()) {

        process(value)
        for child in children {
            child.doPreOrderTraversal(process: process)
        }
    }

    func setChildNodeInvisible() {
        for child in children {
            child.value.isVisiable = false
            child.setChildNodeInvisible()
        }
    }

    func setChildNodeVisible() {
        
        for child in children {
            child.value.isVisiable = true
            if child.value.isExpandable == true && child.value.isExpanded == true {
                child.setChildNodeVisible()
            }
        }
    }
    
    func getLeafCount() -> Int {
        var count = 0
        
        for child in children {
            if child.value.isExpandable == false {
                count += 1
            } else {
                count += child.getLeafCount()
            }
        }
        return count
    }
    
    func getVisibleNodeList() -> [T] {
        var nodeList: [T] = []
        if value.isVisiable == true {
            nodeList.append(value)
        }
        for child in children {
            if child.value.isVisiable == true {
                nodeList += child.getVisibleNodeList()
            }
        }
        return nodeList
    }

}
 
