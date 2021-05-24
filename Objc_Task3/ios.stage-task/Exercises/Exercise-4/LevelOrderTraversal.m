#import "LevelOrderTraversal.h"

@interface NodeTree : NSObject
 
@property(nonatomic, nullable) NSNumber *value;
@property(nonatomic, nullable) NodeTree *right;
@property(nonatomic, nullable) NodeTree *left;

 
- (NodeTree *)buildNodeTree:(NSArray *) treeArray;
- (NSMutableArray *)nodeTreeTraverse;
 
@end

@implementation NodeTree
 
- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.value = nil;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

- (NodeTree *)buildNodeTree:(NSMutableArray *) treeArray {
    
    if([treeArray count] < 1) {
           return nil;
       }

       id value = [treeArray firstObject];
       [treeArray removeObjectAtIndex:0];
       
       if (value == [NSNull null]) {
           return nil;
       }
       
       NodeTree *root = [NodeTree new];

       root.value = value;
       root.left = [[NodeTree new] buildNodeTree: treeArray];
       root.right = [[NodeTree new] buildNodeTree: treeArray];
    
       return root;
   }

- (NSMutableArray *)nodeTreeTraverse {
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: [self value], nil], nil];
    
    if ([self left]) {
        
        NSArray *left = self.left.nodeTreeTraverse;
        
        for (int i = 0; i < [left count]; i++) {
            if (i < [result count] - 1) [result[i + 1] addObjectsFromArray:left[i]];
            else [result addObject: left[i]];
        }
    }
    
    if ([self right]) {
        
        NSArray *right = self.right.nodeTreeTraverse;
        
        for (int i = 0; i < [right count]; i++) {
            if (i < [result count] - 1) [result[i + 1] addObjectsFromArray:right[i]];
            else [result addObject: right[i]];
        }
    }
    
    return result;
}
 
@end

NSArray *LevelOrderTraversalForTree(NSArray *nodeTree) {
    
    NodeTree *rebuildedNodeTree = [[NodeTree new] buildNodeTree:[nodeTree mutableCopy]];
    
    if (rebuildedNodeTree) {
        return [rebuildedNodeTree nodeTreeTraverse];
    } else {
        return @[];
    }
    
}
