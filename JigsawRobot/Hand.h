//
//  Hand.h
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Robot.h"
typedef enum {
    
    kTagNonHand,
    kTagLeftHand,
    kTagRightHand,
    
} HAND_TYPE;

@interface Hand : Robot {
    
    
}
@property (nonatomic, assign) HAND_TYPE handType;

- (id) initWithHandType :(HAND_TYPE) type;
- (void) checkPosition;
@end
