//
//  TodoTableViewController.m
//  TodoList
//
//  Created by Milja Virtanen on 2018-01-30.
//  Copyright © 2018 Milja Virtanen. All rights reserved.
//

#import "TodoTableViewController.h"
#import "Todo.h"
#import "TodoList.h"
#import "AddTaskViewController.h"

@interface TodoTableViewController ()
@property TodoList *todoList;
@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Todo List";
    self.todoList = [[TodoList alloc] initTodoList];
    
    //Kollar om det finns något sparat.
    /*
    NSArray *array = [self.todoList.savedTasks objectForKey:@"UnfinishedTasks"];
    if (array) {
        self.todoList.unfinishedTasksArray = array.mutableCopy;
    }
    */
}

//Reload tables
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.todoList.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return (int)[self.todoList.unfinishedTasksArray count];
    } else {
        return (int)[self.todoList.finishedTasksArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    NSString *priority;
    
    if(indexPath.section == 0) {
        cell.textLabel.text = [self.todoList.unfinishedTasksArray[indexPath.row] todoTaskName];
            if ([self.todoList.unfinishedTasksArray[indexPath.row] priorityMark]) {
                priority = @"PRIO";
                cell.backgroundColor = [UIColor colorWithRed:0.98 green:0.82 blue:0.52 alpha:1.0];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
            }
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.textLabel.text = [self.todoList.finishedTasksArray[indexPath.row] todoTaskName];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.detailTextLabel.text = priority;
    
    //Check if task marked as finished
    /*
    if ([self.todoList.unfinishedTasksArray[indexPath.row] finished]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
     */
    return cell;
}

//Set value to finished/unfinished.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Todo *todo = self.todoList.unfinishedTasksArray[indexPath.row];
    BOOL finished = todo.finished;
    todo.finished = !finished;

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (todo.finished) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.todoList finishTask:todo index:(int)indexPath.row];
        todo.priorityMark = NO;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        todo.finished = NO;
    }
    [self.tableView reloadData];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//Set section names
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.todoList.sections[section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"AddTask"]) {
        AddTaskViewController *addTask = [segue destinationViewController];
        addTask.todoList = self.todoList;
    }
}

@end
