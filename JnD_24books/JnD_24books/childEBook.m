//
//  childEBook.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/23.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "childEBook.h"
#import "AppDelegate.h"
#import "CCBReader.h"


@implementation childEBook
#define MAX_PAGE 6

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	childEBook *layer = [childEBook node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init {
    if((self = [super init])) {
        winSize = [CCDirector sharedDirector].winSize;
        
        CCSprite * background = [CCSprite spriteWithFile:@"white.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background];
        
        CCSprite * sprite = [CCSprite spriteWithFile:@"page1.png"];
        sprite.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:sprite];
        
        reallyCurrentPage = sprite;
        
        CCMenuItemImage * nextPageButton = [CCMenuItemImage itemWithNormalImage:@"btn-back-0.png" selectedImage:@"btn-back-1.png" disabledImage:@"btn-back-0.png" target:self selector:@selector(nextPage:)];
        [nextPageButton setRotation:-180];
        
        CCMenu * nextPageMenu = [CCMenu menuWithItems:nextPageButton, nil];
        nextPageMenu.position = ccp(winSize.width/10*8, winSize.height/10*8);
        [self addChild:nextPageMenu];
        
//        CCMenuItemImage * prePageButton = [CCMenuItemImage itemWithNormalImage:@"btn-back-0.png" selectedImage:@"btn-back-1.png" disabledImage:@"btn-back-0.png" target:self selector:@selector(prePage:)];
//        
//        CCMenu * prePageMenu = [CCMenu menuWithItems:prePageButton, nil];
//        prePageMenu.position = ccp(winSize.width/10*2, winSize.height/10*8);
//        [self addChild:prePageMenu];
        
        currentPage = 0;
    }

    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    return self;
}

-(CCScene *) makeAScene: (int) currentPage
{
    winSize = [CCDirector sharedDirector].winSize;
    
    CCScene * sc = [CCScene node];
    CCSprite * background = [CCSprite spriteWithFile:@"white.png"];
    background.position = ccp(winSize.width/2, winSize.height/2);
    [sc addChild:background];
    
    NSArray * storyImages = [NSArray arrayWithObjects:@"page1.png",@"page2.png",@"page3.png",@"page4.png",@"page5.png",@"page6.png", nil];
    
    NSString * image = [storyImages objectAtIndex:currentPage];
    CCSprite * sprite = [CCSprite spriteWithFile:image];
    sprite.position = ccp(winSize.width/2, winSize.height/2);
    [sc addChild:sprite];
    
    reallyCurrentPage = sprite;
    
    CCMenuItemImage * nextPageButton = [CCMenuItemImage itemWithNormalImage:@"btn-back-0.png" selectedImage:@"btn-back-1.png" disabledImage:@"btn-back-0.png" target:self selector:@selector(nextPage:)];
    [nextPageButton setRotation:-180];
    
    CCMenu * nextPageMenu = [CCMenu menuWithItems:nextPageButton, nil];
    nextPageMenu.position = ccp(winSize.width/10*8, winSize.height/10*8);
    [sc addChild:nextPageMenu];

    if (currentPage != 0){
        CCMenuItemImage * prePageButton = [CCMenuItemImage itemWithNormalImage:@"btn-back-0.png" selectedImage:@"btn-back-1.png" disabledImage:@"btn-back-0.png" target:self selector:@selector(prePage:)];
    
        CCMenu * prePageMenu = [CCMenu menuWithItems:prePageButton, nil];
        prePageMenu.position = ccp(winSize.width/10*2, winSize.height/10*8);
        [sc addChild:prePageMenu];
    }
    
    return sc;
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


- (void) prePage:(id)sender
{
    if (currentPage == 0) { NSLog(@"Error, no previous page.");}
    else{
        currentPage --;
        CCScene * sc = [self makeAScene:currentPage];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:true]];
    }
    
}

- (void) nextPage:(id)sender
{
    currentPage ++;
    if (currentPage > MAX_PAGE) {
        NSLog(@"Error, no next page");
    }
    else{
        CCScene * sc = [self makeAScene:currentPage];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:false]];
    }
    
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    // determine if it's a touch you want, then return the result
    return YES;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    // do something, or not
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    // do something, or not

}


@end
