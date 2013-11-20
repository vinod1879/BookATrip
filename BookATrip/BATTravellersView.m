//
//  BATTravellersView.m
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import "BATTravellersView.h"

#define WIDTH 180
#define HEIGHT 100

@implementation BATTravellersView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithTitle:(NSString*)_title parent:(UIView*)parentView adults:(int)_adults children:(int)_children infants:(int)_infants
{
    
    CGRect frame = CGRectMake(0, 0, 0, 0);
    
    self = [super initWithFrame:frame];
    if (self) {
        
        title = _title;
        adults = _adults;
        children = _children;
        infants = _infants;
        
        [self initViewWithParent:parentView];
        
    }
    return self;
    
}

-(void)initViewWithParent:(UIView*)parent
{
    CGSize pSize = parent.frame.size;
    float x =(WIDTH-100)/2;
    float cWidth = WIDTH/3;
    float offset = 20;
    
    self.frame = CGRectMake((pSize.width-WIDTH)/2, 0, WIDTH, pSize.height);
    
    UILabel *titleLabel, *aLabel, *cLabel, *iLabel;
    UIImageView *aImage, *cImage, *iImage;
    
    titleLabel = [[UILabel alloc] init];
    aLabel = [[UILabel alloc] init];
    cLabel = [[UILabel alloc] init];
    iLabel = [[UILabel alloc] init];
    
    [titleLabel setText:title];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [aLabel setText:[NSString stringWithFormat:@"%d", adults]];
    [cLabel setText:[NSString stringWithFormat:@"%d", children]];
    [iLabel setText:[NSString stringWithFormat:@"%d", infants]];
    
    aImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"adult"]];
    cImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"child"]];
    iImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"infant"]];
    
    [aImage setContentMode:UIViewContentModeScaleAspectFit];
    [cImage setContentMode:UIViewContentModeScaleAspectFit];
    [iImage setContentMode:UIViewContentModeScaleAspectFit];
    
    titleLabel.frame = CGRectMake(x, 0, 100, 30);
    x=0;
    aImage.frame = CGRectMake(offset, 0.3*HEIGHT, 0.3*cWidth, 0.6*HEIGHT);
    cImage.frame = CGRectMake(offset + cWidth, 0.3*HEIGHT, 0.3*cWidth, 0.6*HEIGHT);
    iImage.frame = CGRectMake(offset + cWidth*2, 0.3*HEIGHT, 0.3*cWidth, 0.6*HEIGHT);
    
    offset +=10;
    
    aLabel.frame = CGRectMake(offset + 0.3*cWidth, 0.4*HEIGHT, 0.7*cWidth - offset, 0.4*HEIGHT);
    cLabel.frame = CGRectMake(offset + cWidth + 0.3*cWidth, 0.4*HEIGHT, 0.7*cWidth - offset, 0.4*HEIGHT);
    iLabel.frame = CGRectMake(offset + cWidth*2 + 0.3*cWidth, 0.4*HEIGHT, 0.7*cWidth - offset, 0.4*HEIGHT);
    
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
    [aLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
    [cLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
    [iLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
    
    [self addSubview:titleLabel];
    [self addSubview:aImage];
    [self addSubview:aLabel];
    [self addSubview:cImage];
    [self addSubview:cLabel];
    [self addSubview:iImage];
    [self addSubview:iLabel];
    
    [parent addSubview:self];
}

@end
