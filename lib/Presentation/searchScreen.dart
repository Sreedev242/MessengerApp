import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/Application/groupBloc/group_search_bloc.dart';
import 'package:messenger_app/Core/constants.dart';
import 'package:messenger_app/Presentation/searchResultscreen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ctrlSearch=TextEditingController();
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.ThemeColor,
        title: Text(
          'Search',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        
      ),
      body: Column(children: [
        Container(
          color: AppColors.ThemeColor,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 16),
          child: Row(
        
            children: [
            Expanded(child: CupertinoTextField(
              controller: ctrlSearch,
            )),
           IconButton(onPressed: (){
            
              context.read<GroupSearchBloc>().add(GroupSearchEvent.started(groupName: ctrlSearch.text));
              // context.read<GroupSearchBloc>().add(GroupSearchEvent.Reset());
           }, icon: Icon(Icons.search,color: Colors.white,))     
        
          ],),
        ),SizedBox(height: 15,),
        Expanded(child: BlocBuilder<GroupSearchBloc, GroupSearchState>(
          builder: (context, state) {
            if (ctrlSearch.text.isEmpty) {
              
              return Center(child: Text('Search to find groups',style: TextStyle(color: Colors.grey,fontSize: 17,fontStyle: FontStyle.italic),),);
            }
            else if (state.isLoading) {
              return Center(child: CircularProgressIndicator(color: AppColors.ThemeColor,),);
            }else if(state.queryList.isNotEmpty)
            {return searchResultscreen();}
            return Center(child: Text('No such group found!',style: TextStyle(fontSize: 16,color: Colors.grey,fontStyle: FontStyle.italic),),);
          },
        ))
      ],
      
      ),
      
    );
  }
}
