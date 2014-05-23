//
//  main.m
//  AddressBook
//
//  Created by   颜风 on 14-5-19.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "AddressBook.h"


int main(int argc, const char * argv[])
{
    
    @autoreleasepool
    {
        Person * person = [Person personWithName:@"周杰伦" tel:@"18238802518"];
        person.group = @"中国风";
        [person show];
        
        AddressBook * book = [AddressBook book];
        [book addGroup:@"中国风"];
        [book addPerson: person];
        person = [book personByTel:@"18238802518"];
        NSLog(@"%@", person);
        [book removeGroup:@"中国风"];
    }
    
    return 0;
}

