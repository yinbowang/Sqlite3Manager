//
//  ViewController.m
//  数据库demo
//
//  Created by wyb on 2017/3/21.
//  Copyright © 2017年 中天易观. All rights reserved.
//

#import "ViewController.h"
#import "Sqlite3Manager.h"

@interface ViewController ()

@property(nonatomic,strong)Sqlite3Manager *manager;

@property(nonatomic,assign)int index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 1;
    
}

- (IBAction)creatTable:(id)sender {

    self.manager = [[Sqlite3Manager alloc]initWithDatabaseNamed:@"student2333.sqlite"];
    NSString *sql = @"create table if not exists student(id integer,name text)";
    [self.manager createTableWithSql:sql];
    
}

- (IBAction)insert:(id)sender {
  
    
    
    NSString *sql = @"insert into student(id,name) values(?,?)";
    [self.manager execTableWithSql:sql params:@[@(self.index),[NSString stringWithFormat:@"--%ld",(long)self.index]]];
    
    self.index ++;
}

- (IBAction)update:(id)sender {
    
    NSString *sql = @"update student set name = ? where id = ?";
    [self.manager execTableWithSql:sql params:@[@"wang",@1]];
    
}

- (IBAction)delete:(id)sender {
    NSString *sql = @"delete from student where id = ?";
    [self.manager execTableWithSql:sql params:@[@1]];
    
}

- (IBAction)select:(id)sender {
    NSString *sql = @"select * from student";
    [self.manager selectTableWithSql:sql params:nil finshBlock:^(NSArray *array) {
       
        NSLog(@"%@",array);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
