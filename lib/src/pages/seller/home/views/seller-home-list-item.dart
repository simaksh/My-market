import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/seller-home-controller.dart';
import '../models/seller-home-view-model.dart';

class SellerHomeListItem extends GetView<SellerHomePageController> {
  final SellerHomeViewModel product;
  final int index;

  const SellerHomeListItem(
      {required this.product, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image
            _buildProductImage(),
            Row(
              children: [
                const Text(
                  'Active',
                  style: TextStyle(color: Colors.greenAccent),
                ),
                Transform.scale(
                  scale: 0.5,
                  child: Switch(
                    focusColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.red,
                    activeColor: Colors.greenAccent,
                    value: product.isActive,
                    onChanged: (value) =>
                    controller.isActiveDisable.value
                        ? null
                        : controller.SwichButton(value, product),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'title:',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  Expanded(child: Text(product.title)),
                  IconButton(
                    onPressed: () => controller.edit(product.id),
                    icon: const Icon(
                      Icons.edit,
                      size: 40,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'description  :',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  Expanded(child: Text(product.description!)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'price  :',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                        Expanded(child: Text('${product.price} \$')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'count  :',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            product.count.toString(),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: List.generate(
                  product.colors.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.greenAccent),
                      ),
                      child: Icon(
                        Icons.ac_unit,
                        color: Color(int.parse(product.colors[index], radix: 16)),
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildProductImage() {
    if (product.image != null && product.image!.isNotEmpty) {
      try {
        // Decode base64 image
        final decodedImage = base64Decode(product.image!);
        // Display image
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(
              decodedImage,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        );
      } catch (e) {

        print('Error decoding image: $e');
        return const SizedBox.shrink();
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}