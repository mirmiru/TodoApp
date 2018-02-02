//
//  TodoList.m
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "TodoList.h"
#import "Todo.h"

@implementation TodoList

-(instancetype)initTodoList {
    self = [super init];
    if (self) {
        self.sections = @[@"Unfinished", @"Finished"];
        self.finishedTasksArray = [[NSMutableArray alloc] init];
        self.unfinishedTasksArray = [[NSMutableArray alloc] init];
        self.savedTasks = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

//Add new task
-(void) addNewTask:(Todo*)todoTask {
    [self.unfinishedTasksArray addObject:todoTask];
    int testCount = (int)[self.unfinishedTasksArray count];
    NSLog(@"%d", testCount);
    [self updateNSUserDefaults];
}

//Set task as finished
-(void) finishTask:(Todo*)todoTask index:(int)indexNumber{
    //Add to finished task array
    [self.finishedTasksArray addObject:todoTask];
    
    //Remove from todo task array
    [self.unfinishedTasksArray removeObject:todoTask];
}

-(void)updateNSUserDefaults {
    NSLog(@"Updating NSUserDefaults");
    
    
    
    [self.savedTasks setObject:self.unfinishedTasksArray forKey:@"UnfinishedTasks"];
    [self.savedTasks synchronize];
}

@end
