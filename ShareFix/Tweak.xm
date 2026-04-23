#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static void inject() {
    static BOOL done = NO;
    if (done) return;

    Class cls = objc_getClass("YTIShareEntityEndpoint");
    if (!cls) return;

    SEL sel = @selector(shareEntityEndpoint);
    Class metaClass = object_getClass(cls);

    if (!class_respondsToSelector(metaClass, sel)) {
        id (^block)(id) = ^id(id _self) {
            return nil;
        };

        IMP imp = imp_implementationWithBlock(block);

        if (class_addMethod(metaClass, sel, imp, "@@:")) {
            NSLog(@"[ShareFix] Injected successfully");
        }
    }

    done = YES;
}

__attribute__((constructor))
static void init() {
    @autoreleasepool {

        // chạy ngay
        inject();

        // retry nhiều lần để đảm bảo không miss timing
        for (int i = 1; i <= 5; i++) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, i * 0.3 * NSEC_PER_SEC),
                           dispatch_get_main_queue(), ^{
                inject();
            });
        }
    }
}
