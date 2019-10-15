//
//  DataRow.swift
//  TreeTableView
//
//  Created by uktar on 2019/10/8.
//  Copyright © 2019 uktar. All rights reserved.
//

import SwiftUI

struct DataRow: View {
    @Binding var nodeDataList: [NodeData]
    var nodeData: NodeData
    var body: some View {
        HStack {
            if nodeData.type == .layerOne {
                Text("\(self.nodeData.name)(\(self.leafCount(id: self.nodeData.id)))")
                Spacer()
                Button(action: {
                    self.tap(id: self.nodeData.id)
                    }, label: { Text(self.nodeData.isExpanded ? "Hide" : "Show")
                })

            } else if nodeData.type == .layerTwo {
                Text("  \(self.nodeData.name)(\(self.leafCount(id: self.nodeData.id)))")
                Spacer()
                Button(action: {
                    self.tap(id: self.nodeData.id)
                    }, label: { Text(self.nodeData.isExpanded ? "Hide" : "Show")
                })
      
            } else {
                Image(systemName: "person.icloud")
                Text(self.nodeData.name)
            }
        }
    }
    
    private func reloadData() {
        self.nodeDataList = treeModel.rootNode.getVisibleNodeList()
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

struct DataRow_Previews: PreviewProvider {
    @State static var nodeDataList = treeModel.rootNode.getVisibleNodeList()
    static var previews: some View {
        DataRow(nodeDataList: self.$nodeDataList, nodeData: self.nodeDataList[0])
    }
}
