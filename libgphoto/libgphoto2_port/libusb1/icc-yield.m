// On OSX ImageCaptureCore framework (ICC) claims devices we are interested in.
// This tool asks ICC to release the device identified by the usb locationID
// and waits until the request is acknowledged.
#import <Foundation/Foundation.h>
#import <ImageCaptureCore/ImageCaptureCore.h>

long locationID = 0;
BOOL didRequestYield = NO;

@interface MyDelegate : NSObject <ICDeviceBrowserDelegate>
@end

@implementation MyDelegate

-(void)deviceBrowser:(ICDeviceBrowser *)browser didAddDevice:(ICDevice *)device moreComing:(BOOL)moreComing
{
    if ([[device transportType] isEqual:ICTransportTypeUSB] && [device usbLocationID]==locationID) {
        [device requestYield];
        didRequestYield = YES;
        // We aren't done yet — releasing the device could take
        // nontrivial amounts of time.  When the device is released
        // we get didRemoveDevice notification.
    }
}

-(void)deviceBrowser:(ICDeviceBrowser *)browser didRemoveDevice:(ICDevice *)device moreGoing:(BOOL)moreGoing
{
    if ([[device transportType] isEqual:ICTransportTypeUSB] && [device usbLocationID]==locationID) {
        _exit(EXIT_SUCCESS);
    }
}

- (void)deviceBrowserDidEnumerateLocalDevices:(ICDeviceBrowser *)browser
{
    if (!didRequestYield)
        _exit(EXIT_FAILURE);
}

@end

int main(int argc, const char * argv[])
{
    if (argc != 2) {
        NSLog(@"bad arguments");
        return EXIT_FAILURE;
    }
    errno = 0;
    char *bad;
    locationID = strtol(argv[1], &bad, 10);
    if (*bad || errno) {
        NSLog(@"bad arguments");
        return EXIT_FAILURE;
    }
    @autoreleasepool {
        
        ICDeviceBrowser *browser = [[ICDeviceBrowser alloc] init];
        MyDelegate *delegate = [[MyDelegate alloc] init];
        
        [browser setDelegate:delegate];
        [browser setBrowsedDeviceTypeMask:-1];
        [browser start];
        [[NSRunLoop currentRunLoop] run];
    }
    assert(0);
    return EXIT_FAILURE;
}

