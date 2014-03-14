#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "InfoSection.h"
#import "InfoBase.h"
#import "InfoTextH.h"
#import "InfoTextV.h"
#import "InfoImage.h"
#import "InfoButton.h"
#import "InfoInputNext.h"
#import "InfoInputText.h"

@protocol InfoGroupDelegate

- (UIView *)sectionHeaderView:(InfoSection *)section;
- (void)onClick:(NSString *)tag;

@end

@interface InfoGroup : NSObject <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *sections;
@property UITableView *table;
@property id delegate;


+ (InfoGroup *)createWithTable:(UITableView *)table;

- (void)handleExtraFields:(NSMutableArray *)list;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;

@end
