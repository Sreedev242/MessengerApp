import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/Application/groupBloc/group_search_bloc.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Infrastructure/DatabaseService.dart';
import 'package:messenger_app/Presentation/chatScreen.dart';
import 'package:messenger_app/widgets/snackbar_reg.dart';
class searchResultscreen extends StatefulWidget {
  const searchResultscreen({Key? key}) : super(key: key);

  @override
  State<searchResultscreen> createState() => _searchResultscreenState();
}

class _searchResultscreenState extends State<searchResultscreen> {
  List<bool> isJoinList = [];
  bool _disposed = false; // Define _disposed here

  @override
  void initState() {
    super.initState();
    isJoinList = List.filled(0, false, growable: true);
  }

  @override
  void dispose() {
    _disposed = true; // Mark the widget as disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupSearchBloc, GroupSearchState>(
      builder: (context, state) {
        if (_disposed) {
          return Container();
        }

        if (state.queryList == null || state.queryList.isEmpty) {
          return Container();
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            joinedOrnot(
              state.queryList[index]['groupName'],
              state.queryList[index]['groupId'],
              index,
            );

            while (isJoinList.length <= index) {
              isJoinList.add(false);
            }

            return ListTile(
              leading:  CircleAvatar(
            backgroundColor:AppColors.ThemeColor,
            radius: 24,child:Center(child: Text(state.queryList[index]['groupName'][0].toUpperCase(),style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),),
              title: Text(state.queryList[index]['groupName']),
              subtitle: Text('ID:${state.queryList[index]['groupId']}'),
              trailing: InkWell(
                onTap: () async {
                  final CollectionReference userCollection =
                      FirebaseFirestore.instance.collection('Users');

                  DocumentSnapshot username = await userCollection
                      .doc(firebaseAuth.currentUser!.uid)
                      .get();
                  await DataBaseService(
                    UId: firebaseAuth.currentUser!.uid,
                  ).toggleGroupJoin(
                    state.queryList[index]['groupName'],
                    state.queryList[index]['groupId'],
                    username['fullname'],
                  );

                  setState(() {
                    isJoinList[index] = !isJoinList[index];
                  });
                  if (isJoinList[index] == false) {
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => chatScreen(
                              groupId: state.queryList[index]['groupId'],
                              groupName: state.queryList[index]['groupName'],
                              userName: username['fullname'])));
                    });
                  }
                  showSnackbar(
                      context: context,
                      message: isJoinList[index]
                          ? "You left the group '${state.queryList[index]['groupName']}'"
                          : "Joined the group successfully",
                      color: isJoinList[index] ? Colors.red : Colors.green);
                },
                child: isJoinList[index]
                    ? Container(
                        child: Text(
                          'Joined',
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                      )
                    : Container(
                        child: Text(
                          'Join',
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.ThemeColor,
                        ),
                      ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: state.queryList.length,
        );
      },
    );
  }

  // Modify joinedOrnot to accept _disposed as a parameter
  Future<void> joinedOrnot(
      String groupName, String groupId, int index) async {
    if (_disposed) {
      return; // Exit if the widget is disposed
    }

    await DataBaseService(UId: firebaseAuth.currentUser!.uid)
        .isUserJoined(
      groupName,
      groupId,
    )
        .then((value) {
      if (!_disposed) {
        setState(() {
          isJoinList[index] = value;
        });
      }
    });
  }
}

