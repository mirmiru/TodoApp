//
//  TodoListCreator.h
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoListCreator : NSObject

-(void) addNewTask:(Todo*)todoTask toList:(TodoList*)todoList;

@end
