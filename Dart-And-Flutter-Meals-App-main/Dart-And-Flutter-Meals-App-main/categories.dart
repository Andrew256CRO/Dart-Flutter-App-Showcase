import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.avaibleMeals});

  final List<Meal> avaibleMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    //vsync is responsible for making sure that this animation executes for every frame
    //duretion controls the length of the animation that I want to play
    //with upperound and lowerbound I control in which values Flutter will animate
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    //forward starts the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = widget.avaibleMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //we can navigate to a screen using the push method
    //Navigator.push(context, route)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // multi-screen apps generally use the Scaffold widget for the default settings that it can bring
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        //GridView main axis is from top to bottom, the cross axis is from left to right. So if I set 'crossAxisCount', I get 2 columns
        //next to eachother. So horrizontaly, I have these 2 columns.
        //'SliverGridDelegateWithFixedCrossAxisCount' <=> I can set the number of Columns
        //'childAspectRatio' will impact the size of the GridView items.
        //'crossAxisSpacing' makes some space bewtween the columns
        //So I have a horizontal space of 20 pixels between my items and a vertical space of 20 pixels beween my grid items
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectedCategory(context, category);
              },
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          // 0 = no offset, 1 = 100% offset by the end
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
    /*Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      // body is the main page content
      // GridView renders a grid of items(works similar like ListView)
      body: */
  }
}
