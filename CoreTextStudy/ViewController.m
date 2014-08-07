//
//  ViewController.m
//  CoreTextStudy
//
//  Created by Line_Hu on 14-8-5.
//  Copyright (c) 2014年 Alpha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    StyledPageControl *pageCtrl;
}
@end

@implementation ViewController

- (void)setupViews
{
    UIFont *font = [UIFont fontWithName:@"Courier" size:15];
    //setup page1
    UITextView *txtView = [[UITextView alloc] initWithFrame:_contentView.frame];
    txtView.editable = NO;
    self.textView = txtView;
    self.textView.delegate = self;
    [self.contentView addSubview:self.textView];
    [self.textView.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:@"名称:金毛巡回猎犬\n英文名:Golder Retriever\n别称:金毛、金毛犬、黄金猎犬\n智商排名:第四\n\n\n\n   金毛寻回猎犬是在19世纪由苏格兰的一位君主，用一种小型的纽芬兰犬、爱尔兰赛特犬和已经绝迹的杂色水猎犬，培育出的一种金黄色的长毛寻回犬，后来这品种逐渐成为著名的金毛寻回犬。当时这种犬叼衔猎物非常合适，因为他们的嘴叼衔时非常柔和。金毛寻回犬有很强的游泳能力，并能把猎物从水中叼回给主人。它也是人类忠实、友善的家庭朋友，也可训练为优秀的导盲犬。金毛寻回猎犬体格健壮，工作热心，可以用来捕捉水鸟，任何气候下都能在水中游泳。金毛犬深受猎手的喜爱，主要被作为家犬饲养，为中型犬。养一只金毛并不是十分的困难，虽然喜欢运动但是不像哈士奇那么精力充沛；虽然需要梳毛但是不像古牧那么麻烦，一周梳两次就可以了；虽然个子比较大，但是性格非常温顺，一个成年人完全可以把控."];
    [self.textView.textStorage addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.textView.textStorage.string.length)];
    UIImageView *avatar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
    avatar.image = [UIImage imageNamed:@"ItemIcon048g.png"];
    self.katanaView = avatar;
    [self.contentView addSubview:self.katanaView];
    //page2
    UITextView *historyTxtView = [[UITextView alloc] initWithFrame:CGRectMake(_contentView.frame.size.width, 0, _contentView.frame.size.width, _contentView.frame.size.height)];
    historyTxtView.editable = NO;
    self.historyTextView = historyTxtView;
    [self.contentView addSubview:self.historyTextView];
    UIImageView *history = [[UIImageView alloc] initWithFrame:CGRectMake(_contentView.frame.size.width, 0, 128, 128)];
    history.image = [UIImage imageNamed:@"ItemIcon008f.png"];
    [self.contentView addSubview:history];
    [self.historyTextView.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:@"对于金毛寻回猎犬的原出生颇有争议，改良的品种大致可以认为在19世纪后期。最初的名字是苏俄追踪犬，后来加入佛乐寻猎物犬种，寻血猎犬种，水猎鹬犬种的基因。配种的结果产生了此天生具备猎物取回能力，善于追踪及具有敏锐嗅觉的犬种。苏格兰金毛寻回犬的历史可追溯到 1865 年，那时苏格兰流行打猎，因此擅于捕猎野生动物的中型犬种就大受狩猎家欢迎，当时就有一只毛长耳垂的浅猪肝色的拉布水猎犬，经常在苏格兰出没，但这种犬种已绝迹了。其后苏格兰有一位贵族，名叫 Lord Tweedmouth，就尝试以黄色的拉布拉多寻回犬（Labrador Retriever），已绝种的拉布水猎犬混合繁殖，经过多次的品种改良，渐渐成为了今天人所共知的金毛寻回犬了"];
    [self.historyTextView.textStorage addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _historyTextView.textStorage.length)];
    //page3
    UITextView *personalityTxtView = [[UITextView alloc] initWithFrame:CGRectMake(_contentView.frame.size.width*2, 0, _contentView.frame.size.width, _contentView.frame.size.height)];
    personalityTxtView.editable = NO;
    self.personalityTextView = personalityTxtView;
    [self.personalityTextView.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:@"金毛的性格十分温顺，并且很乐意与人互动，所以目前很多金毛经过专业训练后成为了工作犬，它们会看家护院，为盲人指引路线，甚至在一些搜救工作中，也能看到金毛的身影."];
    [self.personalityTextView.textStorage addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.personalityTextView.textStorage.length)];
    [self.contentView addSubview:self.personalityTextView];

    UIImageView *personality = [[UIImageView alloc] initWithFrame:CGRectMake(_contentView.frame.size.width*2, 0, 128, 128)];
    personality.image = [UIImage imageNamed:@"ItemIcon037g.png"];
    [self.contentView addSubview:personality];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"Introduction";
    self.contentView.delegate = self;
    self.contentView.pagingEnabled = YES;
    self.contentView.contentSize = CGSizeMake(_contentView.frame.size.width*3, _contentView.frame.size.height);
    pageCtrl = [[StyledPageControl alloc] initWithFrame:_pageControl.frame];
    pageCtrl.numberOfPages = 3;
    pageCtrl.pageControlStyle = PageControlStyleDefault;
    [pageCtrl setCoreNormalColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    [pageCtrl setCoreSelectedColor:[UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1]];
    [self.view addSubview:pageCtrl];
    [self setupViews];
    // Do any additional setup after loading the view, typically from a nib.
    [self updatePath];
}

- (void)updatePath
{
    CGRect katanaFrame = [self.textView convertRect:_katanaView.bounds fromView:_katanaView];
    //NSLog(@"%f,%f",katanaFrame.origin.x,katanaFrame.origin.y);
    katanaFrame.origin.x -= self.textView.textContainerInset.left;
	katanaFrame.origin.y -= self.textView.textContainerInset.top;
	
	// Simply set the exclusion path
	UIBezierPath *ovalPath = [UIBezierPath bezierPathWithRect: katanaFrame];
	self.textView.textContainer.exclusionPaths = @[ovalPath];
    self.historyTextView.textContainer.exclusionPaths = @[ovalPath];
    self.personalityTextView.textContainer.exclusionPaths = @[ovalPath];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/scrollView.frame.size.width;
    //NSLog(@"%d",page);
    pageCtrl.currentPage = page;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
