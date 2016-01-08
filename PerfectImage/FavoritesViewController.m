//
//  FavoritesViewController.m
//  PerfectImage
//
//  Created by Rumiya Murtazina on 1/7/16.
//  Copyright © 2016 abearablecode. All rights reserved.
//

#import "FavoritesViewController.h"
#import "PhotoViewController.h"
#import "ThumbnailCollectionViewCell.h"
#import "Photo.h"

@interface FavoritesViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, PhotoViewControllerDelegate>

@property NSMutableArray *favoritesArray;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self load];

    if (self.favoritesArray == nil) {
        self.favoritesArray = [NSMutableArray new];
    }

    [self setcollectionViewFloat];

}

- (void)didTappedHeart{
    [self load];
    [self.collectionView reloadData];
}


#pragma mark - Collection View

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.favoritesArray.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ThumbnailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    if (self.favoritesArray.count > 0){

        Photo *photo = [self.favoritesArray objectAtIndex:indexPath.row] ;
        cell.thumbnailImage.image = photo.image;

    }
    
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

    if ([segue.identifier isEqualToString:@"FavPhotoDetailSegue"])
    {
        PhotoViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        vc.photo = [self.favoritesArray objectAtIndex:indexPath.row];
        vc.isFavorite = YES;
    }
    
}


#pragma - mark Persistence

- (NSURL *)documentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

- (void)load {
    NSData *notesData = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    self.favoritesArray = [NSKeyedUnarchiver unarchiveObjectWithData:notesData];

}



@end
