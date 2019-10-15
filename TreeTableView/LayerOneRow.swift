//
//  LayerOneRow.swift
//  TreeTableView
//
//  Created by uktar on 2019/10/15.
//  Copyright © 2019 uktar. All rights reserved.
//

import SwiftUI

struct LayerOneRow: View {
    @Binding var nodeDataList: [NodeData]
    var nodeData: NodeData
    var body: some View {
        HStack {
            Text(self.getName(nodeData: nodeData))
            Spacer()
            Button(action: {
                self.tap(id: self.nodeData.id)
            }, label: { Text(self.nodeData.isExpanded ? "Hide" : "Show")
            })
        }
    }
    
    private func reloadData() {
        self.nodeDataList = treeModel.rootNode.getVisibleNodeList()
    }
    
    private func getName(nodeData: NodeData) -> String {
            return "\(self.nodeData.name)(\(self.leafCount(id: self.nodeData.id)))"
    }
    
    
    private func leafCount(id: String) -> Int{
        if let tappedNode = treeModel.rootNode.search(id: self.nodeData.id) {
            return tappedNode.getLeafCount()
        }
        return 0
    }
    private func tap(id: String) {
        print("Tapped!\(self.nodeData.id)")
        
        if let tappedNode = treeModel.rootNode.search(id: self.nodeData.id) {
            if tappedNode.value.isExpandable == true {
                if tappedNode.value.isExpanded == true {
                    tappedNode.value.isExpanded = false
                    tappedNode.setChildNodeInvisible()
                } else {
                    tappedNode.value.isExpanded = true
                    tappedNode.setChildNodeVisible()
                }
                self.reloadData()
            }
        }
    }
}

struct LayerOneRow_Previews: PreviewProvider {
    @State static var nodeDataList = treeModel.rootNode.getVisibleNodeList()
    static var previews: some View {
        LayerOneRow(nodeDataList: self.$nodeDataList, nodeData: self.nodeDataList[0])
    }
}
