import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';

class CustomAnimatedContainer extends StatelessWidget {

  CustomAnimatedContainer({
  Key? key,
  this.selectedIndex = 0,
  this.showElevation = true,
  this.iconSize = 24,
  this.backgroundColor,
  this.itemCornerRadius = 50,
  this.containerHeight = 56,
  this.animationDuration = const Duration(milliseconds: 270),
  this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  required this.items,
  required this.onItemSelected,
  this.curve = Curves.linear,
  }) : assert(items.length >= 2 && items.length <= 5),
  super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<RecommendedItems> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {


  return  Container(
  decoration: BoxDecoration(
  color: getColorFromHex(ColorCode.Color_blue,),
  borderRadius: BorderRadius.only(
  topLeft: const Radius.circular(25.0),
  bottomLeft: const Radius.circular(25.0),
  )),
  width: double.infinity,
  height: containerHeight,
  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
  child: Row(
  mainAxisAlignment: mainAxisAlignment,
  children: items.map((item) {
  var index = items.indexOf(item);
  return GestureDetector(
  onTap: () => onItemSelected(index),
  child: _ItemWidget(
  item: item,
  iconSize: iconSize,
  isSelected: index == selectedIndex,

  itemCornerRadius: itemCornerRadius,
  animationDuration: animationDuration,
  curve: curve,
  ),
  );
  }).toList(),
  ),

  );
  }
  }

  class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final RecommendedItems item;

  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
  Key? key,
  required this.item,
  required this.isSelected,

  required this.animationDuration,
  required this.itemCornerRadius,
  required this.iconSize,
  this.curve = Curves.bounceOut,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Semantics(
  container: true,
  selected: isSelected,
  child: AnimatedContainer(

  height:50,
  duration: animationDuration,
  curve: curve,
  decoration: BoxDecoration(
  color:
  isSelected ? Colors.white : Colors.transparent,
  borderRadius: BorderRadius.circular(itemCornerRadius),
  ),
  child: SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  physics: NeverScrollableScrollPhysics(),
  child: Container(
  width: isSelected ? 130 : 50,
  padding: EdgeInsets.symmetric(horizontal: 8),
  child: Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
  IconTheme(
  data: IconThemeData(
  size: iconSize,
  color: isSelected
  ? item.activeColor.withOpacity(1)
      : item.inactiveColor == null
  ? item.activeColor
      : item.inactiveColor,
  ),
  child: item.icon,
  ),
  if (isSelected)
  Expanded(
  child: Container(
  padding: EdgeInsets.symmetric(horizontal: 4),
  child: DefaultTextStyle.merge(
  style: TextStyle(
  color: item.activeColor,
  fontWeight: FontWeight.bold,
  ),
  maxLines: 1,
  textAlign: item.textAlign,
  child: item.title,
  ),
  ),
  ),
  ],
  ),
  ),
  ),
  ),
  );
  }
  }
  class RecommendedItems {

  RecommendedItems({
  required this.icon,
  required this.title,
  this.activeColor = Colors.white,
  this.textAlign,
  this.inactiveColor,
  });

  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;

  }
