import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter_listin/listins/services/listin_service.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";

import "listin_service_test.mocks.dart";

@GenerateNiceMocks([MockSpec<FirebaseFirestore>()])
void main() {
  group("getListins:", () {
    test("O método deve retornar uma lista de Listin", () {
      MockFirebaseFirestore mockFirestore = MockFirebaseFirestore();
      String uid = "MEU_UID";

      ListinService listinService = ListinService(
        firestore: mockFirestore,
        uid: uid,
      );
    });
  });
}
