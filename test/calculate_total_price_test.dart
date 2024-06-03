import "package:flutter_listin/products/helpers/calculate_total_price.dart";
import "package:flutter_listin/products/model/product.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("Uma lista de produtos vazia, retorna total zero.", () {
    List<Product> listProducts = [];

    double result = calculateTotalPriceFromListProduct(listProducts);

    expect(result, 0);
  });
}
