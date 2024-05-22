import "package:flutter/material.dart";
import "package:flutter_listin/products/model/product.dart";
import "package:flutter_listin/products/widgets/product_list_item.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  testWidgets(
    "As informações básicas devem ser mostradas",
    (widgetTester) async {
      Product product = Product(
        id: "ID001",
        name: "Detergente",
        obs: "",
        category: "",
        isKilograms: false,
        isPurchased: false,
        amount: 2,
        price: 2.5,
      );

      widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ListView(
            children: [
              ProductListItem(
                listinId: "LISTIN_ID",
                product: product,
                onTap: () {},
                onCheckboxTap: () {},
                onTrailButtonTap: () {},
              )
            ],
          ),
        ),
      ));
    },
  );
}
