//
//  ViewController.m
//  Castles
//
//  Created by Matthew Knott on 12/01/2014.
//  Copyright (c) 2014 Matthew Knott. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat dimension;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 3,
                                         _scrollView.frame.size.height);
    dimension = _scrollView.bounds.size.width;
    
    [self createPages];
}

- (void) createPages
{
    for (NSInteger i = 0; i<3; i++)
    {
        NSInteger xPosition = 0;
        NSInteger yPosition = 0;
        
        xPosition = _scrollView.frame.size.width * i;
        
        UIImageView *castleView = [[UIImageView alloc]
                                   initWithFrame:CGRectMake(xPosition,
                                                            yPosition,
                                                            _scrollView.frame.size.width,
                                                            _scrollView.frame.size.height)];
        
        NSString *imageName = [NSString stringWithFormat:@"castle%i",(i+1)];
        UIImage *img = [UIImage imageNamed:imageName];
        [castleView setImage:img];
        
        [_scrollView addSubview:castleView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView
{
    // Fudge a little and take the floor to accommodate division issues
	_pageControl.currentPage = floor(_scrollView.contentOffset.x / dimension);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)likeCastle:(id)sender {
    
    UIAlertView *likeAlert =
        [[UIAlertView alloc] initWithTitle:@"Thanks!"
                                   message:[NSString stringWithFormat:@"You like castle number %i",(_pageControl.currentPage+1)]
                                  delegate:self
                         cancelButtonTitle:@"Okay"
                         otherButtonTitles:nil];
    
    [likeAlert show];
}
@end
