//
//  storyMenu.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/16.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "storyMenu.h"
#import "CCBReader.h"
#import "child1.h"
#import "CCControlExtension.h"

@implementation storyMenu
#define story1 1
#define story2 2

- (void) pressStory:(id)sender
{
    
    CCControlButton *button = (CCControlButton*) sender;
    switch (button.tag) {
        case story1:
            storyScene = [CCBReader sceneWithNodeGraphFromFile:@"child1.ccbi"];
            break;
        case story2:
//            storyScene = [CCBReader sceneWithNodeGraphFromFile:@"child2.ccbi"];
        default:
            break;
    }
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:storyScene];
}
@end
