/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <WCDB/WCTChainCall+Private.h>
#import <WCDB/WCTDelete.h>
#import <WCDB/WCTInsert.h>
#import <WCDB/WCTMultiSelect.h>
#import <WCDB/WCTORM.h>
#import <WCDB/WCTRowSelect.h>
#import <WCDB/WCTSelect.h>
#import <WCDB/WCTSelectable+Private.h>
#import <WCDB/WCTTable+ChainCall.h>
#import <WCDB/WCTTable+Convenient.h>
#import <WCDB/WCTTable+Private.h>
#import <WCDB/WCTUpdate.h>

@implementation WCTTable (Convenient)

#pragma mark - Get Object
- (WCTObject *)getObject
{
    return [[[[self prepareSelect] limit:1] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectWhere:(const WCDB::Expression &)condition
{
    return [[[[[self prepareSelect] where:condition] limit:1] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOrderBy:(const WCDB::OrderingTerms &)orders
{
    return [[[[[self prepareSelect] order:orders] limit:1] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOffset:(const WCDB::Expression &)offset
{
    return [[[[[self prepareSelect] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectWhere:(const WCDB::Expression &)condition
                        order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[self prepareSelect] where:condition] limit:1] order:orders] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectWhere:(const WCDB::Expression &)condition
                       offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareSelect] where:condition] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOrderBy:(const WCDB::OrderingTerms &)orders
                         offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareSelect] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectWhere:(const WCDB::Expression &)condition
                        order:(const WCDB::OrderingTerms &)orders
                       offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareSelect] where:condition] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

#pragma mark - Get Objects
- (NSArray /* <WCTObject*> */ *)getObjects
{
    return [[[self prepareSelect] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsWhere:(const WCDB::Expression &)condition
{
    return [[[[self prepareSelect] where:condition] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOrderBy:(const WCDB::OrderingTerms &)orders
{
    return [[[[self prepareSelect] order:orders] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsLimit:(const WCDB::Expression &)limit
{
    return [[[[self prepareSelect] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOffset:(const WCDB::Expression &)offset
{
    return [[[[self prepareSelect] offset:offset] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsWhere:(const WCDB::Expression &)condition
                                          order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[self prepareSelect] where:condition] order:orders] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsWhere:(const WCDB::Expression &)condition
                                          limit:(const WCDB::Expression &)limit
{
    return [[[[[self prepareSelect] where:condition] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOrderBy:(const WCDB::OrderingTerms &)orders
                                            limit:(const WCDB::Expression &)limit
{
    return [[[[[self prepareSelect] order:orders] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsLimit:(const WCDB::Expression &)offset
                                         offset:(const WCDB::Expression &)limit
{
    return [[[[[self prepareSelect] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsWhere:(const WCDB::Expression &)condition
                                          order:(const WCDB::OrderingTerms &)orders
                                          limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareSelect] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsWhere:(const WCDB::Expression &)condition
                                          limit:(const WCDB::Expression &)limit
                                         offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareSelect] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOrderBy:(const WCDB::OrderingTerms &)orders
                                            limit:(const WCDB::Expression &)limit
                                           offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareSelect] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsWhere:(const WCDB::Expression &)condition
                                          order:(const WCDB::OrderingTerms &)orders
                                          limit:(const WCDB::Expression &)limit
                                         offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareSelect] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

#pragma mark - Get Part Of Object
- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
{
    return [[[[[self prepareSelect] onResultColumns:resultColumns] limit:1] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
                                  where:(const WCDB::Expression &)condition
{
    return [[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] limit:1] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
                                  order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[self prepareSelect] onResultColumns:resultColumns] order:orders] limit:1] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
                                 offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareSelect] onResultColumns:resultColumns] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
                                  where:(const WCDB::Expression &)condition
                                  order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:1] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
                                  where:(const WCDB::Expression &)condition
                                 offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
                                  order:(const WCDB::OrderingTerms &)orders
                                 offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareSelect] onResultColumns:resultColumns] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

- (WCTObject *)getObjectOnResultColumns:(const WCTResultColumns &)resultColumns
                                  where:(const WCDB::Expression &)condition
                                  order:(const WCDB::OrderingTerms &)orders
                                 offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextObject];
}

#pragma mark - Get Part Of Objects
- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
{
    return [[[[self prepareSelect] onResultColumns:resultColumns] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    where:(const WCDB::Expression &)condition
{
    return [[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[self prepareSelect] onResultColumns:resultColumns] order:orders] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    limit:(const WCDB::Expression &)limit
{
    return [[[[[self prepareSelect] onResultColumns:resultColumns] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    where:(const WCDB::Expression &)condition
                                                    order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] order:orders] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    where:(const WCDB::Expression &)condition
                                                    limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    order:(const WCDB::OrderingTerms &)orders
                                                    limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareSelect] onResultColumns:resultColumns] order:orders] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    limit:(const WCDB::Expression &)limit
                                                   offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareSelect] onResultColumns:resultColumns] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    where:(const WCDB::Expression &)condition
                                                    order:(const WCDB::OrderingTerms &)orders
                                                    limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    where:(const WCDB::Expression &)condition
                                                    limit:(const WCDB::Expression &)limit
                                                   offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    order:(const WCDB::OrderingTerms &)orders
                                                    limit:(const WCDB::Expression &)limit
                                                   offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareSelect] onResultColumns:resultColumns] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

- (NSArray /* <WCTObject*> */ *)getObjectsOnResultColumns:(const WCTResultColumns &)resultColumns
                                                    where:(const WCDB::Expression &)condition
                                                    order:(const WCDB::OrderingTerms &)orders
                                                    limit:(const WCDB::Expression &)limit
                                                   offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allObjects];
}

#pragma mark - Get One Row
- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumns] limit:1] invalidateWhenUsedUp] nextRow];
}

- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
                         where:(const WCDB::Expression &)condition
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] limit:1] invalidateWhenUsedUp] nextRow];
}

- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
                         order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumns] order:orders] limit:1] invalidateWhenUsedUp] nextRow];
}

- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumns] limit:1] offset:offset] invalidateWhenUsedUp] nextRow];
}

- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:1] invalidateWhenUsedUp] nextRow];
}

- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
                         where:(const WCDB::Expression &)condition
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] limit:1] offset:offset] invalidateWhenUsedUp] nextRow];
}

- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
                         order:(const WCDB::OrderingTerms &)orders
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumns] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextRow];
}

- (WCTOneRow *)getRowOnResults:(const WCTResultColumns &)resultColumns
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextRow];
}

#pragma mark - Get One Column
- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
{
    return [[[[self prepareRowSelect] onResultColumns:resultColumn] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              where:(const WCDB::Expression &)condition
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumn] order:orders] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              limit:(const WCDB::Expression &)limit
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumn] limit:limit] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              where:(const WCDB::Expression &)condition
                              order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] order:orders] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              where:(const WCDB::Expression &)condition
                              limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] limit:limit] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              order:(const WCDB::OrderingTerms &)orders
                              limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumn] order:orders] limit:limit] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              limit:(const WCDB::Expression &)limit
                             offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumn] limit:limit] offset:offset] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              where:(const WCDB::Expression &)condition
                              order:(const WCDB::OrderingTerms &)orders
                              limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              where:(const WCDB::Expression &)condition
                              limit:(const WCDB::Expression &)limit
                             offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              order:(const WCDB::OrderingTerms &)orders
                              limit:(const WCDB::Expression &)limit
                             offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumn] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allValues];
}

- (WCTOneColumn *)getColumnOnResult:(const WCTResultColumn &)resultColumn
                              where:(const WCDB::Expression &)condition
                              order:(const WCDB::OrderingTerms &)orders
                              limit:(const WCDB::Expression &)limit
                             offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allValues];
}

#pragma mark - Get One Value
- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumn] limit:1] invalidateWhenUsedUp] nextValue];
}

- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
                         where:(const WCDB::Expression &)condition
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] limit:1] invalidateWhenUsedUp] nextValue];
}

- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
                         order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumn] order:orders] limit:1] invalidateWhenUsedUp] nextValue];
}

- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumn] limit:1] offset:offset] invalidateWhenUsedUp] nextValue];
}

- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] order:orders] limit:1] invalidateWhenUsedUp] nextValue];
}

- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
                         where:(const WCDB::Expression &)condition
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] limit:1] offset:offset] invalidateWhenUsedUp] nextValue];
}

- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
                         order:(const WCDB::OrderingTerms &)orders
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumn] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextValue];
}

- (WCTValue *)getValueOnResult:(const WCTResultColumn &)resultColumn
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareRowSelect] onResultColumns:resultColumn] where:condition] order:orders] limit:1] offset:offset] invalidateWhenUsedUp] nextValue];
}

