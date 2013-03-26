//
//  SceneWithPauseMenu.h
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "cocos2d.h"

@interface LayerWithPauseMenu : CCLayerColor {
    CCMenuItem *pm_resumeCurSceneItem;
    CCMenuItem *pm_back2MainMenuSceneItem;
    CCMenuItem *pm_shPausePanelItem;
    CCSprite *pm_menuPanel;
    CCLayer *pm_pauseLayer;
}

- (void) hidePauseMenu:(CCAction *)callback;
- (void) showPauseMenu:(CCAction *)callback;

- (void) resume_pauseCurScene:(id)sender data:(void *)data;
- (void) resumeCurScene:(id)sender data:(void *)data;
- (void) pauseCurScene:(id)sender data:(void *)data;

- (void) back2MainMenuScene:(id)sender data:(void *)data;
- (void) closeCurScene:(id)sender data:(void *)data;
- (void) hideCurScene:(CCAction *)callback;
- (void) showCurScene:(CCAction *)callback;
- (void) replaceWithMainMenuScene;

@end
