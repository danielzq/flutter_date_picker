#import "CustomDatePickerPlugin.h"
#if __has_include(<custom_date_picker/custom_date_picker-Swift.h>)
#import <custom_date_picker/custom_date_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "custom_date_picker-Swift.h"
#endif

@implementation CustomDatePickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCustomDatePickerPlugin registerWithRegistrar:registrar];
}
@end
