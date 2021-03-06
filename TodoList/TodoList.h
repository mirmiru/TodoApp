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

//Methods
- (instancetype) initTodoList;
- (void) save;
- (NSMutableArray*) loadUnfinishedDictionaries;
- (NSMutableArray*) loadFinishedDictionaries;
- (void) finishTask:(Todo*)todoTask index:(int)indexNumber;
@end
