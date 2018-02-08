//
//  TodoList.m
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "TodoList.h"
#import "Todo.h"

@implementation TodoList {
    NSMutableDictionary *dictionary;
}

-(instancetype)initTodoList {
    self = [super init];
    if (self) {
        if (self.finishedTasksArray && self.unfinishedTasksArray) {
            self.finishedTasksArray = [self loadFinishedDictionaries];
            self.unfinishedTasksArray = [self loadUnfinishedDictionaries];
        } else {
            self.finishedTasksArray = [[NSMutableArray alloc] init];
            self.unfinishedTasksArray = [[NSMutableArray alloc] init];
        }
        self.sections = @[@"Unfinished", @"Finished"];
    }
    return self;
}

//Set task as finished
-(void) finishTask:(Todo*)todoTask index:(int)indexNumber{
    //Add to finished task array
    [self.finishedTasksArray addObject:todoTask];
    
    //Remove from todo task array
    [self.unfinishedTasksArray removeObject:todoTask];
}

//Save data
- (void) save {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    
    //UNFINISHED
    NSMutableArray *unfinishedDictionaries = [[NSMutableArray alloc] init];
    for(Todo *todo in self.unfinishedTasksArray) {
        NSNumber *prio = [NSNumber numberWithInt:todo.priorityMark];
        NSDictionary *dictionary = @{@"Name": todo.todoTaskName,
                                     @"Priority": prio
                                     };
        [unfinishedDictionaries addObject:dictionary];
        
        NSLog(@"PRIORITY? %d", todo.priorityMark);
    }
    [savedData setObject:unfinishedDictionaries forKey:@"Unfinished"];
    [savedData synchronize];
    
    //FINISHED:
    NSMutableArray *finishedDictionaries = [[NSMutableArray alloc] init];
    for(Todo *todo in self.finishedTasksArray) {
        NSDictionary *dictionary = @{ @"Name": todo.todoTaskName};
        [finishedDictionaries addObject:dictionary];
    }
    [savedData setObject:finishedDictionaries forKey:@"Finished"];
    
    [savedData synchronize];
}

//Load saved data - Unfinished tasks
- (NSMutableArray*) loadUnfinishedDictionaries {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    
    self.unfinishedTasksArray = [[NSMutableArray alloc] init];

    for(NSDictionary *dictionary in [savedData objectForKey:@"Unfinished"]) {
        NSString *name = [dictionary valueForKey:@"Name"];
        BOOL priority = [[dictionary valueForKey:@"Priority"] boolValue];
        //BOOL priority = [NSNumber numberWithInt:(int)[dictionary valueForKey:@"Priority"]];
        Todo *todo = [[Todo alloc] initTask:name priority:priority];
        
        [self.unfinishedTasksArray addObject:todo];
    }
    return self.unfinishedTasksArray;
}

//Load saved data - Finished tasks
- (NSMutableArray*) loadFinishedDictionaries {
    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
    
    self.finishedTasksArray = [[NSMutableArray alloc] init];
    for(NSDictionary *dictionary in [savedData objectForKey:@"Finished"]) {
        NSString *name = [dictionary valueForKey:@"Name"];
        Todo *todo = [[Todo alloc] initTask:name priority:NO];
        
        [self.finishedTasksArray addObject:todo];
    }
    return self.finishedTasksArray;
}

@end
