///
/// Auto-generated by Stone, do not modify.
///

#import "DbxPropertiesPropertyFieldTemplate.h"
#import "DbxStoneSerializers.h"
#import "DbxStoneValidators.h"
#import "DbxTeamUpdatePropertyTemplateArg.h"

@implementation DbxTeamUpdatePropertyTemplateArg 

- (instancetype)initWithTemplateId:(NSString *)templateId name:(NSString *)name description_:(NSString *)description_ addFields:(NSArray<DbxPropertiesPropertyFieldTemplate *> *)addFields {
    [DbxStoneValidators stringValidator:[NSNumber numberWithInt:1] maxLength:nil pattern:@"(/|ptid:).*"](templateId);
    [DbxStoneValidators nullableValidator:[DbxStoneValidators arrayValidator:nil maxItems:nil itemValidator:nil]](addFields);

    self = [super init];
    if (self != nil) {
        _templateId = templateId;
        _name = name;
        _description_ = description_;
        _addFields = addFields;
    }
    return self;
}

- (instancetype)initWithTemplateId:(NSString *)templateId {
    return [self initWithTemplateId:templateId name:nil description_:nil addFields:nil];
}

+ (NSDictionary *)serialize:(id)obj {
    return [DbxTeamUpdatePropertyTemplateArgSerializer serialize:obj];
}

+ (id)deserialize:(NSDictionary *)dict {
    return [DbxTeamUpdatePropertyTemplateArgSerializer deserialize:dict];
}

- (NSString *)description {
    return [[DbxTeamUpdatePropertyTemplateArgSerializer serialize:self] description];
}

@end


@implementation DbxTeamUpdatePropertyTemplateArgSerializer 

+ (NSDictionary *)serialize:(DbxTeamUpdatePropertyTemplateArg *)valueObj {
    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

    jsonDict[@"template_id"] = valueObj.templateId;
    if (valueObj.name) {
        jsonDict[@"name"] = valueObj.name;
    }
    if (valueObj.description_) {
        jsonDict[@"description"] = valueObj.description_;
    }
    if (valueObj.addFields) {
        jsonDict[@"add_fields"] = [DbxArraySerializer serialize:valueObj.addFields withBlock:^id(id elem) { return [DbxPropertiesPropertyFieldTemplateSerializer serialize:elem]; }];
    }

    return jsonDict;
}

+ (DbxTeamUpdatePropertyTemplateArg *)deserialize:(NSDictionary *)valueDict {
    NSString *templateId = valueDict[@"template_id"];
    NSString *name = valueDict[@"name"] ? valueDict[@"name"] : nil;
    NSString *description_ = valueDict[@"description"] ? valueDict[@"description"] : nil;
    NSArray<DbxPropertiesPropertyFieldTemplate *> *addFields = valueDict[@"add_fields"] ? [DbxArraySerializer deserialize:valueDict[@"add_fields"] withBlock:^id(id elem) { return [DbxPropertiesPropertyFieldTemplateSerializer deserialize:elem]; }] : nil;

    return [[DbxTeamUpdatePropertyTemplateArg alloc] initWithTemplateId:templateId name:name description_:description_ addFields:addFields];
}

@end