#pragma mark - Get Rows
- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
{
    return [[[[self prepareRowSelect] onResultColumns:resultColumns] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                where:(const WCDB::Expression &)condition
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumns] order:orders] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                limit:(const WCDB::Expression &)limit
{
    return [[[[[self prepareRowSelect] onResultColumns:resultColumns] limit:limit] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                where:(const WCDB::Expression &)condition
                                order:(const WCDB::OrderingTerms &)orders
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] order:orders] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                where:(const WCDB::Expression &)condition
                                limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] limit:limit] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                order:(const WCDB::OrderingTerms &)orders
                                limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumns] order:orders] limit:limit] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                limit:(const WCDB::Expression &)limit
                               offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareRowSelect] onResultColumns:resultColumns] limit:limit] offset:offset] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                where:(const WCDB::Expression &)condition
                                order:(const WCDB::OrderingTerms &)orders
                                limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                where:(const WCDB::Expression &)condition
                                limit:(const WCDB::Expression &)limit
                               offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                order:(const WCDB::OrderingTerms &)orders
                                limit:(const WCDB::Expression &)limit
                               offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareRowSelect] onResultColumns:resultColumns] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allRows];
}

- (WCTColumnsXRows *)getRowsOnResults:(const WCTResultColumns &)resultColumns
                                where:(const WCDB::Expression &)condition
                                order:(const WCDB::OrderingTerms &)orders
                                limit:(const WCDB::Expression &)limit
                               offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareRowSelect] onResultColumns:resultColumns] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] allRows];
}

#pragma mark - Insert
- (BOOL)insertObject:(WCTObject *)object
{
    return [[[[self prepareInsert] value:object] invalidateWhenUsedUp] execute];
}

- (BOOL)insertObjects:(NSArray<WCTObject *> *)objects
{
    return [[[[self prepareInsert] values:objects] invalidateWhenUsedUp] execute];
}

- (BOOL)insertOrReplaceObject:(WCTObject *)object
{
    return [[[[[self prepareInsert] orReplace] value:object] invalidateWhenUsedUp] execute];
}

- (BOOL)insertOrReplaceObjects:(NSArray<WCTObject *> *)objects
{
    return [[[[[self prepareInsert] orReplace] values:objects] invalidateWhenUsedUp] execute];
}

- (BOOL)insertObject:(WCTObject *)object onProperties:(const WCTProperties &)properties
{
    return [[[[[self prepareInsert] onProperties:properties] value:object] invalidateWhenUsedUp] execute];
}

- (BOOL)insertObjects:(NSArray<WCTObject *> *)objects onProperties:(const WCTProperties &)properties
{
    return [[[[[self prepareInsert] onProperties:properties] values:objects] invalidateWhenUsedUp] execute];
}

- (BOOL)insertOrReplaceObject:(WCTObject *)object onProperties:(const WCTProperties &)properties
{
    return [[[[[[self prepareInsert] orReplace] onProperties:properties] value:object] invalidateWhenUsedUp] execute];
}

- (BOOL)insertOrReplaceObjects:(NSArray<WCTObject *> *)objects onProperties:(const WCTProperties &)properties
{
    return [[[[[[self prepareInsert] orReplace] onProperties:properties] values:objects] invalidateWhenUsedUp] execute];
}

#pragma mark - Update Properties With Object
- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
{
    return [[[[[self prepareUpdate] set:properties] toObject:object] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         where:(const WCDB::Expression &)condition
{
    return [[[[[[self prepareUpdate] set:properties] toObject:object] where:condition] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareUpdate] set:properties] toObject:object] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         where:(const WCDB::Expression &)condition
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareUpdate] set:properties] toObject:object] where:condition] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareUpdate] set:properties] toObject:object] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareUpdate] set:properties] toObject:object] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[[[self prepareUpdate] set:properties] toObject:object] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         where:(const WCDB::Expression &)condition
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareUpdate] set:properties] toObject:object] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareUpdate] set:properties] toObject:object] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                    withObject:(WCTObject *)object
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[[self prepareUpdate] set:properties] toObject:object] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

