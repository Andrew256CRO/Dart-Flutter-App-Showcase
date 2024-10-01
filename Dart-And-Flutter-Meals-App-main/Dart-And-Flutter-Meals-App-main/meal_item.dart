import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    //name gives me acces to the enum value as a string
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    //name gives me acces to the enum value as a string
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        //deci Stack e stiva. Functionare ca o stiva => primul element o sa fie cel mai din spate(aka un background de exemplu)
        child: Stack(
          children: [
            //displays an image that's slowly faded in, it doesn't just poop up(it's ugly)
            //MemoryImage is an image provider class(it knows how to load images from memory)
            //kTransparentImage is imported from that package that I have added
            //NetworkImage => an image fetched from the Internet
            //Hero is a widget that animates widgets accross different widgets, accross different screens typically
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                //double.infinity => telling the image to get as much space as it can get horrizontally
                width: double.infinity,
              ),
            ),
            // to position a widget on top of nother widget, I shall use the Positioned() widget
            // by setting bootom, top , left, right =>I define how this widget should be positioned on top of the FadeInImage in this example
            Positioned(
              //by setting those values to 0, this widget will be positioned on top of the FadeInImage
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                //adding the background color
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                //I want to have my title sit above my metadata => Column() is da way
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      //softWrap makes sure that the text is wrapped in a good looking way
                      softWrap: true,
                      // the overflow parameter controls how the text should be cut off if it needs to be cut off because
                      //it's to long(it would take more that 2 lines for example)
                      //TextOverflow.ellipsis => if very long text => it would be cut off with '...'
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule_rounded,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money_outlined,
                            label: affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
