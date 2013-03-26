//
//  childEBook.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/23.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <GameKit/GameKit.h>

@interface childEBook : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CGSize  winSize;
    int     currentPage;
    
    CCNode  * reallyCurrentPage;
//    NSArray * storyImages;
    
}
+(CCScene *) scene;
@end