#pragma mark - Update Properties With Row
- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
{
    return [[[[[self prepareUpdate] set:properties] toRow:row] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         where:(const WCDB::Expression &)condition
{
    return [[[[[[self prepareUpdate] set:properties] toRow:row] where:condition] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareUpdate] set:properties] toRow:row] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         where:(const WCDB::Expression &)condition
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareUpdate] set:properties] toRow:row] where:condition] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareUpdate] set:properties] toRow:row] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareUpdate] set:properties] toRow:row] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
{
    return [[[[[[[[self prepareUpdate] set:properties] toRow:row] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         where:(const WCDB::Expression &)condition
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareUpdate] set:properties] toRow:row] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareUpdate] set:properties] toRow:row] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperties:(const WCTProperties &)properties
                       withRow:(WCTColumnCodingRow *)row
                         where:(const WCDB::Expression &)condition
                         order:(const WCDB::OrderingTerms &)orders
                         limit:(const WCDB::Expression &)limit
                        offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[[self prepareUpdate] set:properties] toRow:row] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

#pragma mark - Update Properties With Value
- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
{
    return [[[[self prepareUpdate] set:property] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       where:(const WCDB::Expression &)condition
{
    return [[[[[[self prepareUpdate] set:property] toValue:value] where:condition] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareUpdate] set:property] toValue:value] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       where:(const WCDB::Expression &)condition
                       limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareUpdate] set:property] toValue:value] where:condition] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       order:(const WCDB::OrderingTerms &)orders
                       limit:(const WCDB::Expression &)limit
{
    return [[[[[[[self prepareUpdate] set:property] toValue:value] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       limit:(const WCDB::Expression &)limit
                      offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareUpdate] set:property] toValue:value] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       where:(const WCDB::Expression &)condition
                       order:(const WCDB::OrderingTerms &)orders
                       limit:(const WCDB::Expression &)limit
{
    return [[[[[[[[self prepareUpdate] set:property] toValue:value] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       where:(const WCDB::Expression &)condition
                       limit:(const WCDB::Expression &)limit
                      offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareUpdate] set:property] toValue:value] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       order:(const WCDB::OrderingTerms &)orders
                       limit:(const WCDB::Expression &)limit
                      offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[self prepareUpdate] set:property] toValue:value] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)updateRowsOnProperty:(const WCTProperty &)property
                   withValue:(WCTColumnCodingValue *)value
                       where:(const WCDB::Expression &)condition
                       order:(const WCDB::OrderingTerms &)orders
                       limit:(const WCDB::Expression &)limit
                      offset:(const WCDB::Expression &)offset
{
    return [[[[[[[[[self prepareUpdate] set:property] toValue:value] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

#pragma mark - Delete
- (BOOL)deleteObjects
{
    return [[[self prepareDelete] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsWhere:(const WCDB::Expression &)condition
{
    return [[[[self prepareDelete] where:condition] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsOrderBy:(const WCDB::OrderingTerms &)orders
{
    return [[[[self prepareDelete] order:orders] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsLimit:(const WCDB::Expression &)limit
{
    return [[[[self prepareDelete] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsOffset:(const WCDB::Expression &)offset
{
    return [[[[self prepareDelete] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsWhere:(const WCDB::Expression &)condition
                     limit:(const WCDB::Expression &)limit
{
    return [[[[[self prepareDelete] where:condition] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsOrderBy:(const WCDB::OrderingTerms &)orders
                       limit:(const WCDB::Expression &)limit
{
    return [[[[[self prepareDelete] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsLimit:(const WCDB::Expression &)limit
                    offset:(const WCDB::Expression &)offset
{
    return [[[[[self prepareDelete] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsWhere:(const WCDB::Expression &)condition
                     order:(const WCDB::OrderingTerms &)orders
                     limit:(const WCDB::Expression &)limit
{
    return [[[[[[self prepareDelete] where:condition] order:orders] limit:limit] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsWhere:(const WCDB::Expression &)condition
                     limit:(const WCDB::Expression &)limit
                    offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareDelete] where:condition] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsOrderBy:(const WCDB::OrderingTerms &)orders
                       limit:(const WCDB::Expression &)limit
                      offset:(const WCDB::Expression &)offset
{
    return [[[[[[self prepareDelete] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

- (BOOL)deleteObjectsWhere:(const WCDB::Expression &)condition
                     order:(const WCDB::OrderingTerms &)orders
                     limit:(const WCDB::Expression &)limit
                    offset:(const WCDB::Expression &)offset
{
    return [[[[[[[self prepareDelete] where:condition] order:orders] limit:limit] offset:offset] invalidateWhenUsedUp] execute];
}

@end
