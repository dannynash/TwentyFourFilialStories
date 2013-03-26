//
//  BookLibraryMenuScene.h
//  JnD_24books
//
//  Created by Jerry on 13/3/23.
//
//

#import "cocos2d.h"
#import "LayerWithPauseMenu.h"

@interface BookLibraryMenuScene : LayerWithPauseMenu{
    NSArray *bl_storyItemsArray;
    CCMenu *bl_menuMenu;
    CCSprite *bl_menuPanel;
    CCSprite *bl_titlePanel;
}

+ (CCScene *) scene;
- (void) pauseCurScene:(id)sender data:(void *)data;
- (void) resumeCurScene:(id)sender data:(void *)data;
- (void) go2LauLeiZue:(id)sender data:(void *)data;
@end
