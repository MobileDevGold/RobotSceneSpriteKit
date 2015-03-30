//
//  Head.m
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import "Head.h"
#import "AppDelegate.h"
@implementation Head

- (id) init{
    if (self =[super init]) {
        self = [Head spriteNodeWithImageNamed:@"head"];
        
        [self createItems];
    }
    return self;
}
- (void) createItems {
   
    SKSpriteNode* eye_socketA = [SKSpriteNode spriteNodeWithImageNamed:@"head_eye_sockets"];
    [eye_socketA setPosition:CGPointMake(0, 0)];
    [self addChild:eye_socketA];
 
    SKSpriteNode* eye_socketB = [SKSpriteNode spriteNodeWithImageNamed:@"head_eye_sockets_2"];
    [eye_socketB setPosition:CGPointMake(0, 0)];
    [self addChild:eye_socketB];
 
    SKSpriteNode* eye = [SKSpriteNode spriteNodeWithImageNamed:@"head_eye"];
    [eye setPosition:CGPointMake(-self.size.width / 4 -6*scaleX, 0)];
    [self addChild:eye];
 
}

- (void) checkPosition {
    
    NSLog(@"Head.position== (%f, %f)" , self.position.x, self.position.y);
    if ((self.position.x < 540* scaleX )&&(self.position.x > 500*scaleX) && (self.position.y < 630*scaleY) && (self.position.y > 600*scaleY) ) {
        NSLog(@"Place is Correct");
        self.zRotation = 0;
        [self setPosition:CGPointMake(518 * scaleX, 617*scaleY)];
        self.name = @"place";
    }
 
}
@end
