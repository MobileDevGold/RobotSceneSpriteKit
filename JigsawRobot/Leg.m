//
//  DownLeg.m
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import "Leg.h"
#import "AppDelegate.h"

@implementation Leg
@synthesize legType;

- (id) initWithLegType :(LEG_TYPE) type {
    
    if (self = [super init]) {
        legType = type;
        switch (legType) {
                
            case kTagUpperLeftLeg:
                self = [Leg spriteNodeWithImageNamed:@"leg_thigh_1_colour_1"];
                [self createUpperLegs];
                break;
            case kTagUpperRightLeg:
                self = [Leg spriteNodeWithImageNamed:@"leg_thigh_1_colour_1"];
                [self createUpperLegs];
                break;
            case kTagDownLeftLeg:
                self = [Leg spriteNodeWithImageNamed:@"leg_2_colour_1"];
                [self createDownLegs];
                break;
            case kTagDownRightLeg:
                self = [Leg spriteNodeWithImageNamed:@"leg_2_colour_1"];
                [self createDownLegs];
                break;
            
            default:
                break;
        }
        
    }
    
    return self;
    
}

- (void) createUpperLegs{
    
    SKSpriteNode* legColour = [SKSpriteNode spriteNodeWithImageNamed:@"leg_thigh_1_colour_2"];
    [legColour setPosition:CGPointMake(legColour.size.width / 4, self.size.height / 2 + legColour.size.height /2 -1)];
    [self addChild:legColour];
    
    SKSpriteNode* legBallA = [SKSpriteNode spriteNodeWithImageNamed:@"leg_2_colour_2"];
    [legBallA setPosition:CGPointMake( -legBallA.size.width / 2 + 2,   -self.size.height / 2 - legColour.size.height /3)];
    [self addChild:legBallA];
    
    SKSpriteNode* legBallB = [SKSpriteNode spriteNodeWithImageNamed:@"leg_2_colour_3"];
    [legBallB setPosition:CGPointMake(-legBallB.size.width, -self.size.height / 2 - legBallB.size.height /2)];
    [self addChild : legBallB];
    
}

- (void) createDownLegs{
    
    SKSpriteNode* dlegColour = [SKSpriteNode spriteNodeWithImageNamed:@"leg_2_colour_2"];
    [dlegColour setPosition:CGPointMake( .5,self.size.height / 2 -2)];
    [self addChild:dlegColour];
    
    SKSpriteNode* dlegBallA = [SKSpriteNode spriteNodeWithImageNamed:@"foot_colour_1"];
    [dlegBallA setPosition:CGPointMake(-6, -self.size.height / 2 - dlegBallA.size.height / 15 + 3)];
    [self addChild:dlegBallA];
    
    SKSpriteNode* dlegBallB = [SKSpriteNode spriteNodeWithImageNamed:@"foot_colour_2"];
    [dlegBallB setPosition:CGPointMake(-5, -self.size.height / 2 - dlegBallB.size.height / 3 + 3.5)];
    [self addChild:dlegBallB];
    
    
    SKSpriteNode* dlegBallC = [SKSpriteNode spriteNodeWithImageNamed:@"foot_colour_3"];
    [dlegBallC setPosition:CGPointMake( -5 ,-self.size.height / 2 - dlegBallC.size.height *2 / 3 + 3)];
    [self addChild:dlegBallC];
 
}

- (void) checkPosition{
    
    NSLog(@"Leg.position== (%f, %f)" , self.position.x, self.position.y);
    if ([self.name isEqualToString:@"upperLeftleg"]) {
        if ((self.position.x < 466* scaleX )&&(self.position.x > 446*scaleX) && (self.position.y < 235*scaleY) && (self.position.y > 215*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(456 * scaleX, 225*scaleY)];
            self.name = @"place";
        }
    }else if([self.name isEqualToString:@"upperRightleg"]){
        if ((self.position.x < 556* scaleX )&&(self.position.x > 536*scaleX) && (self.position.y < 235*scaleY) && (self.position.y > 215*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(546*scaleX, 225*scaleY)];
            self.name = @"place";
        }
    }else if([self.name isEqualToString:@"downLeftleg"]){
        if ((self.position.x < 448* scaleX )&&(self.position.x > 428*scaleX) && (self.position.y < 145*scaleY) && (self.position.y > 125*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(438*scaleX, 135*scaleY)];
            self.name = @"place";
        }
    }else if([self.name isEqualToString:@"downRightleg"]){
        if ((self.position.x < 574* scaleX )&&(self.position.x > 554*scaleX) && (self.position.y < 145*scaleY) && (self.position.y > 125*scaleY) ) {
            NSLog(@"Place is Correct");
            self.zRotation = 0;
            [self setPosition:CGPointMake(564*scaleX, 135*scaleY)];
            self.name = @"place";
        }
    }


    
}
@end
