//
//  JNDGestureRecognizer.m
//  FilialStories
//
//  Created by Jerry on 13/3/17.
//  Copyright (c) 2013年 JerryNDanny. All rights reserved.
//

#import "JNDGestureRecognizer.h"

@implementation JNDGestureRecognizer

+ (BOOL) isSwipeUp:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.y < prePnt.y) return FALSE;
        if (crtPnt.x < prePnt.x - 50 || crtPnt.x > prePnt.x + 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}

+ (BOOL) isSwipeDown:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.y > prePnt.y) return FALSE;
        if (crtPnt.x < prePnt.x - 50 || crtPnt.x > prePnt.x + 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}

+ (BOOL) isSwipeLeft:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.x > prePnt.x) return FALSE;
        if (crtPnt.y < prePnt.y - 50 || crtPnt.y > prePnt.y + 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}

+ (BOOL) isSwipeRight:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.x < prePnt.x) return FALSE;
        if (crtPnt.y < prePnt.y - 50 || crtPnt.y > prePnt.y + 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}

+ (BOOL) isSwipeRightUp:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.x < prePnt.x + 50) return FALSE;
        if (crtPnt.y < prePnt.y + 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}

+ (BOOL) isSwipeLeftUp:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.x > prePnt.x - 50) return FALSE;
        if (crtPnt.y < prePnt.y + 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}


+ (BOOL) isSwipeRightDown:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.x < prePnt.x + 50) return FALSE;
        if (crtPnt.y > prePnt.y - 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}

+ (BOOL) isSwipeLeftDown:(NSMutableArray*) tracedTouches {
    
    if ([tracedTouches count] == 0) return FALSE;
    
    CGPoint prePnt = [[tracedTouches objectAtIndex:0] CGPointValue];
    for(int i = 1; i < tracedTouches.count; i++){
        CGPoint crtPnt = [[tracedTouches objectAtIndex:i] CGPointValue];
        if (crtPnt.x > prePnt.x - 50) return FALSE;
        if (crtPnt.y > prePnt.y - 50) return FALSE;
        prePnt = crtPnt;
    }
    
    return TRUE;
}

@end
