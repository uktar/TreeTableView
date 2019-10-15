//
//  TreeNode.swift
//  TreeTableView
//
//  Created by uktar on 2019/10/15.
//  Copyright © 2019 uktar. All rights reserved.
//

import Foundation

final class TreeNode<T> {

    public var value: T

    public weak var parent: TreeNode?
    public var children = [TreeNode]()

    public init(value: T) {
        self.value = value
    }

    public func addChild(node: TreeNode) {
        children.append(node)
        node.parent = self
    }

}
