//
//  child3.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "child3.h"
#import "CCBReader.h"
#import "childWater.h"

@implementation child3
- (void) prePage:(id)sender
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[childWater scene] withColor:ccWHITE]];
}

- (void) nextPage:(id)sender
{
    // Load the game scene
    CCScene* nextPageScene = [CCBReader sceneWithNodeGraphFromFile:@"child4.ccbi"];
    
    // Go to the game scene
     [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1.0 scene:nextPageScene backwards:false]];
}
@end
