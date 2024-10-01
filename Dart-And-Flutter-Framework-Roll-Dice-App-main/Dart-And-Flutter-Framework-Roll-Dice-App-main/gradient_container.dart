import 'package:flutter/material.dart';
//import 'dart:math';
import 'dart:math' as math;
//when you use the as keyword you provide the imported library a name so you can reference it anywhere in your file

//import 'dart:ui';

import 'package:aplicatie2/roll_dice.dart';

// variable types: Alignment
//Alignment? sA; // optional // can be iether null or of type Alignment this variable it is (Yoda)
//var startAlignment = Alignment.topRight;
//var endAlignment = Alignment.bottomLeft;
//Variables created with the 'var' keyword can actually be reassigned

// pot sa explic de ce si cum, etc.
// merge si cu final
const startAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;

/*class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2,
      {super.key}); // this is how in any function we can accept named arguments
  // the class that we are extending from(StalelessWidget) wants a key argument
  // this is why my class should accept such a 'key' argument as well
  // 'super' is calling the contructor function of the parent class 'StalelessWidget'
  // GradientContainer(a, b) -> positional parameters

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    // I must return a Widget here!!!
    //startAlignment= Alignment.centerRight;
    return Container(
      //A convenience widget that combines common painting, positioning, and sizing widgets.
      // it can be used to initialize the BoxDecoration class which contains a gradient amongst other things
      decoration: BoxDecoration(
        //The BoxDecoration class provides a variety of ways to draw a box.
        //The box has a border, a body, and may cast a boxShadow.
        //The body of the box is painted in layers. The bottom-most layer is the color, which fills the box.
        //Above that is the gradient, which also fills the box.
        //Finally there is the image, the precise alignment of which is controlled by the DecorationImage class.
        //The border paints over the body; the boxShadow, naturally, paints below it.
        gradient: LinearGradient(
          // This class is used by BoxDecoration to represent linear gradients.
          // A 2D linear gradient.
          //A gradient has two anchor points, begin and end. The begin point corresponds to 0.0, and the end point corresponds to 1.0.
          //The colors are described by a list of Color objects. There must be at least two colors. The stops list, if specified, must have the same length as colors.
          //It specifies fractions of the vector from start to end, between 0.0 and 1.0, for each color. If it is null, a uniform distribution is assumed.
          //Typically this class is used with BoxDecoration, which does the painting.
          colors: [color1, color2],
          stops: const [0.50, 0.75],
          transform: const GradientRotation(math.pi / 4),
          //GradientRotation=Base class for transforming gradient shaders without applying the same transform to the entire canvas.
          begin: startAlignment,
          //Base class for Alignment that allows for text-direction aware resolution.
          end: endAlignment,
        ),
      ),
      child: const Center(
        //Creates a widget that centers its child.
        // The child contained by the Container widget. (child property)
        child: StyledText('Hello world!'),
      ),
    );
  }
}*/

//Another approach is presented above
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors,
      {super.key}); // this is how in any function we can accept named arguments
  // the class that we are extending from(StalelessWidget) wants a key argument
  // this is why my class should accept such a 'key' argument as well
  // 'super' is calling the contructor function of the parent class 'StalelessWidget'
  // GradientContainer(a, b) -> positional parameters

  final List<Color> colors;

  @override
  Widget build(context) {
    // I must return a Widget here!!!
    //startAlignment= Alignment.centerRight;
    return Container(
      //A convenience widget that combines common painting, positioning, and sizing widgets.
      // it can be used to initialize the BoxDecoration class which contains a gradient amongst other things
      decoration: BoxDecoration(
        //The BoxDecoration class provides a variety of ways to draw a box.
        //The box has a border, a body, and may cast a boxShadow.
        //The body of the box is painted in layers. The bottom-most layer is the color, which fills the box.
        //Above that is the gradient, which also fills the box.
        //Finally there is the image, the precise alignment of which is controlled by the DecorationImage class.
        //The border paints over the body; the boxShadow, naturally, paints below it.
        gradient: LinearGradient(
          // This class is used by BoxDecoration to represent linear gradients.
          // A 2D linear gradient.
          //A gradient has two anchor points, begin and end. The begin point corresponds to 0.0, and the end point corresponds to 1.0.
          //The colors are described by a list of Color objects. There must be at least two colors. The stops list, if specified, must have the same length as colors.
          //It specifies fractions of the vector from start to end, between 0.0 and 1.0, for each color. If it is null, a uniform distribution is assumed.
          //Typically this class is used with BoxDecoration, which does the painting.
          colors: colors,
          stops: const [0.20, 0.50, 0.75],
          transform: const GradientRotation(math.pi / 4),
          //GradientRotation=Base class for transforming gradient shaders without applying the same transform to the entire canvas.
          begin: startAlignment,
          //Base class for Alignment that allows for text-direction aware resolution.
          end: endAlignment,
        ),
      ),
      child: const Center(
        //Creates a widget that centers its child.
        // The child contained by the Container widget. (child property)
        child: DiceRolling(),
      ),
    );
  }
}
