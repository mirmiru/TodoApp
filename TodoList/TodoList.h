//
//  TodoList.h
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Todo;

@interface TodoList : NSObject

//Variables
@property NSMutableArray *unfinishedTasksArray;
@property NSMutableArray *finishedTasksArray;
@property NSArray *sections;
@property NSUserDefaults *savedTasks;


//Methods
- (instancetype) initTodoList;
- (void) addNewTask:(Todo*)todoTask;
- (void) finishTask:(Todo*)todoTask index:(int)indexNumber;
@end
