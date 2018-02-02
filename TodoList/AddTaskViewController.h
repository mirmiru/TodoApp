//
//  AddTaskViewController.h
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoList.h"

@interface AddTaskViewController : UIViewController
@property (nonatomic) TodoList *todoList;
@property (nonatomic) NSString *todoTaskName;

@end
