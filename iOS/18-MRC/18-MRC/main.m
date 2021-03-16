//
//  main.m
//  18-MRC
//
//  Created by luokan on 2021/3/14.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *str1 =[NSString stringWithFormat:@"sadsadsadasd 2342134%d",123];
        
        NSString *str2 = [str1 copy];
        
        NSLog(@" %ld   %ld  \n",str1.retainCount,str2.retainCount);
        
        [str1 release];
        
        
        NSLog(@" %ld   %ld  \n",str1.retainCount,str2.retainCount);
        
        
    }
    return 0;
}
