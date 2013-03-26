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
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCSprite * background;
    CCSprite * selSprite;
    NSMutableArray * movableSprites;
    
    CCSprite * waterBar;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end

