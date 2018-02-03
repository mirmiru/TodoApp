//
//  Todo.m
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "Todo.h"

@implementation Todo

//Initiate new task - set name and priority
-(instancetype)initTask:(NSString*)todoTaskName priority:(BOOL)priority {
    self = [super init];
    if (self) {
        self.todoTaskName = todoTaskName;
        self.priorityMark = priority;
        self.finished = NO;
    }
    return self;
}

@end
