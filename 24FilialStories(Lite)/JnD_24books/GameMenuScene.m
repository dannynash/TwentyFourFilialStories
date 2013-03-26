//
//  GameMenuScene.m
//  JnD_24books
//
//  Created by Jerry on 13/3/23.
//
//

#import "GameMenuScene.h"
#import "LouLaiZueGameScene.h"

@implementation GameMenuScene

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    GameMenuScene *layer = [GameMenuScene node];
    [scene addChild: layer];
    
    return scene;
}

- (id)init {
    
    if ((self = [super init])) {
        
        
        gm_menuPanel = [CCSprite spriteWithFile:@"gm_itembg.png"];
        gm_menuPanel.position = ccp(528.8, 1175.3);
        [self addChild:gm_menuPanel];
        
        CCMenuItem *gm_story1_item = [[CCMenuItemImage
                                       itemFromNormalImage:@"item_story1.png"
                                       selectedImage:@"item_story1_pressed.png"
                                       target:self
                                       selector:@selector(go2Story:)] retain];
        gm_story1_item.position = ccp(-270, 0);
        gm_story1_item.tag = 1;
        
        CCMenuItem *gm_story2_item = [[CCMenuItemImage
                                       itemFromNormalImage:@"item_story2.png"
                                       selectedImage:@"item_story2_pressed.png"
                                       target:self
                                       selector:@selector(go2Story:)] retain];
        gm_story2_item.position = ccp(-20, 0);
        gm_story2_item.tag = 2;
        
        CCMenuItem *gm_story3_item = [[CCMenuItemImage
                                       itemFromNormalImage:@"item_story3.png"
                                       selectedImage:@"item_story3_pressed.png"
                                       target:self
                                       selector:@selector(go2Story:)] retain];
        gm_story3_item.position = ccp(230, 0);
        gm_story3_item.tag = 3;
        
        gm_menuMenu = [CCMenu menuWithItems:gm_story1_item, gm_story2_item, gm_story3_item, nil];
        gm_menuMenu.position = ccp(524.6, 246.8);
        [gm_menuPanel addChild:gm_menuMenu];
        
        gm_titlePanel = [CCSprite spriteWithFile:@"gm_title.png"];
        gm_titlePanel.position = ccp(512.2, 893.0);
        [self addChild:gm_titlePanel];
        
    }
    return self;
}

- (void) hideCurScene:(CCAction *)callback{
    gm_titlePanel.position = ccp(512.2, 593.0);
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:gm_titlePanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(512.2, 893.0)]] retain];
    
    gm_menuPanel.position = ccp(528.8, 375.3);
    CCTargetedAction *t2 =[[CCTargetedAction actionWithTarget:gm_menuPanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(528.8, 1175.3)]] retain];
    
    CCSequence *s1 = [CCSequence actions:t1, t2, callback, nil];
    [self runAction:s1];
}

- (void) showCurScene:(CCAction *)callback{
    gm_titlePanel.position = ccp(512.2, 893.0);
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:gm_titlePanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(512.2, 593.0)]] retain];
    
    gm_menuPanel.position = ccp(528.8, 1175.3);
    CCTargetedAction *t2 =[[CCTargetedAction actionWithTarget:gm_menuPanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(528.8, 375.3)]] retain];
    
    CCSequence *s1 = [CCSequence actions:t2, t1, callback, nil];
    [self runAction:s1];
    
}

- (void) resumeCurScene:(id)sender data:(void *)data{
    gm_menuMenu.isTouchEnabled = YES;
    [super resumeCurScene:sender data:data];
}

- (void) pauseCurScene:(id)sender data:(void *)data{
    
    gm_menuMenu.isTouchEnabled = NO;
    [super pauseCurScene:sender data:data];
}

- (void) go2Story:(id)sender{
    CCAction *callback = nil;
    if([sender tag] == 1)
        callback = [CCCallFuncN actionWithTarget:self selector:@selector(go2Story1)];
    else if([sender tag] == 2)
        callback = [CCCallFuncN actionWithTarget:self selector:@selector(go2Story2)];
    else if([sender tag] == 3)
        callback = [CCCallFuncN actionWithTarget:self selector:@selector(go2Story3)];
    
    [self hideCurScene:callback];
}

- (void) go2Story1{
    [[CCDirector sharedDirector] replaceScene:[LouLaiZueGameScene node]];
}

- (void) go2Story2{
}

- (void) go2Story3{
}

- (void) onEnterTransitionDidFinish{
    [super onEnterTransitionDidFinish];
    [self showCurScene:nil];
}

@end
