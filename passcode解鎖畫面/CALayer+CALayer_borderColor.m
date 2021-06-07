//
//  CALayer+CALayer_borderColor.m
//  Color調色大師
//
//  Created by Rose on 2021/5/3.
//

#import "CALayer+CALayer_borderColor.h"
#import <UIKit/UIKit.h>
@implementation CALayer (CALayer_borderColor)
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
