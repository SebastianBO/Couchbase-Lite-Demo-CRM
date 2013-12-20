//
//  Opportunity.m
//  CBLiteCRM
//
//  Created by Danil on 26/11/13.
//  Copyright (c) 2013 Danil. All rights reserved.
//

#import "Opportunity.h"
#import "ContactOpportunityStore.h"
#import "ContactOpportunity.h"
#import "DataStore.h"

@implementation Opportunity
@dynamic customer, creationDate, revenueSize, winProbability, salesStage, contacts, title;


+ (NSString*) docType{
    return kOpportDocType;
}


- (instancetype) initInDatabase: (CBLDatabase*)database
                      withTitle: (NSString*)title{
    NSParameterAssert(title);
    self = [super initInDatabase:database];
    if(self){
        [self setValue: title ofProperty: @"title"];
    }
    
    NSError* error;
    if (![self save: &error])
        return nil;
    return self;

}

- (BOOL)deleteDocument: (NSError**)outError
{
    ContactOpportunityStore *ctOppStore = [DataStore sharedInstance].contactOpportunityStore;
    CBLQuery *q = [ctOppStore queryContactsForOpportunity:self];
    NSError *error;
    for (CBLQueryRow *r in [q rows:&error]) {
        ContactOpportunity *ctOpp = [ContactOpportunity modelForDocument:r.document];
        [ctOpp deleteDocument:&error];
    }
    return [super deleteDocument:outError];
}

@end
