import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookbuddyapp/Blocs/explore_bloc.dart';

class CategoryButton extends StatelessWidget {
  final String category;
  final icon;
  const CategoryButton({super.key,required this.category, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: const ButtonStyle(
          
          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 81, 81, 81))),
        onPressed: () {
          final exploreBloc = BlocProvider.of<ExploreBloc>(context);
          exploreBloc.add(FetchExploreBooks(category));
        },

        child: Row(
          children: [
            if(icon != null)
            Icon(icon,color: Colors.white,),
           const SizedBox(width: 6,),
            Text(category,style: const TextStyle(color: Colors.white,fontSize: 17),),
          ],
        ),
      ),
    );
  }
}