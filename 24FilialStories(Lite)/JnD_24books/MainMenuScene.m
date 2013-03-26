//
//  MainMenuScene.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainMenuScene.h"
#import "GameMenuScene.h"
#import "BookLibraryMenuScene.h"

@implementation MainMenuScene

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    MainMenuScene *layer = [MainMenuScene node];
    [scene addChild: layer];

    return scene;
}

- (id)init {
    
    if ((self = [super initWithColor:ccc4(255,255,255,255)])) {
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        [self changeHeight:winSize.width];
        [self changeWidth:winSize.height];
        
        mm_title = [CCSprite spriteWithFile:@"mm_title.png"];
        mm_title.position = ccp(72.6, 503.9);
        mm_title.anchorPoint = ccp(0, 0.2);
        mm_title.scale = 0.0;
        [self addChild:mm_title];
        
        mm_bookIcon = [CCSprite spriteWithFile:@"mm_book.png"];
        mm_bookIcon.position = ccp(-180.0, 238.5);
        [self addChild:mm_bookIcon];
        
        mm_menuPanel = [CCSprite spriteWithFile:@"mm_menubg.png"];
        mm_menuPanel.position = ccp(1340.0, 207.4);
        [self addChild:mm_menuPanel];
        
        
        mm_gameMenuItem = [[CCMenuItemImage
                           itemFromNormalImage:@"mm_start_item.png"
                           selectedImage:@"mm_start_item_pressed.png"
                           target:self
                           selector:@selector(go2GameMenuScene:data:)] retain];
        mm_gameMenuItem.position = ccp(0, 70);
        
        mm_bookLibraryItem = [[CCMenuItemImage
                               itemFromNormalImage:@"mm_bl_item.png"
                               selectedImage:@"mm_bl_item_pressed.png"
                               target:self
                               selector:@selector(go2BookLibraryScene:data:)] retain];
        mm_bookLibraryItem.position = ccp(0, -70);
        
        CCMenu *_mainMenu = [CCMenu menuWithItems:mm_gameMenuItem, mm_bookLibraryItem, nil];
        _mainMenu.position = ccp(306.9, 203.2);
        [mm_menuPanel addChild:_mainMenu];
        
    }
    return self;
}

- (void) hideMainMenu:(CCAction *)callback{
    mm_title.position = ccp(72.6, 503.9);
    mm_title.scale = 1.0;
    mm_bookIcon.position = ccp(197.0, 238.5);
    mm_menuPanel.position = ccp(684.3, 207.4);
    
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:mm_bookIcon action:[CCMoveTo actionWithDuration:0.5 position:ccp(-180.0, 238.5)]] retain];
    CCTargetedAction *t2 =[[CCTargetedAction actionWithTarget:mm_menuPanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(1340.0, 207.4)]] retain];
    CCTargetedAction *t3 =[[CCTargetedAction actionWithTarget:mm_title action:[CCMoveTo actionWithDuration:1.0 position:ccp(72.6, -330)]] retain];
    CCSequence *s1 = [CCSequence actions:t1, t2, t3, callback, nil];
    [self runAction:s1];
}

- (void) showMainMenu:(CCAction *)callback{
    
    mm_title.position = ccp(72.6, 503.9);
    mm_title.scale = 0.0;
    mm_bookIcon.position = ccp(-180.0, 238.5);
    mm_menuPanel.position = ccp(1340.0, 207.4);
    
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:mm_bookIcon action:[CCMoveTo actionWithDuration:0.5 position:ccp(197.0, 238.5)]] retain];
    CCTargetedAction *t2 =[[CCTargetedAction actionWithTarget:mm_menuPanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(684.3, 207.4)]] retain];
    CCTargetedAction *t3 =[[CCTargetedAction actionWithTarget:mm_title action:[CCScaleTo actionWithDuration:1.0 scale:1.0]] retain];
    CCSequence *s1 = [CCSequence actions:t1, t2, t3, callback, nil];
    [self runAction:s1];
    
}

- (void) go2GameMenuScene:(id)sender data:(void *)data{
    [self hideMainMenu:[CCCallFunc actionWithTarget:self selector:@selector(replaceWithGameMenuScene)]];
}

- (void) replaceWithGameMenuScene{
    [[CCDirector sharedDirector] pushScene:[GameMenuScene node]];
}

- (void) go2BookLibraryScene:(id)sender data:(void *)data{
    [self hideMainMenu:[CCCallFunc actionWithTarget:self selector:@selector(replaceWithBookLibraryScene)]];
}

- (void) replaceWithBookLibraryScene{
    [[CCDirector sharedDirector] pushScene:[BookLibraryMenuScene node]];
}

- (void) onEnterTransitionDidFinish{
    [super onEnterTransitionDidFinish];
    [self showMainMenu:nil];
}

@end
