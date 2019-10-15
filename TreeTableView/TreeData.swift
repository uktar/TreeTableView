//
//  TreeData.swift
//  TreeTableView
//
//  Created by uktar on 2019/10/15.
//  Copyright © 2019 uktar. All rights reserved.
//

import Foundation

let treeModel = TreeModel()

class TreeModel {
    var rootNode = TreeNode(value: NodeData())
    
    init() {
        var nodeData = NodeData(id: "1", isExpandable: true, isExpanded: true, isVisiable: true, isSelected: false, name: "name 1", type: .layerOne)
        var treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "")
        
        nodeData = NodeData(id: "2", isExpandable: true, isExpanded: true, isVisiable: true, isSelected: false, name: "name 2", type: .layerOne)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "")
        
        nodeData = NodeData(id: "3", isExpandable: true, isExpanded: true, isVisiable: true, isSelected: false, name: "name 3", type: .layerOne)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "")
        
        
        nodeData = NodeData(id: "1.1", isExpandable: true, isExpanded: true, isVisiable: true, isSelected: false, name: "name 1.1", type: .layerTwo)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "1")
        
        nodeData = NodeData(id: "1.2", isExpandable: true, isExpanded: true, isVisiable: true, isSelected: false, name: "name 1.2", type: .layerTwo)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "1")
        
        nodeData = NodeData(id: "1.3", isExpandable: true, isExpanded: true, isVisiable: true, isSelected: false, name: "name 1.3", type: .layerTwo)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "1")
        
        nodeData = NodeData(id: "2.1", isExpandable: true, isExpanded: true, isVisiable: true, isSelected: false, name: "name 2.1", type: .layerTwo)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "2")
        
        nodeData = NodeData(id: "3.1", isExpandable: false, isExpanded: false, isVisiable: true, isSelected: false, name: "name 3.1", type: .content)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "3")
        
        nodeData = NodeData(id: "3.2", isExpandable: false, isExpanded: false, isVisiable: true, isSelected: false, name: "name 3.2", type: .content)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "3")
        
        nodeData = NodeData(id: "1.2.1", isExpandable: false, isExpanded: false, isVisiable: true, isSelected: false, name: "name 1.2.1", type: .content)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "1.2")
        
        nodeData = NodeData(id: "1.2.2", isExpandable: false, isExpanded: false, isVisiable: true, isSelected: false, name: "name 1.2.2", type: .content)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "1.2")
        
        nodeData = NodeData(id: "1.2.3", isExpandable: false, isExpanded: false, isVisiable: true, isSelected: false, name: "name 1.2.3", type: .content)
        treeNode = TreeNode(value: nodeData)
        rootNode.addChild(node: treeNode, parentNodeId: "1.2")
    }

}
