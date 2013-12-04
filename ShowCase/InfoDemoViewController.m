//
//  InfoDemoViewController.m
//  AppBuilder
//
//  Created by Roy Ng on 17/10/13.
//  Copyright (c) 2013 RoynalNext. All rights reserved.
//

#import "InfoDemoViewController.h"
#import "InfoGroup.h"

@implementation InfoDemoViewController{
    
    InfoGroup* infoGroup;
    InfoSection* infoSection1;
    InfoSection* infoSection2;
    
    InfoInputText* infoInput1;
    InfoTextH* infoText1;
    InfoTextV* infoText2;
    InfoInputNext* infoNext1;
}

@synthesize table;

- (void)viewDidLoad
{
    [super viewDidLoad];
	infoGroup = [InfoGroup createWithTable:table];
    infoSection1 = [InfoSection createToGroup:infoGroup header:@"Info Header 1" footer:@"Info Footer 1"];
    infoSection2 = [InfoSection createToGroup:infoGroup header:@"Info Header 2" footer:@"Info Footer 2"];
    
    
    infoInput1 = [InfoInputText createToSection:infoSection1 WithKey:@"Input 1" WithValue:@"" WithType:InfoInputTextTypeName];
    infoText1 = [InfoTextH createToSection:infoSection1 WithKey:@"Text 1" WithValue:@"Value 1"];
    infoText2 = [InfoTextV createToSection:infoSection1 WithKey:@"Text 2" WithValue:@"Value 2"];
    infoNext1 = [InfoInputNext createToSection:infoSection1 WithKey:@"Next 1" WithValue:@"Value" WithTag:@""];
    [InfoTextH createToSection:infoSection1 WithKey:@"Static Text" WithValue:@"Static Value"];
    [InfoTextH createToSection:infoSection1 WithKey:@"Static Text" WithValue:@"Static Value"];
    
    [InfoTextH createToSection:infoSection2 WithKey:@"Static Text" WithValue:@"Static Value"];
    [InfoTextV createToSection:infoSection2 WithKey:@"Static Text" WithValue:@"Static Value"];
    [InfoTextH createToSection:infoSection2 WithKey:@"Static Text" WithValue:@"Static Value"];
    
    [table reloadData];
}

@end
