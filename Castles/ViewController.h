//
//  ViewController.h
//  Castles
//
//  Created by Matthew Knott on 12/01/2014.
//  Copyright (c) 2014 Matthew Knott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)likeCastle:(id)sender;

@end
