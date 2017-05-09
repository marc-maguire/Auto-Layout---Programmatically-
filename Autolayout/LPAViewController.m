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
    
    UIView *purpleRect = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    purpleRect.translatesAutoresizingMaskIntoConstraints = NO;
    purpleRect.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleRect];

    UIView *blueSquare = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150.0, 50.0)];
    blueSquare.translatesAutoresizingMaskIntoConstraints = NO;
    blueSquare.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueSquare];
    
    UIView *orangeRect1 = [[UIView alloc]initWithFrame:CGRectZero];
    orangeRect1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeRect1.backgroundColor = [UIColor orangeColor];

    UIView *orangeRect2 = [[UIView alloc]initWithFrame:CGRectZero];
    orangeRect2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeRect2.backgroundColor = [UIColor orangeColor];

    UIView *redRect = [[UIView alloc]initWithFrame:CGRectZero];
    redRect.translatesAutoresizingMaskIntoConstraints = NO;
    redRect.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redRect];
    [redRect addSubview:orangeRect1];
    [redRect addSubview:orangeRect2];

    
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

    
#pragma mark - PurpleRectViewConstraints
    
    
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
 
#pragma mark - BlueSquareViewConstraints
    
    
    
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

#pragma mark - OrangeRectViewConstraints
    
   
    NSLayoutConstraint *orangeRect1TopMarginConstraint = [NSLayoutConstraint constraintWithItem:orangeRect1
                                                                                      attribute:NSLayoutAttributeTopMargin
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:redRect
                                                                                      attribute:NSLayoutAttributeTopMargin
                                                                                     multiplier:1.0
                                                                                       constant:5.0];
    orangeRect1TopMarginConstraint.active = YES;
    
    NSLayoutConstraint *orangeRect1RightMarginConstraint = [NSLayoutConstraint constraintWithItem:orangeRect1
                                                                                        attribute:NSLayoutAttributeRightMargin
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:redRect
                                                                                        attribute:NSLayoutAttributeRightMargin
                                                                                       multiplier:1.0
                                                                                         constant:-5.0];
    orangeRect1RightMarginConstraint.active = YES;
    
    NSLayoutConstraint *orangeRect1BottomLayoutConstraint = [NSLayoutConstraint constraintWithItem:orangeRect1
                                                                                         attribute:NSLayoutAttributeBottomMargin
                                                                                         relatedBy:NSLayoutRelationEqual
                                                                                            toItem:redRect
                                                                                         attribute:NSLayoutAttributeBottomMargin
                                                                                        multiplier:1.0
                                                                                          constant:-5.0];
    orangeRect1BottomLayoutConstraint.active = YES;
    
    NSLayoutConstraint *orangeRect1HeightConstraint = [NSLayoutConstraint constraintWithItem:orangeRect1
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:30.0];
    orangeRect1HeightConstraint.active = YES;
    
    NSLayoutConstraint *orangeRect1Widthconstraint = [NSLayoutConstraint constraintWithItem:orangeRect1
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:50.0];
    orangeRect1Widthconstraint.active = YES;
    
    
    
    NSLayoutConstraint *orangeRect2LeftMarginConstraint = [NSLayoutConstraint constraintWithItem:orangeRect2
                                                                                       attribute:NSLayoutAttributeLeftMargin
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:redRect
                                                                                       attribute:NSLayoutAttributeLeftMargin
                                                                                      multiplier:1.0
                                                                                        constant:5.0];
    orangeRect2LeftMarginConstraint.active = YES;
    
    NSLayoutConstraint *orangeRect2VerticalCenteringConstraint = [NSLayoutConstraint constraintWithItem:orangeRect2
                                                                                              attribute:NSLayoutAttributeCenterY
                                                                                              relatedBy:NSLayoutRelationEqual
                                                                                                 toItem:orangeRect1
                                                                                              attribute:NSLayoutAttributeCenterY
                                                                                             multiplier:1.0
                                                                                               constant:0.0];
    orangeRect2VerticalCenteringConstraint.active = YES;
    
    NSLayoutConstraint *orangeRect2HeightConstraint = [NSLayoutConstraint constraintWithItem:orangeRect2
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:30.0];
    orangeRect2HeightConstraint.active = YES;
    
    NSLayoutConstraint *orangeRect2Widthconstraint = [NSLayoutConstraint constraintWithItem:orangeRect2
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:70.0];
    orangeRect2Widthconstraint.active = YES;
    

    
    
    
    #pragma mark - RedRectViewConstraints
    
    
    NSLayoutConstraint *redRectTopMarginConstraint = [NSLayoutConstraint constraintWithItem:redRect
                                                                                  attribute:NSLayoutAttributeTopMargin
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.framingView
                                                                                  attribute:NSLayoutAttributeTopMargin
                                                                                 multiplier:1.0
                                                                                   constant:20.0];
    redRectTopMarginConstraint.active = YES;
    
    
    NSLayoutConstraint *redRectRightMarginConstraint = [NSLayoutConstraint constraintWithItem:redRect
                                                                                    attribute:NSLayoutAttributeRightMargin
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.framingView
                                                                                    attribute:NSLayoutAttributeRightMargin
                                                                                   multiplier:1.0
                                                                                     constant:-20.0];
    redRectRightMarginConstraint.active = YES;
    
    
    
    
    NSLayoutConstraint *redRectWidthConstraint = [NSLayoutConstraint constraintWithItem:redRect
                                                                              attribute:NSLayoutAttributeWidth
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:(5.0*3.0) + 70.0 + 50.0];
    redRectWidthConstraint.active = YES;
    
   NSLayoutConstraint *redRectHeightConstraint = [NSLayoutConstraint constraintWithItem:redRect
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:(5.0*2.0) + 30.0];
    redRectHeightConstraint.active = YES;

    
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
