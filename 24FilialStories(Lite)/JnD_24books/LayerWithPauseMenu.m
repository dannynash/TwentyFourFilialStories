//
//  SceneWithPauseMenu.m
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "LayerWithPauseMenu.h"

@implementation LayerWithPauseMenu

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    LayerWithPauseMenu *layer = [LayerWithPauseMenu node];
    [scene addChild: layer];
    
    return scene;
}

- (id)init {
    
    if ((self = [super initWithColor:ccc4(255,255,255,255)])) {
        
        pm_pauseLayer = [CCLayer node];
        pm_pauseLayer.tag = 0;
        pm_pauseLayer.position = ccp(0, 768);
        [self addChild:pm_pauseLayer z:1];
        
        pm_menuPanel = [CCSprite spriteWithFile:@"pause_bg.png"];
        pm_menuPanel.position = ccp(511.9, 318.9);
        [pm_pauseLayer addChild:pm_menuPanel];
        
        CCSprite *pm_title = [CCSprite spriteWithFile:@"pausetitle.png"];
        pm_title.position = ccp(477.8, 701.7);
        [pm_menuPanel addChild:pm_title];
        
        pm_back2MainMenuSceneItem = [[CCMenuItemImage
                                      itemFromNormalImage:@"pause_backmm_item.png"
                                      selectedImage:@"pause_backmm_item_pressed.png"
                                      target:self
                                      selector:@selector(back2MainMenuScene:data:)] retain];
        pm_back2MainMenuSceneItem.position = ccp(0.0, -100.0);
        pm_resumeCurSceneItem = [[CCMenuItemImage
                                  itemFromNormalImage:@"pause_resume_item.png"
                                  selectedImage:@"pause_resume_item_pressed.png"
                                  target:self
                                  selector:@selector(resumeCurScene:data:)] retain];
        pm_resumeCurSceneItem.position = ccp(0.0, 10.0);
        CCMenu *pm_pauseItemsMenu = [CCMenu menuWithItems:pm_back2MainMenuSceneItem, pm_resumeCurSceneItem, nil];
        pm_pauseItemsMenu.position = ccp(475.3, 447.9);
        [pm_menuPanel addChild:pm_pauseItemsMenu];
        
        pm_shPausePanelItem = [[CCMenuItemImage
                                itemFromNormalImage:@"pause_rope.png"
                                selectedImage:@"pause_rope_pressed.png"
                                target:self
                                selector:@selector(resume_pauseCurScene:data:)] retain];
        pm_shPausePanelItem.position = ccp(32.3, -97.0);
        pm_shPausePanelItem.rotation = -20;
        CCMenu *_hsPausePanelMenu = [CCMenu menuWithItems:pm_shPausePanelItem, nil];
        _hsPausePanelMenu.position = ccp(843.5, 256.3);
        [pm_menuPanel addChild:_hsPausePanelMenu];
    }
    return self;
}

- (void) hidePauseMenu:(CCAction *)callback{
    pm_pauseLayer.position = ccp(0, 0);
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:pm_pauseLayer action:[CCMoveTo actionWithDuration:0.5 position:ccp(0, 768)]] retain];
    
    CCSequence *s1 = [CCSequence actions:t1, callback, nil];
    [self runAction:s1];
}

- (void) showPauseMenu:(CCAction *)callback{
    pm_pauseLayer.position = ccp(0, 768);
    CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:pm_pauseLayer action:[CCMoveTo actionWithDuration:0.5 position:ccp(0, 0)]] retain];
    
    CCSequence *s1 = [CCSequence actions:t1, callback, nil];
    [self runAction:s1];
    
}

- (void) resume_pauseCurScene:(id)sender data:(void *)data{
    if (pm_pauseLayer.tag == 1) {
        [self resumeCurScene:sender data:data];
    }else{
        [self pauseCurScene:sender data:data];
    }
}

- (void) resumeCurScene:(id)sender data:(void *)data{
    if (pm_pauseLayer.tag == 1) {
        pm_pauseLayer.tag = 0;
        [self hidePauseMenu:nil];
    }
}

- (void) pauseCurScene:(id)sender data:(void *)data{
    if (pm_pauseLayer.tag == 0) {
        pm_pauseLayer.tag = 1;
        [self showPauseMenu:nil];
    }
}

- (void) back2MainMenuScene:(id)sender data:(void *)data{
    
    [self hidePauseMenu:[CCCallFuncND actionWithTarget:self selector:@selector(closeCurScene:data:) data:nil]];
}

- (void) closeCurScene:(id)sender data:(void *)data{
    CCAction *callback = [CCCallFuncN actionWithTarget:self selector:@selector(replaceWithMainMenuScene)];
    [self hideCurScene:callback];
}

- (void) hideCurScene:(CCAction *)callback{
    [self runAction:callback];
}

- (void) replaceWithMainMenuScene{
    [[CCDirector sharedDirector] popScene];
}

@end


