import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter_listin/listins/models/listin.dart";
import "package:flutter_listin/listins/services/listin_service.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "listin_service_test.mocks.dart";

@GenerateNiceMocks([
  MockSpec<FirebaseFirestore>(),
  MockSpec<QuerySnapshot>(),
  MockSpec<CollectionReference>(),
  MockSpec<QueryDocumentSnapshot>()
])
void main() {
  group("getListins:", () {
    test("O método deve retornar uma lista de Listin", () {
      MockFirebaseFirestore mockFirestore = MockFirebaseFirestore();

      MockQuerySnapshot<Map<String, dynamic>> mockSnapshot =
          MockQuerySnapshot();

      MockCollectionReference<Map<String, dynamic>> mockCollection =
          MockCollectionReference();

      MockQueryDocumentSnapshot<Map<String, dynamic>> mockDoc001 =
          MockQueryDocumentSnapshot();

      MockQueryDocumentSnapshot<Map<String, dynamic>> mockDoc002 =
          MockQueryDocumentSnapshot();

      String uid = "MEU_UID";

      Listin listin001 = Listin(
        id: "ID001",
        name: "Feira de Maio",
        obs: "",
        dateCreate: DateTime.now().subtract(const Duration(days: 32)),
        dateUpdate: DateTime.now().subtract(const Duration(days: 32)),
      );
      Listin listin002 = Listin(
        id: "ID002",
        name: "Feira de Junho",
        obs: "",
        dateCreate: DateTime.now(),
        dateUpdate: DateTime.now(),
      );

      when(mockDoc001.data()).thenReturn(listin001.toMap());
      when(mockDoc002.data()).thenReturn(listin002.toMap());
      when(mockSnapshot.docs).thenReturn([mockDoc001, mockDoc002]);
      when(mockCollection.get()).thenAnswer((_) async => mockSnapshot);

      when(mockFirestore.collection(uid)).thenReturn(mockCollection);

      ListinService listinService = ListinService(
        firestore: mockFirestore,
        uid: uid,
      );
    });
  });
}
