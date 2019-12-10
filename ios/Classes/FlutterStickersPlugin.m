#import "FlutterStickersPlugin.h"
#import <flutter_stickers/flutter_stickers-Swift.h>

@implementation FlutterStickersPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterStickersPlugin registerWithRegistrar:registrar];
}
@end
