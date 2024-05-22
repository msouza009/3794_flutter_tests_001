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

      await widgetTester.pumpWidget(MaterialApp(
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

      Finder findCheckbox = find.byType(Checkbox);
      Finder findDelete = find.widgetWithIcon(IconButton, Icons.delete);
      Finder findTitle =
          find.text("${product.name} (x${product.amount!.toInt()})");
      Finder findSubtitle = find.byKey(const Key("subtitle"));

      expect(findCheckbox, findsOne);
      expect(findSubtitle, findsOne);
      expect(findTitle, findsOne);
      expect(findDelete, findsOne);

      Text textSubtitle = widgetTester.widget<Text>(findSubtitle);
      expect(textSubtitle.data, equals("R\$ ${product.price!}"));
    },
  );
}
