//
//  HelloWorldLayer.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface childWater : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCSprite * background;
    CCSprite * selSprite;

    CCSprite * rope;
    CCSprite * waterBar;
    CCSprite * bucket;
    CCSprite * waterHole;
    CCSprite * old;
    CCSprite * bucketInHole;
    
    CGSize  winSize;
    BOOL success;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
