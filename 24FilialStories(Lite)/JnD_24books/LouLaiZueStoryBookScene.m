//
//  LouLaiZueStoryBookScene.m
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "LouLaiZueStoryBookScene.h"

@implementation LouLaiZueStoryBookScene


+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    LouLaiZueStoryBookScene *layer = [LouLaiZueStoryBookScene node];
    [scene addChild: layer];
    
    return scene;
}

- (id)init {
    
    if ((self = [super init])) {
        
    }
    return self;
}


@end
