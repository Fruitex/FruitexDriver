//
//  FDTextFieldCell.m
//  FruitexDriver
//
//  Created by Greg on 11/5/2013.
//  Copyright (c) 2013 Fruitex. All rights reserved.
//

#import "FDTextFieldCell.h"

NSString * const TextFieldCellIdentifier = @"TextFieldCell";
static const NSInteger TextFieldLeftRightMargin = 15;

@interface FDTextFieldCell ()

@end

@implementation FDTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect frame = self.frame;
        frame.origin.x += TextFieldLeftRightMargin;
        frame.size.width -= TextFieldLeftRightMargin * 2;
        self.textField = [[UITextField alloc] initWithFrame:frame];
        self.textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.textField];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
