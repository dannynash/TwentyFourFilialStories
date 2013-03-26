//
//  GameMenuScene.h
//  JnD_24books
//
//  Created by Jerry on 13/3/23.
//
//

#import "cocos2d.h"
#import "LayerWithPauseMenu.h"

@interface GameMenuScene : LayerWithPauseMenu{
    NSArray *gm_storyItemsArray;
    CCMenu *gm_menuMenu;
    CCSprite *gm_menuPanel;
    CCSprite *gm_titlePanel;
}

+ (CCScene *) scene;
- (void) pauseCurScene:(id)sender data:(void *)data;
- (void) resumeCurScene:(id)sender data:(void *)data;
- (void) go2Story:(id)sender;
- (void) go2Story1;
- (void) go2Story2;
- (void) go2Story3;

@end
