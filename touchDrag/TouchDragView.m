//
//  TouchDragView.m
//  touchDrag
//
//  Created by Mac on 15/11/7.
//  Copyright (c) 2015年 Moobye. All rights reserved.
//

#import "TouchDragView.h"

@implementation TouchDragView

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    self.beginpoint = [touch locationInView:self];
    [super touchesBegan:touches withEvent:event];
    [super bringSubviewToFront:self];
    
    
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGPoint point = [[touches anyObject] locationInView:self];
    float dx = point.x - self.beginpoint.x;
    CGPoint newcenter = CGPointMake(self.center.x + dx, self.center.y);
    
    if(self.beginpoint.x<10)
    {
        if(dx>0)
        {
            newcenter.x=MIN(self.bounds.size.width*5/4,newcenter.x);
            self.center=newcenter;
        }
        else
        {
            newcenter.x=MAX(self.superview.bounds.size.width/2,newcenter.x);
            self.center=newcenter;
        }
        
        [UIView animateWithDuration:0.005 animations:^
         {
             self.transform = CGAffineTransformMakeScale(1-(newcenter.x-160)/1920, 1-(newcenter.x-160)/960);
         }completion:^(BOOL finish)
         {
             
         }];
    }
    NSLog(@"begin size is %f",self.beginpoint.x);
    
}



// zhege shi chumo jieshu ,huamian zidong tan dao youbian
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.center.x>self.superview.bounds.size.width)
    {
        
        [UIView animateWithDuration:0.2 animations:^
         {
             self.center=CGPointMake(self.bounds.size.width*5/4, self.center.y);
             self.transform = CGAffineTransformMakeScale(0.875, 0.75);
         }completion:^(BOOL finish)
         {
             
         }];
        
    }
    else
    {
        
        [UIView animateWithDuration:0.2 animations:^
         {
             self.center=CGPointMake(self.bounds.size.width/2,self.center.y);
             self.transform = CGAffineTransformMakeScale(1, 1);
         }completion:^(BOOL finish)
         {
             
         }];
    }
    
}

@end
