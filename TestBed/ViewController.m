//
//  ViewController.m
//  TestBed
//
//  Created by Struzinski,Mark on 1/21/14.
//
//

#import "ViewController.h"
#import "NamedView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NamedView *testView0 = [[NamedView alloc] initWithFrame:self.view.frame];
    testView0.viewName = @"testView0";
    
    NamedView *testView1 = [[NamedView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 20.0f, 20.0f)];
    testView1.viewName = @"testView1";
    
    NamedView *testView2 = [[NamedView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 15.0f, 15.0f)];
    testView2.viewName = @"testView2";
    
    NamedView *testView3 = [[NamedView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 10.0f, 10.0f)];
    testView3.viewName = @"testView3";
    
    NamedView *testView4 = [[NamedView alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 20.0f, 20.0f)];
    testView4.viewName = @"testView4";
    
    NamedView *testView5 = [[NamedView alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 10.0f, 10.0f)];
    testView5.viewName = @"testView5";
    
    NamedView *testView6 = [[NamedView alloc] initWithFrame:CGRectMake(70.0f, 70.0f, 20.0f, 20.0f)];
    testView6.viewName = @"testView6";
    
    self.view = testView0;
    
    [testView1 addSubview:testView2];
    [testView2 addSubview:testView3];
    
    [testView4 addSubview:testView5];
    
    [self.view addSubview:testView1];
    [self.view addSubview:testView4];
    [self.view addSubview:testView6];
    
    [self listViews];
    [self printPrimesUpToValue:100];
}

- (void)listViews {
    NSLog(@"====== Logging View Hierarchy ======");
    [self logViewHierarchyWithCurrentView:(NamedView *)self.view
                                    level:0];
    NSLog(@"====== End Logging View Hierarchy ====== \n\n");
}

- (void)logViewHierarchyWithCurrentView:(NamedView *)currentView level:(NSInteger)level {
    NSString *indentLevel = @"";
    for (int x = 0; x <= level; x++) {
        indentLevel = [indentLevel stringByAppendingString:@"    "];
    }
    
    NSLog(@"%@- %@",indentLevel,currentView.viewName);
    
    for (NamedView *subview in currentView.subviews) {
        [self logViewHierarchyWithCurrentView:subview
                                        level:level + 1];
    }
}

-(void)printPrimesUpToValue:(NSInteger)maxValue {
    NSLog(@"====== Primes Calculation ======");
    
    for (NSInteger currentNumber = 0; currentNumber <= maxValue; currentNumber++) {
        BOOL isPrime = YES;
        for (int x = 2; x < currentNumber - 1; x++) {
            if (currentNumber % x == 0) {
                isPrime = NO;
                break;
            }
        }
        
        if (isPrime) {
            NSLog(@"%i is a prime number", currentNumber);
        }
    }
    
    NSLog(@"====== End Primes Calculation ======");
}



@end
