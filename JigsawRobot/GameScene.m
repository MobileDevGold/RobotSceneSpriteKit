//
//  GameScene.m
//  JigsawRobot
//
//  Created by Simon Hurst on 16/03/2015.
//  Copyright (c) 2015 Simon Hurst. All rights reserved.
//

#import "GameScene.h"
#import "GameViewController.h"
#import "UniversalHelper.h"
@implementation GameScene{
    
    NSMutableArray*  _itemTorsoArray;
    NSTimer* _updatePos;
    BOOL startGame;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
}




-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        [self buildWorld];
        [self initialData];
        [self initBackground];
        [self initTorsoItems];
        
    }
    return self;
}
- (void)buildWorld {
    
    // Configure physics for the world.
    self.physicsWorld.gravity = CGVectorMake(0, -2); // no gravity
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
}

//======================================================================================================================================================
#pragma mark -
#pragma mark - Game Data Initialize
//======================================================================================================================================================
- (void) initialData{
    
    _itemTorsoArray             = [NSMutableArray array];
    
    _updatePos      = nil;
    startGame       = NO;
    touchEnable     = NO;
    animationEnable = NO;
    currentAnim = 100;
    
}

- (void) initBackground{
    
    SKSpriteNode* bgMain = [SKSpriteNode spriteNodeWithImageNamed:@"bgd_main_Background_1"];
    [bgMain setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height/2)];
    bgMain.xScale =  scaleX;
    bgMain.yScale =  scaleY;
    [self addChild:bgMain];
    
    SKSpriteNode* leftRock = [SKSpriteNode spriteNodeWithImageNamed:@"bgd_left_side_rock"];
    leftRock.xScale = scaleX;
    leftRock.yScale = scaleY;
    [leftRock setPosition:CGPointMake(leftRock.size.width / 2, self.frame.size.height/2)];
    [self addChild:leftRock];
    
    SKSpriteNode* rightRock = [SKSpriteNode spriteNodeWithImageNamed:@"bgd_right_side_rock"];
    rightRock.xScale = scaleX;
    rightRock.yScale = scaleY;
    [rightRock setPosition:CGPointMake(self.frame.size.width - rightRock.size.width / 2, self.frame.size.height/2)];
    [self addChild:rightRock];
    
    SKSpriteNode* topRock = [SKSpriteNode spriteNodeWithImageNamed:@"bgd_top_rocks"];
    topRock.xScale = scaleX;
    topRock.yScale = scaleY;
    [topRock setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height - topRock.size.height / 2)];
    [self addChild:topRock];
    
    SKSpriteNode* bottomRock = [SKSpriteNode spriteNodeWithImageNamed:@"bgd_bottom_rocks"];
    bottomRock.xScale = scaleX;
    bottomRock.yScale = scaleY;
    [bottomRock setPosition:CGPointMake(self.frame.size.width / 2, bottomRock.size.height / 2 -20*scaleX)];
    [self addChild:bottomRock];
    
    
    _mainRobotTexture = [SKSpriteNode spriteNodeWithImageNamed:@"silhouette_robot_texture"];
    _mainRobotTexture.xScale = scaleX;
    _mainRobotTexture.yScale = scaleY;
    [_mainRobotTexture setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 10*scaleY)];
    [self addChild:_mainRobotTexture];
    
    _mainRobot = [SKSpriteNode spriteNodeWithImageNamed:@"silhouette_robot"];
    _mainRobot.xScale = scaleX;
    _mainRobot.yScale = scaleY;
    [_mainRobot setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 +10*scaleY)];
    [self addChild:_mainRobot];
    
    
    
}


