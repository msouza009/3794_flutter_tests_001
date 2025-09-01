import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_listin/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('fluxo de login funciona', (tester) async {
    // Inicia o app
    app.main();
    await tester.pumpAndSettle();

    // Digita e-mail e senha
    await tester.enterText(
        find.byKey(const Key('emailField')), 'teste@exemplo.com');
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');

    // Pressiona o botão de login
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    // Aqui você valida o resultado esperado após o login
    // Exemplo: se abre a tela principal ou aparece mensagem de "Bem-vindo"
    expect(find.text('Bem vindo ao Listin!'), findsNothing);
    // substitua pela validação correta (ex: tela inicial, snackbar etc.)
  });
}
