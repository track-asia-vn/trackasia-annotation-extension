#import "MLNStyleAnnotation.h"

NSString *const MLNPropertyAnnotationIdentifier = @"annotation-identifier";
NSString *const MLNPropertyAnnotationTitle = @"annotation-title";
NSString *const MLNPropertyAnnotationSubtitle = @"annotation-subtitle";
NSString *const MLNPropertyAnnotationTooltip = @"annotation-tooltip";

@interface MLNStyleAnnotation()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

@implementation MLNStyleAnnotation

- (instancetype)init {
    if (self = [super init]) {
        self.attributes = [NSMutableDictionary dictionary];
        self.identifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (instancetype)initWithFeature:(id<MLNFeature>)feature {
    if (self = [self init]) {
        _feature = feature;
    }

    return self;
}

- (instancetype)initWithGeoJSON:(NSData *)data {
    if (self = [self init]) {

    }

    return self;
}

- (void)setIdentifier:(NSString * _Nonnull)identifier {
    self.attributes[MLNPropertyAnnotationIdentifier] = identifier;
}

- (NSString *)identifier {
    return self.attributes[MLNPropertyAnnotationIdentifier];
}

- (void)setTitle:(NSString *)title {
    if (title) {
        self.attributes[MLNPropertyAnnotationTitle] = title;
    }
}

- (NSString *)title {
    return self.attributes[MLNPropertyAnnotationTitle];
}

- (void)setSubtitle:(NSString *)subtitle {
    if (subtitle) {
        self.attributes[MLNPropertyAnnotationSubtitle] = subtitle;
    }
}

- (NSString *)subtitle {
    return self.attributes[MLNPropertyAnnotationSubtitle];
}

- (NSDictionary<NSString *, id> *)geoJSONDictionary {
    NSMutableDictionary *geoJSON = [NSMutableDictionary dictionaryWithDictionary:self.feature.geoJSONDictionary];
    [geoJSON setObject:self.attributes forKey:@"properties"];
    return geoJSON;
}

@end
