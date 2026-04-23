#import <Foundation/Foundation.h>
#import <objc/runtime.h>

%hookf(id, objc_getClass("YTIShareEntityEndpoint"), @selector(shareEntityEndpoint)) {
    return nil;
}

%hook YTIShareEntityEndpoint
+ (id)shareEntityEndpoint {
    return nil;
}
%end

%ctor {
    %init(YTIShareEntityEndpoint = objc_getClass("YTIShareEntityEndpoint"));
}
