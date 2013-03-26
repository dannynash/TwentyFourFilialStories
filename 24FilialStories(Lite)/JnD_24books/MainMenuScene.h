//
//  MainMenuScene.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface MainMenuScene : CCLayerColor {
    CCMenuItem *mm_gameMenuItem;
    CCMenuItem *mm_bookLibraryItem;
    CCSprite *mm_menuPanel;
    CCSprite *mm_bookIcon;
    CCSprite *mm_title;
}

+ (CCScene *) scene;
- (void) hideMainMenu:(CCAction *)callback;
- (void) showMainMenu:(CCAction *)callback;
- (void) go2GameMenuScene:(id)sender data:(void *)data;
- (void) go2BookLibraryScene:(id)sender data:(void *)data;
- (void) replaceWithGameMenuScene;
- (void) replaceWithBookLibraryScene;
@end
