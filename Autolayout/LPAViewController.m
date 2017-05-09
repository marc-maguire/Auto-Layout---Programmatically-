//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
#pragma mark - UIView Setup
    
    UIView *purpleRect = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    purpleRect.translatesAutoresizingMaskIntoConstraints = NO;
    purpleRect.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleRect];
    
    NSLayoutConstraint *purpleRectRightMarginConstraint = [NSLayoutConstraint constraintWithItem:purpleRect
                                                                                       attribute:NSLayoutAttributeRightMargin
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.framingView
                                                                                       attribute:NSLayoutAttributeRightMargin
                                                                                      multiplier:1.0
                                                                                        constant:-20.0];

    purpleRectRightMarginConstraint.active = YES;
    
    NSLayoutConstraint *purpleRectBottomMarginConstraint = [NSLayoutConstraint constraintWithItem:purpleRect
                                                                                        attribute:NSLayoutAttributeBottomMargin
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self.framingView
                                                                                        attribute:NSLayoutAttributeBottomMargin
                                                                                       multiplier:1.0
                                                                                         constant:-20.0];
    
 
    purpleRectBottomMarginConstraint.active = YES;
    
    NSLayoutConstraint *purpleRectWidthConstraint = [NSLayoutConstraint constraintWithItem:purpleRect
                                                                                 attribute:NSLayoutAttributeWidth
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.framingView
                                                                                 attribute:NSLayoutAttributeWidth
                                                                                multiplier:(305.0/500.0)
                                                                                  constant:0];

    purpleRectWidthConstraint.active = YES;
    
    
    NSLayoutConstraint *purpleRectHeightConstraint = [NSLayoutConstraint constraintWithItem:purpleRect
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:50.0];

    purpleRectHeightConstraint.active = YES;
 
    return;
    UIView *blueSquare = [[UIView alloc]initWithFrame:CGRectZero];
    blueSquare.translatesAutoresizingMaskIntoConstraints = NO;
    blueSquare.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueSquare];
    
    NSLayoutConstraint *blueSquareRightMarginConstraint = [NSLayoutConstraint constraintWithItem:blueSquare
                                                                                       attribute:NSLayoutAttributeRightMargin
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.framingView
                                                                                       attribute:NSLayoutAttributeRightMargin
                                                                                      multiplier:1.0
                                                                                        constant:-20.0];
    
    blueSquareRightMarginConstraint.active = YES;
    
    NSLayoutConstraint *blueSquareBottomMarginConstraint = [NSLayoutConstraint constraintWithItem:blueSquare
                                                                                        attribute:NSLayoutAttributeBottomMargin
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self.framingView
                                                                                        attribute:NSLayoutAttributeBottomMargin
                                                                                       multiplier:1.0
                                                                                         constant:-20.0];
    
    
    blueSquareBottomMarginConstraint.active = YES;
    
    NSLayoutConstraint *blueSquareWidthConstraint = [NSLayoutConstraint constraintWithItem:blueSquare
                                                                                 attribute:NSLayoutAttributeWidth
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.framingView
                                                                                 attribute:NSLayoutAttributeWidth
                                                                                multiplier:(305.0/500.0)
                                                                                  constant:0];
    
    blueSquareWidthConstraint.active = YES;
    
    
    NSLayoutConstraint *blueSquareHeightConstraint = [NSLayoutConstraint constraintWithItem:blueSquare
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:50.0];
    
    blueSquareHeightConstraint.active = YES;
    
    UIView *orangeRect = [[UIView alloc]initWithFrame:CGRectZero];
    orangeRect.translatesAutoresizingMaskIntoConstraints = NO;
    orangeRect.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeRect];
    
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
