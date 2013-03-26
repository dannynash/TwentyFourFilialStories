//
//  child2.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "child2.h"
#import "CCBReader.h"
#import "childWater.h"

@implementation child2
- (void) prePage:(id)sender
{
    // Load the game scene
    CCScene* prePageScene = [CCBReader sceneWithNodeGraphFromFile:@"child1.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1.0 scene:prePageScene backwards:true]];
}

- (void) nextPage:(id)sender
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[childWater scene] withColor:ccWHITE]];
}
@end
