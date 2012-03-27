//
//  TimeLineViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TimeLineViewController.h"

@interface TimeLineViewController ()

@end

@implementation TimeLineViewController
@synthesize timeScroller = _timeScroller;
@synthesize tableView = _tableView;
-(id)init{
    if(self=[super init]){
        _timeScroller = [[TimeScroller alloc] initWithDelegate:self];
        
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 306.0f, 389.0f) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return self;
}



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 306.0f, 389.0f)];
    [view addSubview:_tableView];    
    self.view = view;
    [view release];
    
}

- (void)viewDidUnload
{
    [_tableView release];
    [_timeScroller release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)  
    {  
        // Create a cell to display an ingredient.  
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];  
    }  
    
    // Configure the cell.  
    cell.textLabel.text=@"签名";  
    cell.detailTextLabel.text = @"test";
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"title-%d",section+1];
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:50];
    for(int i=0;i<50;i++){
        [array addObject:[NSString stringWithFormat:@"%d",i+1 ]]; 
    }
    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [title integerValue];
}

#pragma mark - TimeScrollerDelegate 

- (UITableView *)tableViewForTimeScroller:(TimeScroller *)timeScroller{
    return _tableView;
}
- (NSDate *)dateForCell:(UITableViewCell *)cell{
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    NSInteger row = indexPath.row;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *today = [NSDate date];
    NSDateComponents *todayComponents = [calendar components:NSDayCalendarUnit fromDate:today];
    return [calendar  dateByAddingComponents:todayComponents toDate:today options:row];
}

#pragma mark UIScrollViewDelegateMethods


//The TimeScroller needs to know what's happening with the UITableView (UIScrollView)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"Timeline View scrollViewDidScroll");
    [_timeScroller scrollViewDidScroll];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [_timeScroller scrollViewDidEndDecelerating];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [_timeScroller scrollViewWillBeginDragging];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (!decelerate) {
        
        [_timeScroller scrollViewDidEndDecelerating];
        
    }
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}



@end
