//
//  SearchViewController.m
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import "SearchViewController.h"
#import "ThumbnailCollectionViewCell.h"
#import "PhotoViewController.h"
#import "Photo.h"

@interface SearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate,   UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@property NSMutableArray *photos;
@property NSMutableArray *favoritesArray;
@property NSString *clientId;
@property NSString *keyword;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photos = [[NSMutableArray alloc] init];

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"plist"];
    NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:plistPath];

 //   NSString *token = configuration[@"Instagram API"][@"Access Token"];
    self.clientId = configuration[@"Instagram API"][@"Client ID"];
    //self.keyword = @"travel";



    [self setcollectionViewFloat];
    
}

// get images and atributes
- (void) getInstagramData:(NSURL *)url
{
    [self.spinner startAnimating];
    if (self.photos != nil) {
        [self.photos  removeAllObjects];
    }

    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (data != nil) {

            NSDictionary *instaJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: nil];

            NSArray *instaData = instaJSON[@"data"];

            int i;
            // unpack limited array
            for (i = 0; i < instaData.count; i++)
            {

                NSDictionary *instaAtributes = [instaData objectAtIndex:i];

                Photo *aPhoto = [[Photo alloc] initWithDictionary:instaAtributes];

                [self.photos addObject:aPhoto];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            
            [self.spinner stopAnimating];
        });

        
    }];
    
    [task resume];
    
    
}
#pragma mark - Search

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([searchBar.text length] != 0)
    {
        self.keyword = searchBar.text;

        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?client_id=%@",self.keyword,self.clientId]];

        [self getInstagramData:url];
    }
    
    [searchBar resignFirstResponder];
}

- (void) searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}


#pragma mark - Collection View

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photos.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    ThumbnailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    Photo *photo = [self.photos objectAtIndex:indexPath.row] ;


    cell.thumbnailImage.image = photo.image;
    
    
    return cell;
}

- (void) setcollectionViewFloat{

    // Set up Collection View
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/3 - 10, self.view.frame.size.width/3 - 10);
    flowLayout.minimumLineSpacing = 5.0f;
    flowLayout.minimumInteritemSpacing = 5.0f;
    flowLayout.sectionInset = UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f);
    [flowLayout setHeaderReferenceSize:CGSizeMake(0,0)];

    self.collectionView.collectionViewLayout = flowLayout;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UICollectionViewCell *)sender {

    if ([segue.identifier isEqualToString:@"PhotoDetailSegue"])
    {
        PhotoViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        vc.photo = [self.photos objectAtIndex:indexPath.row];
    }

}


@end
