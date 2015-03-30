//
//  Hand.m
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import "Hand.h"
#import "AppDelegate.h"
@implementation Hand
@synthesize handType;
- (id) initWithHandType :(HAND_TYPE) type {
    
    if (self = [super init]) {
        handType = type;
        switch (handType) {
                
            case kTagLeftHand:
                handValue = 1;
                self = [Hand spriteNodeWithImageNamed:@"hand_back"];
                [self createLeftHands];
                break;
            case kTagRightHand:
                handValue = 2;
                self = [Hand spriteNodeWithImageNamed:@"hand_back"];
                [self createRightHands];
                break;
                
            default:
                break;
        }
        
    }
    
    return self;
    
}

- (void) createLeftHands{
    
     SKSpriteNode* leftHand_R = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1"];
    [leftHand_R setPosition:CGPointMake(leftHand_R.size.width / 2 -7*scaleX, 0)];
    [self addChild:leftHand_R];
    
    SKSpriteNode* lhand_detail_R = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_detail"];
    [lhand_detail_R setPosition:CGPointMake(leftHand_R.position.x, 0)];
    [self addChild:lhand_detail_R];
    
    SKSpriteNode* leftHand_L = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1"];
    leftHand_L.xScale = leftHand_L.xScale* -1;
    [leftHand_L setPosition:CGPointMake(-leftHand_L.size.width / 2, 0)];
    [self addChild:leftHand_L];
    
    SKSpriteNode* lhand_detail_L = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_detail"];
    [lhand_detail_L setPosition:CGPointMake(leftHand_L.position.x, 0)];
    lhand_detail_L.xScale = lhand_detail_L.xScale*-1;
    [self addChild:lhand_detail_L];
    
    SKSpriteNode* lhand_knobsA_R = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_Knobs"];
    [lhand_knobsA_R setPosition:CGPointMake(lhand_detail_R.position.x -8*scaleX , lhand_knobsA_R.size.height / 2-7*scaleY)];
    [self addChild:lhand_knobsA_R];
    
    SKSpriteNode* lhand_knobsA_L = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_Knobs"];
    [lhand_knobsA_L setPosition:CGPointMake(lhand_detail_L.position.x +8*scaleX , lhand_knobsA_L.size.height / 2 -7*scaleY)];
    lhand_knobsA_L.xScale = lhand_knobsA_L.xScale* -1;
    [self addChild:lhand_knobsA_L];
    
    SKSpriteNode* lhand_knobsC = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_Knobs_2"];
    [lhand_knobsC setPosition:CGPointMake( -3*scaleX, self.frame.size.height * 1/ 3- 3*scaleY)];
    [self addChild:lhand_knobsC];

    
    
}

- (void) createRightHands{
    
    SKSpriteNode* leftHand_R = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1"];
    [leftHand_R setPosition:CGPointMake(leftHand_R.size.width / 2 -7.2*scaleX, 0)];
    [self addChild:leftHand_R];
    
    SKSpriteNode* lhand_detail_R = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_detail"];
    [lhand_detail_R setPosition:CGPointMake(leftHand_R.position.x, 0)];
    [self addChild:lhand_detail_R];
    
    SKSpriteNode* leftHand_L = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1"];
    leftHand_L.xScale = leftHand_L.xScale* -1;
    [leftHand_L setPosition:CGPointMake(-leftHand_L.size.width / 2, 0)];
    [self addChild:leftHand_L];
    
    SKSpriteNode* lhand_detail_L = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_detail"];
    [lhand_detail_L setPosition:CGPointMake(leftHand_L.position.x, 0)];
    lhand_detail_L.xScale = lhand_detail_L.xScale*-1;
    [self addChild:lhand_detail_L];
    
    SKSpriteNode* lhand_knobsA_R = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_Knobs"];
    [lhand_knobsA_R setPosition:CGPointMake(lhand_detail_R.position.x -8*scaleX , lhand_knobsA_R.size.height / 2-7*scaleY)];
    [self addChild:lhand_knobsA_R];
    
    SKSpriteNode* lhand_knobsA_L = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_Knobs"];
    [lhand_knobsA_L setPosition:CGPointMake(lhand_detail_L.position.x +8*scaleX , lhand_knobsA_L.size.height / 2 -7*scaleY)];
    lhand_knobsA_L.xScale = lhand_knobsA_L.xScale* -1;
    [self addChild:lhand_knobsA_L];
    
    SKSpriteNode* lhand_knobsC = [SKSpriteNode spriteNodeWithImageNamed:@"hand_1_Knobs_2"];
    [lhand_knobsC setPosition:CGPointMake( -3*scaleX, self.frame.size.height * 1/ 3- 3*scaleY)];
    [self addChild:lhand_knobsC];
}

- (void) checkPosition{
    
    NSLog(@"Hand.Name== (%@)" , self.name);
  
    if ([self.name isEqualToString:@"leftHand"]) {
        if ((self.position.x < 343* scaleX )&&(self.position.x > 323*scaleX) && (self.position.y < 272*scaleY) && (self.position.y > 252*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(333*scaleX, 258*scaleY)];
            self.name = @"place";
        }
    }else if([self.name isEqualToString:@"rightHand"]){
        if ((self.position.x < 707* scaleX )&&(self.position.x > 687*scaleX) && (self.position.y < 268*scaleY) && (self.position.y > 248*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(697*scaleX, 258*scaleY)];
            self.name = @"place";
        }
    }
}

@end
