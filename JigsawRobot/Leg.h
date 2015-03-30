//
//  DownLeg.h
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Robot.h"
typedef enum {
    kTagNonLeg,
    kTagUpperLeftLeg,
    kTagUpperRightLeg,
    kTagDownLeftLeg,
    kTagDownRightLeg,
    
} LEG_TYPE;

@interface Leg : Robot {
    
    
}
@property (nonatomic, assign) LEG_TYPE legType;

- (id) initWithLegType:(LEG_TYPE) type;
- (void) checkPosition;
 
@end
