//
//  LouLaiZueGameScene.m
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "LouLaiZueGameScene.h"

@implementation LouLaiZueGameScene

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    LouLaiZueGameScene *layer = [LouLaiZueGameScene node];
    [scene addChild: layer];
    
    return scene;
}

- (id)init {
    
    if ((self = [super init])) {
        
    }
    return self;
}

@end
