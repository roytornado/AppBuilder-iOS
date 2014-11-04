#import "InfoDemoViewController.h"
#import "AppBuilder.h"

@interface InfoDemoViewController ()

@property (weak, nonatomic) IBOutlet InfoVerticalScrollView *infoVerticalScrollView;

@end

@implementation InfoDemoViewController {
    InfoInputText *infoInput1;
    InfoInputText *infoInput2;
    InfoInputText *infoInput3;
    InfoInputLongText *infoInput4;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[InfoTextS alloc] initWithInfoVertical:self.infoVerticalScrollView key:@"Header"];
    [[InfoTextH alloc]initWithInfoVertical:self.infoVerticalScrollView key:@"Username" value:@"Roy Ng"];
    [[InfoTextH alloc]initWithInfoVertical:self.infoVerticalScrollView key:@"Email" value:@"roytornado@gmail.com"];
    [[InfoTextH alloc]initWithInfoVertical:self.infoVerticalScrollView key:@"Desc" value:@"[InfoTextH] This iOS lib is aimed to help user to build iOS apps quickly."];
    [[InfoTextV alloc]initWithInfoVertical:self.infoVerticalScrollView key:@"Desc" value:@"[InfoTextV] This iOS lib is aimed to help user to build iOS apps quickly."];

    infoInput1 = [[InfoInputText alloc] initWithInfoVertical:self.infoVerticalScrollView key:@"Message" value:@""];
    infoInput1.hint = @"InfoInputTextTypeDefault";
    infoInput2 = [[InfoInputText alloc] initWithInfoVertical:self.infoVerticalScrollView key:@"Phone Number" value:@""];
    infoInput2.hint = @"InfoInputTextTypeEmail";
    infoInput2.charSet = kInfoInputTextCharSetNumber;
    infoInput2.inputLimit = 8;
    infoInput3 = [[InfoInputText alloc] initWithInfoVertical:self.infoVerticalScrollView key:@"Amount" value:@""];
    infoInput3.hint = @"InfoInputTextTypePhone";
    infoInput3.charSet = kInfoInputTextCharSetAmount;
    infoInput3.inputLimit = 12;
    infoInput4 = [[InfoInputLongText alloc] initWithInfoVertical:self.infoVerticalScrollView key:@"Long Text" value:@"Long long long long long text"];
    infoInput4.hint = @"InfoInputTextTypeDefault";
}

@end