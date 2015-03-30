//
//  Antennae.m
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import "Antennae.h"
#import "AppDelegate.h"

@implementation Antennae

- (id) init{
    if (self =[super init]) {
        self = [Antennae spriteNodeWithImageNamed:@"head_antennae"];
        
        [self createItems];
    }
    return self;
}

- (void) createItems {
    
    SKSpriteNode* wibble = [SKSpriteNode spriteNodeWithImageNamed:@"head_antennae_wibble"];
    [wibble setPosition: CGPointMake(wibble.size.width / 2, self.size.height / 3 + wibble.size.height / 2)];
    [self addChild:wibble];
 
}

- (void) checkPosition{
    
    NSLog(@"Antenna.position== (%f, %f)" , self.position.x, self.position.y);
    if ((self.position.x < 558* scaleX )&&(self.position.x > 538*scaleX) && (self.position.y < 665*scaleY) && (self.position.y > 645*scaleY) ) {
        NSLog(@"Place is Correct");
        self.zRotation = 0;
        [self setPosition:CGPointMake(548 * scaleX, 655*scaleY)];
        self.name = @"place";
    }
}
@end
