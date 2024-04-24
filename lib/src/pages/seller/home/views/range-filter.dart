import 'package:flutter/material.dart';


class RangeFilter extends StatelessWidget {
  const RangeFilter({
    required this.values,
    required this.min,
    required this.max,
    required this.filterColorIndex,
    required this.colors,
    required this.onChange,
    required this.onColorTap,
    required this.onFilterTap,
    required this.onRemoveFilterTap,
    super.key,
  });

  final double max;
  final double min;
  final int filterColorIndex;
  final List<String> colors;
  final RangeValues values;
  final Function onChange;
  final Function onColorTap;
  final Function onFilterTap;
  final Function onRemoveFilterTap;

  @override
  Widget build(BuildContext context) => Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            RangeSlider(
              values: values,
              onChanged: (newValues) => onChange(newValues),
              min: min,
              max: max,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      values.start.round().toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      values.end.round().toString(),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                     'color',style: TextStyle(color: Colors.greenAccent),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) => InkWell(onTap: () => onColorTap(index),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.ac_unit,
                              color: Color(
                                int.parse(colors[index], radix: 16),
                              ),
                            ),
                            if (filterColorIndex == index)
                              Positioned(
                                left: 10,
                                bottom: 22,
                                child: Transform.scale(
                                  scale: 0.75,
                                  child: const Icon(
                                    Icons.check_sharp,color: Colors.green,size: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  onFilterTap();
                  Navigator.of(context).pop();
                },
                child: const Text('filter',style: TextStyle(color: Colors.greenAccent),)),
            IconButton(
              onPressed: () {
                onRemoveFilterTap();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        )
      ],
    ),
  );
}
