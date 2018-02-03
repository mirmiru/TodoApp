//
//  AddTaskViewController.m
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "AddTaskViewController.h"
#import "TodoList.h"
#import "Todo.h"

@interface AddTaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UISwitch *prioritySwitch;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

//Add a new task and set its priority
- (IBAction)addTask:(id)sender {
    NSString *name = self.taskName.text;
    
    BOOL priority;
    if ([self.prioritySwitch isOn]) {
        NSLog(@"Priority: YES.");
        priority = YES;
    } else {
        NSLog(@"Priority: NO.");
        priority = NO;
    }
    
    //Add to todo array
    Todo *todo = [[Todo alloc] initTask:name priority:priority];
    
    [self.todoList.unfinishedTasksArray addObject:todo];
    [self.todoList save];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
