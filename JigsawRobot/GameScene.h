//
//  GameScene.h
//  JigsawRobot
//

//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Head.h"
#import "Antennae.h"
#import "Arm.h"
#import "Leg.h"
#import "Hand.h"
#import "Torso.h"
#import "GameDevHelper.h"


@interface GameScene : SKScene<SKPhysicsContactDelegate>{
    
    
    GHSkeleton* skeleton;
    BOOL touchEnable;
    BOOL animationEnable;
    int currentAnim;
}
@property (nonatomic, strong) Robot* head;
@property (nonatomic, strong) Antennae* antenae;
@property (nonatomic, strong) Arm* upperRightArm;
@property (nonatomic, strong) Arm* upperLeftArm;
@property (nonatomic, strong) Arm* downRightArm;
@property (nonatomic, strong) Arm* downLeftArm;
@property (nonatomic, strong) Leg* upperRightleg;
@property (nonatomic, strong) Leg* upperLeftleg;
@property (nonatomic, strong) Leg* downRightleg;
@property (nonatomic, strong) Leg* downLeftleg;
@property (nonatomic, strong) Hand* rightHand;
@property (nonatomic, strong) Hand* leftHand;
@property (nonatomic, strong) Torso* torso;
@property (nonatomic, strong) SKSpriteNode* mainRobot;
@property (nonatomic, strong) SKSpriteNode* mainRobotTexture;

@end
