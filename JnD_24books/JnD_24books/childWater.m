//
//  HelloWorldLayer.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

// Import the interfaces
#import "childWater.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "child3.h"
#import "CCBReader.h"
#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation childWater

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	childWater *layer = [childWater node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init {
    if((self = [super init])) {
        winSize = [CCDirector sharedDirector].winSize;
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        background = [CCSprite spriteWithFile:@"white.png"];
        background.anchorPoint = ccp(0,0);
        [self addChild:background];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
        
        CCLabelTTF *storyLabel = [CCLabelTTF labelWithString:@"有一天，他起了個大早，\n想要打水給父母親洗臉。 於是來到了井邊..." fontName:@"Helvetica" fontSize:50];
        storyLabel.position = ccp(winSize.width/2, winSize.height/9*8);
        [self addChild:storyLabel];
        
        rope = [CCSprite spriteWithFile:@"rope.png"];
        rope.position = ccp(winSize.width/4*3 +40, winSize.height/3 +60);
//        [rope setRotation:-45];
        
        CCScaleTo * big = [CCScaleTo actionWithDuration:0.3 scale:1.01];
        CCScaleTo * normal = [CCScaleTo actionWithDuration:0.3 scale:1];
        CCScaleTo * small = [CCScaleTo actionWithDuration:0.3 scale:0.99];
        
        CCSequence * rotSeq = [CCSequence actions:big, normal, small, nil];
        [rope runAction:[CCRepeatForever actionWithAction:rotSeq]];
        
        [self addChild:rope];
        
        old = [CCSprite spriteWithFile:@"oldHitWater.png"];
        old.position = ccp(rope.position.x -30, rope.position.y);
        [old setScale:0.8];
        [self addChild:old];
        
        waterHole = [CCSprite spriteWithFile:@"waterHole.png"];
        waterHole.position = ccp(winSize.width/2, winSize.height/2.5);
        [waterHole setScale:2.5];
        [self addChild:waterHole];
        
        bucketInHole = [CCSprite spriteWithFile:@"bucket.png"];
        bucketInHole.position = ccp(waterHole.position.x -10, waterHole.position.y - 30);
        bucketInHole.opacity = 0;
        [self addChild:bucketInHole];
        
        waterBar = [CCSprite spriteWithFile:@"bar.png"];
        waterBar.position = ccp(winSize.width/9, winSize.height/2);
        [self addChild:waterBar];
        
        bucket = [CCSprite spriteWithFile:@"bucket.png"];
        bucket.position = ccp(waterBar.position.x, waterBar.position.y - waterBar.contentSize.height/2);
        [self addChild:bucket];
    }
    success = FALSE;
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)

	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}


- (void)selectSpriteForTouch:(CGPoint)touchLocation {
    CCSprite * newSprite = nil;   

    if (CGRectContainsPoint(rope.boundingBox, touchLocation)){
        newSprite = rope;
    }
    else{
        newSprite = nil;
    }
    
    if (newSprite != selSprite) {
        selSprite = newSprite;
    }
}
// Get the location user pressed.
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    [self selectSpriteForTouch:touchLocation];
    return TRUE;
}

- (CGPoint)boundWaterBar:(CGPoint)newPos {
    CGPoint retval = newPos;
    retval.y = MAX(retval.y, waterBar.position.y - waterBar.contentSize.height/2);
    retval.y = MIN(retval.y, waterBar.position.y + waterBar.contentSize.height/2);

    retval.x = waterBar.position.x;
    return retval;
}

-(void)newMovePosition:(CGPoint)touchLocation distance:(CGPoint)translation{
    if(selSprite){
        // TODO: (1 ,-1) is according to -45 degree.
        CGFloat projectOffset = [self projectToRope:translation vectorRope:CGPointMake(1, -1)] ;
        [self moveBucket:projectOffset];
    }
}

-(CGFloat) projectToRope: (CGPoint) v1 vectorRope:(CGPoint)v2 {
    return (v1.x * v2.x + v1.y * v2.y)/sqrt(v2.x * v2.x + v2.y * v2.y);
}

- (void)moveBucket:(CGFloat)offset {
    CGPoint newPos = ccp(bucket.position.x, bucket.position.y + offset/4);
    bucket.position = [self boundWaterBar:newPos];
    
    // move bucket in hole    
    CGFloat diffFromBase =  bucket.position.y - (waterBar.position.y + waterBar.contentSize.height/4);
    if (diffFromBase == 0){
        bucketInHole.opacity = 150;
    }
    else if (diffFromBase > 0){
        bucketInHole.opacity = (diffFromBase/(waterBar.contentSize.height/4))*105 + 150;
        CGFloat maxBucketInHole = min(waterHole.position.y, waterHole.position.y -30 + diffFromBase/(waterBar.contentSize.height/4) *30);
        bucketInHole.position = ccp(bucketInHole.position.x, maxBucketInHole);
    }
    else if (diffFromBase < 0){
        bucketInHole.opacity = 0;
    }

    if ((bucket.position.y == waterBar.position.y + waterBar.contentSize.height/2) && (success == FALSE)) {
        success = true;
        [self oldIn];
        [NSTimer scheduledTimerWithTimeInterval:5.5 target:self selector:@selector(waterFull) userInfo:nil repeats:FALSE];
    }
}
-(void) waterFull{
    // Load the game scene
    CCScene* nextPageScene = [CCBReader sceneWithNodeGraphFromFile:@"child3.ccbi"];
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1.0 scene:nextPageScene backwards:false]];
}
-(void) oldIn{
    CCMoveTo * moveIn = [CCMoveTo actionWithDuration:2 position:ccp(old.position.x-70, winSize.height/3 +60)];
    [old runAction:moveIn];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(oldOut) userInfo:nil repeats:FALSE];
}

-(void) oldOut{
    [self removeChild:old cleanup:true]; 
    CCSprite * oldman = [CCSprite spriteWithFile:@"break1.png"];
    oldman.position = ccp(winSize.width/4*3 +40, winSize.height/3 +60);
    [oldman setScale:0.8];
    CCMoveTo * moveOut = [CCMoveTo actionWithDuration:3 position:ccp(winSize.width, oldman.position.y)];
    
    [oldman runAction:moveOut];
    
    [self addChild:oldman];
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    [self newMovePosition:touchLocation distance:translation];
}

@end
