//
//  UpperArm.h
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Robot.h"
typedef enum {
    
    kTagNonArm,
    kTagUpperLeftArm,
    kTagUpperRightArm,
    kTagDownLeftArm,
    kTagDownRightArm,
 
} ARM_TYPE;

@interface Arm : Robot{
    
}
@property (nonatomic, assign) ARM_TYPE armType;
@property (nonatomic) int directions;;

- (id) initWithType :(ARM_TYPE) type;
- (void) checkPosition;
@end
