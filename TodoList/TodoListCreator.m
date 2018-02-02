//
//  TodoListCreator.m
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "TodoListCreator.h"
#import "Todo.h"
#import "TodoList.h"

//This class communicates with the Todo and TodoList classes to move todo tasks between lists and communicating with the tableviewcontroller.
@implementation TodoListCreator

-(void) addNewTask:(Todo*)todoTask toList:(TodoList*)todoList {
    [todoList addObject:todoTask];
}

@end
