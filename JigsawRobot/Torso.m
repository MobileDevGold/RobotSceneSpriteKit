//
//  Torso.m
//  JigsawRobot
//
//  Created by Admin on 3/18/15.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import "Torso.h"
#import "AppDelegate.h"

@implementation Torso

- (id) init{
    if (self =[super init]) {
        self = [Torso spriteNodeWithImageNamed:@"torso"];
        
        [self create];
    }
    return self;
}
- (void) create {
    
    SKSpriteNode* torso_colourA = [SKSpriteNode spriteNodeWithImageNamed:@"Torso_colour_2"];
    [torso_colourA setPosition:CGPointMake(-.8, -20.5)];
    [self addChild:torso_colourA];
    
    SKSpriteNode* torso_colourB = [SKSpriteNode spriteNodeWithImageNamed:@"Torso_colour_3"];
    [torso_colourB setPosition:CGPointMake(0, 43)];
    torso_colourB.name = @"colour3";
    [self addChild:torso_colourB];
    
    SKSpriteNode* torso_colourC = [SKSpriteNode spriteNodeWithImageNamed:@"Torso_colour_4"];
    [torso_colourC setPosition:CGPointMake(0, 43)];
    [self addChild:torso_colourC];
    
    SKSpriteNode* torso_colourD = [SKSpriteNode spriteNodeWithImageNamed:@"Torso_colour_5"];
    [torso_colourD setPosition:CGPointMake(0, 10)];
    [self addChild:torso_colourD];
    
 
    SKSpriteNode* torso_neck = [SKSpriteNode spriteNodeWithImageNamed:@"neck"];
    [torso_neck setPosition:CGPointMake(10, self.size.height / 2 + torso_neck.size.height / 2 -5)];
    [self addChild:torso_neck];
    
 
    SKSpriteNode* torso_light = [SKSpriteNode spriteNodeWithImageNamed:@"Torso_Light"];
    [torso_light setPosition:CGPointMake(self.size.width / 10 - .2, -self.size.height / 16 - .5)];
    [self addChild:torso_light];
    
}


- (void) checkPosition{
    
    NSLog(@"Torso.position== (%f, %f)" , self.position.x, self.position.y);
    if ((self.position.x < 522* scaleX )&&(self.position.x > 502*scaleX) && (self.position.y < 433*scaleY) && (self.position.y > 413*scaleY) ) {
        NSLog(@"Place is Correct");
        [self setPosition:CGPointMake(512 * scaleX, 423*scaleY)];
        self.name = @"place";
    }
    
}
@end
