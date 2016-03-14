//
//  PTProject.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTProject : NSObject
/** <#description#> */
@property (nonatomic, assign) NSInteger  public;

/** <#description#> */
@property (nonatomic, copy) NSString* week_start_day;

/** <#description#> */
@property (nonatomic, assign) NSInteger  account_id;

/** <#description#> */
@property (nonatomic, assign) NSInteger  current_iteration_number;

/** <#description#> */
@property (nonatomic, assign) NSInteger  enable_following;

/** <#description#> */
@property (nonatomic, copy) NSString* project_type;

/** <#description#> */
@property (nonatomic, copy) NSString* updated_at;

/** <#description#> */
@property (nonatomic, assign) NSInteger  has_google_domain;

/** <#description#> */
@property (nonatomic, copy) NSString* kind;

/** <#description#> */
@property (nonatomic, assign) NSInteger  bugs_and_chores_are_estimatable;

/** <#description#> */
@property (nonatomic, copy) NSString* name;

/** <#description#> */
@property (nonatomic, assign) NSInteger  version;

/** <#description#> */
@property (nonatomic, assign) NSInteger  automatic_planning;

/** <#description#> */
@property (nonatomic, assign) NSInteger  Id;

/** <#description#> */
@property (nonatomic, copy) NSString* point_scale;

/** <#description#> */
@property (nonatomic, copy) NSString* profile_content;


/** <#description#> */
@property (nonatomic, assign) NSInteger  iteration_length;

/** <#description#> */
@property (nonatomic, assign) NSInteger  velocity_averaged_over;

/** <#description#> */
@property (nonatomic, assign) NSInteger  enable_incoming_emails;

/** <#description#> */
@property (nonatomic, assign) NSInteger  atom_enabled;

/** <#description#> */
@property (nonatomic, copy) NSString* start_time;

/** <#description#> */
@property (nonatomic, assign) NSInteger  number_of_done_iterations_to_show;

/** <#description#> */
@property (nonatomic, assign) NSInteger  initial_velocity;

/** <#description#> */
@property (nonatomic, assign) NSInteger  point_scale_is_custom;

/** <#description#> */
@property (nonatomic, assign) NSInteger  enable_tasks;

/** <#description#> */
@property (nonatomic, copy) NSString* created_at;

@end
