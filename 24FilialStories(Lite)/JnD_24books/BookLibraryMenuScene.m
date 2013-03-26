//
//  BookLibraryMenuScene.m
//  JnD_24books
//
//  Created by Jerry on 13/3/23.
//
//

#import "BookLibraryMenuScene.h"
#import "LouLaiZueStoryBookScene.h"

@implementation BookLibraryMenuScene

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    BookLibraryMenuScene *layer = [BookLibraryMenuScene node];
    [scene addChild: layer];
    
    return scene;
}

- (id)init {
    
    if ((self = [super init])) {
        
        
        bl_menuPanel = [CCSprite spriteWithFile:@"bl_itembg.png"];
        bl_menuPanel.position = ccp(530.0, -273.7);
        [self addChild:bl_menuPanel];
        
        CCMenuItem *bl_menu_item = [[CCMenuItemImage
                                     itemFromNormalImage:@"bl_story1_item.png"
                                     selectedImage:@"bl_story1_item_pressed.png"
                                     target:self
                                     selector:@selector(go2LauLeiZue:data:)] retain];
        
        bl_menuMenu = [CCMenu menuWithItems:bl_menu_item, nil];
        bl_menuMenu.position = ccp(487.7, 266.3);
        [bl_menuPanel addChild:bl_menuMenu];
        
        bl_titlePanel = [CCSprite spriteWithFile:@"bl_titlebg.png"];
        bl_titlePanel.position = ccp(500.2, 914.6);
        [self addChild:bl_titlePanel];
        
        CCSprite *bl_title = [CCSprite spriteWithFile:@"bl_title.png"];
        bl_title.position = ccp(649.5, 156.8);
        [bl_titlePanel addChild:bl_title];
        
    }
    return self;
}

- (void) hideCurScene:(CCAction *)callback{
    bl_titlePanel.position = ccp(500.2, 614.6);
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:bl_titlePanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(500.2, 914.6)]] retain];
    
    bl_menuPanel.position = ccp(530.0, 273.7);
    CCTargetedAction *t2 =[[CCTargetedAction actionWithTarget:bl_menuPanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(530.0, -273.7)]] retain];
    
    CCSequence *s1 = [CCSequence actions:t1, t2, callback, nil];
    [self runAction:s1];
}

- (void) showCurScene:(CCAction *)callback{
    bl_menuPanel.position = ccp(530.0, -273.7);
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:bl_menuPanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(530.0, 273.7)]] retain];
    
    bl_titlePanel.position = ccp(500.2, 914.6);
    CCTargetedAction *t2 =[[CCTargetedAction actionWithTarget:bl_titlePanel action:[CCMoveTo actionWithDuration:0.5 position:ccp(500.2, 614.6)]] retain];
    
    CCSequence *s1 = [CCSequence actions:t1, t2, callback, nil];
    [self runAction:s1];
    
}

- (void) resumeCurScene:(id)sender data:(void *)data{
    bl_menuMenu.isTouchEnabled = YES;
    [super resumeCurScene:sender data:data];
}

- (void) pauseCurScene:(id)sender data:(void *)data{
    
    bl_menuMenu.isTouchEnabled = NO;
    [super pauseCurScene:sender data:data];
}

- (void) go2LauLeiZue:(id)sender data:(void *)data{
    [[CCDirector sharedDirector] replaceScene:[LouLaiZueStoryBookScene node]];
}

- (void) onEnterTransitionDidFinish{
    [super onEnterTransitionDidFinish];
    [self showCurScene:nil];
}


@end