- (void) initTorsoItems{
    
    //----------------------------------------------------- Torso -----------------------------------------------------
    _torso = [[Torso alloc] init];
    _torso.xScale = scaleX;
    _torso.yScale = scaleY;
    _torso.name = @"torso";
    [_torso setPosition:CGPointMake(512 * scaleX, 423*scaleY)];
    [self addChild:_torso];
    
    //----------------------------------------------------- Head -----------------------------------------------------
    _head = [[Head alloc] init];
    _head.xScale = scaleX;
    _head.yScale = scaleY;
    _head.name = @"head";
    [self addChild:_head];
    
    //----------------------------------------------------- Antenae -----------------------------------------------------
    _antenae = [[Antennae alloc] init];
    _antenae.xScale = scaleX;
    _antenae.yScale = scaleY;
    _antenae.name = @"antenae";
    [self addChild:_antenae];
    
    //----------------------------------------------------- Arms  -----------------------------------------------------
    _upperLeftArm = [[Arm alloc] initWithType:kTagUpperLeftArm];
    _upperLeftArm.xScale = scaleX;
    _upperLeftArm.yScale = scaleY;
    _upperLeftArm.name= @"upperLeftArm";
    [self addChild:_upperLeftArm];
    
    
    _upperRightArm = [[Arm alloc] initWithType:kTagUpperRightArm];
    _upperRightArm.xScale = scaleX;
    _upperRightArm.yScale = scaleY;
    _upperRightArm.xScale = _upperRightArm.xScale* -1;
    _upperRightArm.name= @"upperRightArm";
    [self addChild:_upperRightArm];
    
    _downLeftArm = [[Arm alloc] initWithType:kTagDownLeftArm];
    _downLeftArm.xScale = scaleX;
    _downLeftArm.yScale = scaleY;
    _downLeftArm.name= @"downLeftArm";
    [self addChild:_downLeftArm];
    
    _downRightArm = [[Arm alloc] initWithType:kTagDownRightArm];
    _downRightArm.xScale = scaleX;
    _downRightArm.yScale = scaleY;
    _downRightArm.xScale = _downRightArm.xScale* -1;
    _downRightArm.name= @"downRightArm";
    [self addChild:_downRightArm];
    
    
    //----------------------------------------------------- Leg -----------------------------------------------------
    _upperLeftleg = [[Leg alloc] initWithLegType:kTagUpperLeftLeg];
    _upperLeftleg.xScale = scaleX;
    _upperLeftleg.yScale = scaleY;
    _upperLeftleg.name= @"upperLeftleg";
    [self addChild:_upperLeftleg];
    
    _upperRightleg = [[Leg alloc] initWithLegType:kTagUpperRightLeg];
    _upperRightleg.xScale = scaleX;
    _upperRightleg.yScale = scaleY;
    _upperRightleg.xScale = _upperRightleg.xScale * -1;
    _upperRightleg.name= @"upperRightleg";
    [self addChild:_upperRightleg];
    
    _downLeftleg = [[Leg alloc] initWithLegType:kTagDownLeftLeg];
    _downLeftleg.xScale = scaleX;
    _downLeftleg.yScale = scaleY;
    _downLeftleg.name= @"downLeftleg";
    [self addChild:_downLeftleg];
    
    _downRightleg = [[Leg alloc] initWithLegType:kTagDownRightLeg];
    _downRightleg.xScale = scaleX;
    _downRightleg.yScale = scaleY;
    _downRightleg.xScale = _downRightleg.xScale * -1;
    _downRightleg.name= @"downRightleg";
    [self addChild:_downRightleg];
    
    //----------------------------------------------------- Hand -----------------------------------------------------
    _leftHand = [[Hand alloc] initWithHandType:kTagLeftHand];
    _leftHand.xScale = scaleX;
    _leftHand.yScale = scaleY;
    _leftHand.name= @"leftHand";
    [self addChild:_leftHand];
    
    _rightHand = [[Hand alloc] initWithHandType:kTagRightHand];
    _rightHand.xScale = scaleX;
    _rightHand.yScale = scaleY;
    _rightHand.name= @"rightHand";
    [self addChild:_rightHand];
    
    [_itemTorsoArray addObject:_torso];
    [_itemTorsoArray addObject:_head];
    [_itemTorsoArray addObject:_antenae];
    [_itemTorsoArray addObject:_upperLeftArm];
    [_itemTorsoArray addObject:_upperRightArm];
    [_itemTorsoArray addObject:_downLeftArm];
    [_itemTorsoArray addObject:_downRightArm];
    [_itemTorsoArray addObject:_upperLeftleg];
    [_itemTorsoArray addObject:_upperRightleg];
    [_itemTorsoArray addObject:_downLeftleg];
    [_itemTorsoArray addObject:_downRightleg];
    [_itemTorsoArray addObject:_leftHand];
    [_itemTorsoArray addObject:_rightHand];
    
    [self RandomPosition];
    startGame = YES;
    
    
    
}
- (void) RandomPosition{
    

    float rotationValue;
    for (int i = 1; i< [_itemTorsoArray count]; i++) {
        Robot* temp = [_itemTorsoArray objectAtIndex:i];
        CGFloat rand_posX = arc4random()%(int)(self.frame.size.width - temp.size.width ) +temp.size.width / 2;
        CGFloat rand_posY = arc4random()%(int)(self.frame.size.height - temp.size.height) +temp.size.height / 2;
        [temp setPosition:CGPointMake(rand_posX, rand_posY)];
        float nRand = arc4random() * 11;
        if (nRand > 5) {
            rotationValue = .15;
        }else{
            rotationValue = -.15;
        }
        temp.zRotation = rotationValue;
        
    }
}


//======================================================================================================================================================
#pragma mark-
#pragma mark - Touch Action Define
//======================================================================================================================================================

