//
//  child1.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "child1.h"
#import "CCBReader.h"
#import "CCControlButton.h"

@implementation child1
-(void) onEnter
{
    [super onEnter];
    soundEffect = [SimpleAudioEngine sharedEngine];
    [soundEffect playBackgroundMusic:@"Bo Peep.mp3" loop:false];
    
}

- (void) nextPage:(id)sender
{
    if ([soundEffect isBackgroundMusicPlaying]){
       [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    }
    
    // Load the game scene
    CCScene* nextPageScene = [CCBReader sceneWithNodeGraphFromFile:@"child2.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1.0 scene:nextPageScene backwards:false]];
}

-(void) homePage:(id)sender
{
    if ([soundEffect isBackgroundMusicPlaying]){
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    }
    CCScene* homePageScene = [CCBReader sceneWithNodeGraphFromFile:@"MainMenuScene.ccbi"];
    [[CCDirector sharedDirector] replaceScene:homePageScene];
}
-(void) muteControl:(id)sender
{
    if ([soundEffect mute] == false){
        [muteButton selected];
        [soundEffect setMute:true];
    }
    else {
        [muteButton unselected];
        [soundEffect setMute:false];
    }
}

@end
