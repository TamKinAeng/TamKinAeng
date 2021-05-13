import 'package:cloud_firestore/cloud_firestore.dart';
//For set favorite feature only if you want to reuse please ask DJ
class DatabaseService {
  final String uid;
  final String foodid;

  DatabaseService({this.uid,this.foodid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future setFavorite(String id, bool isfavorite) async {
    print('add subject has been called');
    return await userCollection
        .doc(uid)
        .collection('myFavoriteRecipe')
        .doc(id)
        .set({
          'isFavorite': isfavorite,
          'recipe' : id,
        })
        .then((e) => {
             print('update $id isfavorite = $isfavorite ')
            })
        .catchError((e) => {
              print('Error setting document: ' + e),
            });
  }

  Future<List<String>> get myFavRecipes {
    var favList = List<String>.empty(growable: true);
    print(uid);
    print('getMyFavRecipeHasbeencalled');
    print(uid);
    return userCollection
        .doc(uid)
        .collection('myFavoriteRecipe')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(doc.data()['isFavorite'] == false){
        String e =  doc.data()['recipe'] ;
        favList.add(e);
        }
        }
        );
        return favList;
      });
    }

  Future<dynamic> get getFavorite {
    print(uid);
    print('getFavoriteHasbeencalled');
    print(uid);
    return userCollection
        .doc(uid)
        .collection('myFavoriteRecipe').get()
        .then((QuerySnapshot querySnapshot) {
          for (var item in querySnapshot.docs) {
           if(item.data()['recipe']==foodid){
               return {"isFavorite": item.data()['isFavorite']};
           }
          }
    });
  }
}
