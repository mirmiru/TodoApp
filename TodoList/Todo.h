//
//  Todo.h
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

//Variables
@property (nonatomic) NSString *todoTaskName;
@property (nonatomic) BOOL priorityMark;
@property (nonatomic) BOOL finished;

//Methods
-(instancetype)initTask:(NSString*)todoTaskName priority:(BOOL)priority;
@end