//======================================================================================================================================================
#pragma mark-
#pragma mark - Touch Action Define
//======================================================================================================================================================

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint currentLocation = [touch locationInNode:self];
    
    for (int i = 1 ; i < [_itemTorsoArray count]; i++) {
        SKSpriteNode* temp = (SKSpriteNode*)[_itemTorsoArray objectAtIndex:i];
        CGRect rect = temp.frame;
        if (CGRectContainsPoint(rect, currentLocation) && (![temp.name isEqualToString:@"place"])) {
            temp.alpha = .9f;
            touchEnable = YES;
            return;
        }
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!touchEnable)
        return;
    
    UITouch *touch = [touches anyObject];
    CGPoint moveLocation = [touch locationInNode:self];
    
    for (int i = 1 ; i < [_itemTorsoArray count]; i++) {
        
        SKSpriteNode* temp = (SKSpriteNode*)[_itemTorsoArray objectAtIndex:i];
        
        if (temp.alpha < 1.0) {
            
            temp.position =  moveLocation;
        }
    }
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint moveLocation = [touch locationInNode:self];
    
    if (animationEnable) {
        [self checkAnimationPosition:moveLocation];
        return;
    }
    
    for (int i = 1 ; i < [_itemTorsoArray count]; i++) {
        
        Robot* temp = [_itemTorsoArray objectAtIndex:i];
        if (temp.alpha < 1.0) {
            touchEnable = NO;
            temp.alpha = 1.0f;
            [temp checkPosition];
            [self checkAnimationStart];
        }
    }
    
}
- (void) checkAnimationPosition:(CGPoint) pos{
    
    
    if ((pos.x > 300 *scaleX) && (pos.x < 363*scaleX) &&(pos.y < 290*scaleY) && (pos.y >230*scaleY)) {
        
        currentAnim = 0;
        
    }else if((pos.x > 637 *scaleX) && (pos.x < 727*scaleX) &&(pos.y < 300*scaleY) && (pos.y >220*scaleY)){
        
        currentAnim = 1;
        
    }else if((pos.x > 300 *scaleX) && (pos.x < 350*scaleX) &&(pos.y < 380*scaleY) && (pos.y >280*scaleY)){
        
        currentAnim = 2;
        
    }else if ((pos.x > 670 *scaleX) && (pos.x < 715*scaleX) &&(pos.y < 380*scaleY) && (pos.y >280*scaleY)){
        
        currentAnim = 3;
        
    }else if(CGRectContainsPoint(_torso.frame, pos)){
        currentAnim = 4;
    
    }else {
       return;
    }
    
    [self changeAnimation];
    
}
- (void) checkAnimationStart{
    
    BOOL startAnimation = NO;
    
    for (int i = 1 ; i < [_itemTorsoArray count]; i++) {
        Robot* temp = [_itemTorsoArray objectAtIndex:i];
        if (![temp.name isEqualToString:@"place"]) {
            startAnimation = YES;
        }
    }
    
    if (!startAnimation) {
        
        [self removeChildrenInArray:_itemTorsoArray];
        _mainRobot.hidden = YES;
        _mainRobotTexture.hidden = YES;
        
        NSString *filename = @"confetti";
        
        NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"sks"];
        
        
        SKEmitterNode *myParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
        myParticle.position = CGPointMake(self.frame.size.width/2, self.frame.size.height);
        
        // use this to limit the ammount of particle
        myParticle.numParticlesToEmit = 80;
        myParticle.particlePositionRange = CGVectorMake(myParticle.particlePositionRange.dx*IF_IPAD_TWO, myParticle.particlePositionRange.dy);
        
        [self addChild:myParticle];

        
        animationEnable = YES;
        if (skeleton == nil) {
            skeleton = [GHSkeleton skeletonWithFile:@"robot_torso"
                                          directory:@"skeletons"];
            
            [skeleton setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 +70*scaleY)];
            skeleton.xScale = scaleX * 2.0f;
            skeleton.yScale = scaleY * 2.0f;
            [self addChild:skeleton];
            currentAnim = 4;
            [self changeAnimation];

        }
        
        
    }
    
}
-(void)changeAnimation{
    if (currentAnim > 4) {
        return;
    }
    NSArray *animNames = [NSArray arrayWithObjects:
                          @"left_hand",
                          @"right_hand",
                          @"left_arm",
                          @"right_arm",
                          @"sucess_animation",
                          nil];
    
    NSString* finalAnimName = [animNames objectAtIndex:currentAnim];
    GHSkeletalAnimation* animation = [GHSkeletalAnimation animationWithFileName:finalAnimName inDirectory:@"skeletons/animations"];
    [skeleton playAnimation:animation];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    if(skeleton){
        [skeleton update:currentTime];
    }
    
    
}


@end
