//
//  UpperArm.m
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import "Arm.h"
#import "AppDelegate.h"

@implementation Arm
@synthesize armType;
- (id) initWithType :(ARM_TYPE) type{
    
    if (self = [super init]) {
        armType = type;
        _directions = 0;
        switch (armType) {
           
            case kTagUpperLeftArm:
                self = [Arm spriteNodeWithImageNamed:@"upper_arm_1"];
                [self createUpperArms];
                break;
            case kTagUpperRightArm:
                self = [Arm spriteNodeWithImageNamed:@"upper_arm_1"];
                [self createUpperArms];
                break;
            case kTagDownLeftArm:

                image = 1;
                self = [Arm spriteNodeWithImageNamed:@"forearm"];
                [self createDownArms];
                break;
            case kTagDownRightArm:
                image = 2;
                self = [Arm spriteNodeWithImageNamed:@"forearm"];
                [self createDownArms];
                break;
                
            default:
                break;
        }
    }
    return self;
    
}

- (void) createUpperArms{
  
    SKSpriteNode* detail = [SKSpriteNode spriteNodeWithImageNamed:@"upper_arm_detail"];
    [detail setPosition:CGPointMake(0, -5*scaleY)];
    [self addChild:detail];
    
    SKSpriteNode* shoulder = [SKSpriteNode spriteNodeWithImageNamed:@"arm_shoulder_ball"];
    [shoulder setPosition:CGPointMake( shoulder.size.width *3/ 5-2*scaleX, self.size.height / 2 + shoulder.size.height / 2 - 18*scaleY)];
    [self addChild:shoulder];
    
    SKSpriteNode* shoulderDetail = [SKSpriteNode spriteNodeWithImageNamed:@"arm_shoulder_ball_detail"];
    [shoulderDetail setPosition:CGPointMake( shoulder.size.width *3/ 5 -2*scaleX, self.size.height / 2 + shoulder.size.height / 2 - 18*scaleY)];
    [self addChild:shoulderDetail];
    
 
    
}

- (void) createDownArms{
    
    
    SKSpriteNode* detail = [SKSpriteNode spriteNodeWithImageNamed:@"forearm_detail"];
    [detail setPosition:CGPointMake(0, -2*scaleY)];
    [self addChild:detail];
    

    if (image == 1) {
        SKSpriteNode* armBallA = [SKSpriteNode spriteNodeWithImageNamed:@"arm_ball_1"];
        [armBallA setPosition:CGPointMake( -1*scaleX,  self.size.height / 2 + armBallA.size.height / 2 -1*scaleY)];
        [self addChild:armBallA];
        SKSpriteNode* armBallB = [SKSpriteNode spriteNodeWithImageNamed:@"arm_ball_2"];
        [armBallB setPosition:CGPointMake(-1*scaleX,  self.size.height / 2 + armBallB.size.height / 2 + 5*scaleY)];
        [self addChild:armBallB];
    
    } else if(image == 2){
        SKSpriteNode* armBallA_1 = [SKSpriteNode spriteNodeWithImageNamed:@"arm_ball_4"];
        [armBallA_1 setPosition:CGPointMake(0,  self.size.height / 2 + armBallA_1.size.height / 2 -1*scaleY)];
        [self addChild:armBallA_1];

//        SKSpriteNode* armBallB_1 = [SKSpriteNode spriteNodeWithImageNamed:@"arm_ball_4"];
//        [armBallB_1 setPosition:CGPointMake(-1*scaleX,  self.size.height / 2 + armBallB_1.size.height / 2 + 5*scaleY)];
//        [self addChild:armBallB_1];
    }
 

    
}

- (void) checkPosition{
    
    NSLog(@"Arm.position== (%f, %f)" , self.position.x, self.position.y);
    if ([self.name isEqualToString:@"upperLeftArm"]) {
        if ((self.position.x < 358* scaleX )&&(self.position.x > 318*scaleX) && (self.position.y < 470*scaleY) && (self.position.y > 430*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(338*scaleX , 450*scaleY)];
            self.name = @"place";
        }
    }else if([self.name isEqualToString:@"upperRightArm"]){
        if ((self.position.x < 700* scaleX )&&(self.position.x > 666*scaleX) && (self.position.y < 470*scaleY) && (self.position.y > 430*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(686*scaleX , 450*scaleY)];
            self.name = @"place";
        }
    }else if([self.name isEqualToString:@"downLeftArm"]){
        if ((self.position.x < 336* scaleX )&&(self.position.x > 316*scaleX) && (self.position.y < 338*scaleY) && (self.position.y > 318*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(326*scaleX , 330*scaleY)];
            self.name = @"place";
        }
    }else if([self.name isEqualToString:@"downRightArm"]){
        if ((self.position.x < 707* scaleX )&&(self.position.x > 687*scaleX) && (self.position.y < 340*scaleY) && (self.position.y > 320*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(697*scaleX , 330*scaleY)];
            self.name = @"place";
        }
    }}

@end
