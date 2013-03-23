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
@implementation MainMenuScene
- (void) pressedPlay:(id)sender
{
    // Load the game scene
    CCScene* storyMenuScene = [CCBReader sceneWithNodeGraphFromFile:@"storyMenu.ccbi"];

//	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[childWater scene] withColor:ccWHITE]];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:storyMenuScene];
}

@end
