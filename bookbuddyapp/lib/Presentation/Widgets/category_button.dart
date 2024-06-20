import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookbuddyapp/Blocs/explore_bloc.dart';

class CategoryButton extends StatelessWidget {
  final String category;
  final icon;
  final Color coloor;
  const CategoryButton(
      {super.key, required this.category, this.icon, required this.coloor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          final exploreBloc = BlocProvider.of<ExploreBloc>(context);
          exploreBloc.add(FetchExploreBooks(category));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              gradient: LinearGradient(
                  colors: 
                  [coloor.withOpacity(0.9), coloor.withOpacity(0.2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "  " + category + "  ",
                  style:  TextStyle(color:Theme.of(context).colorScheme.primary, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
