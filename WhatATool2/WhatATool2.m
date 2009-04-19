#import <Foundation/Foundation.h>

void PrintPathInfo() { 
    // Section 1: Strings as file system paths
    
    NSString *path = @"~";
    
    path = [path stringByExpandingTildeInPath];
    
    NSLog(@"My home folder is at '%@'", path);
    
    NSArray *pathComponents = [path pathComponents];
    
    for (NSString *pathElement in pathComponents) {
        
        NSLog(pathElement);
        
    }
}

void PrintProcessInfo() {
    // Section 2: Finding out a bit about our own process
    
    NSInteger processID = [[NSProcessInfo processInfo] processIdentifier];
    
    NSString *processName = [[NSProcessInfo processInfo] processName];
    
    NSLog(@"Process Name: '%@' Process ID: '%i'", processName, processID);
}

void PrintBookmarkInfo() {
    // Section 3: A little bookmark dictionary
    
    NSMutableDictionary *bookmarks = [NSMutableDictionary dictionary];
    
    [bookmarks setObject:[NSURL URLWithString:@"http://www.stadford.edu"] forKey:@"Stanford University"];
    [bookmarks setObject:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"Apple"];
    [bookmarks setObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
    [bookmarks setObject:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
    [bookmarks setObject:[NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"];
    
    NSString *key;
    
    for (key in bookmarks) {
        
        if ([key hasPrefix:@"Stanford"]) {
            NSLog(@"Key: '%@', URL: '%@'", key, [bookmarks valueForKey:key]);
        }
    }    
}

void PrintIntrospectionInfo() {
    // Section 4: Selectors, Classes and Introspection
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:[[NSProcessInfo processInfo] processName]];
    [array addObject:[NSString stringWithString:@"Hello World"]];
    [array addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"one", @"two", @"three", @"four", nil]];
    
    for (NSString *element in array) {
        NSLog(@"Class name:  %@", [element className]);
        NSString *isString;
        if ([element isMemberOfClass:[NSString class]]) {
            isString = @"YES";
        } else {
            isString = @"NO";
        }
        NSString *isClass;
        NSLog(@"Is Member of NSString: %@", isString);
        if ([element isKindOfClass:[NSString class]]) {
            isClass = @"YES";
        } else {
            isClass = @"NO";
        }
        NSLog(@"Is Kind of NSString: %@", isClass);
        NSString *respondsToLowercase;
        
        if ([element respondsToSelector:@selector(lowercaseString)]) {
            respondsToLowercase = @"YES";
            NSLog(@"Responds to lowercaseString: %@", respondsToLowercase);
            NSLog(@"lowercaseString is: %@", [element lowercaseString]);
        } else {
            NSLog(@"Responds to lowercaseString: NO");
        }
        NSLog(@"=========================================");
        
    }    
}


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    PrintPathInfo();           // Section 1 
    PrintProcessInfo();        // Section 2 
    PrintBookmarkInfo();       // Section 3 
    PrintIntrospectionInfo();  // Section 4 
//    PrintPolygonInfo();        // Section 6 (No function for section 5)     
    
    [pool drain];
    return 0;
}
