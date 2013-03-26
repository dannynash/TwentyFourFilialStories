//
//  MainMenuScene.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainMenuScene.h"
#import "CCBReader.h"
#import "childWater.h"

#import "childEBook.h"

@implementation MainMenuScene
- (void) pressedPlay:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[childEBook scene] withColor:ccWHITE]];
    
//
//    // Load the game scene
//    CCScene* storyMenuScene = [CCBReader sceneWithNodeGraphFromFile:@"storyMenu.ccbi"];
//
//    // Go to the game scene
//    [[CCDirector sharedDirector] replaceScene:storyMenuScene];
}

@end
