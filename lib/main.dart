import 'package:flutter/material.dart';

void main() {
  runApp(const MapaDoTerritorioApp());
}

class MapaDoTerritorioApp extends StatelessWidget {
  const MapaDoTerritorioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa do Território',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF4F5F7),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class AppDataStorage {
  static DateTime dataSelecionadaGlobal = DateTime.now();
  static bool isAdminLogado = false;
  static String usuarioLogadoAtual = '';

  static String get dataFormatadaGlobal {
    return "${dataSelecionadaGlobal.day.toString().padLeft(2, '0')}/${dataSelecionadaGlobal.month.toString().padLeft(2, '0')}/${dataSelecionadaGlobal.year}";
  }

  static final List<Map<String, String>> administradores = [
    {'usuario': 'administrador', 'senha': '1234'}
  ];

  static final List<Map<String, dynamic>> territorios = [
    {'codigo': 'T.1', 'nome': 'ST TEREZINHA 1', 'colunas': 11, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(11, (_) => 0)), 's13Linha': 0},
    {'codigo': 'T.2', 'nome': 'ST TEREZINHA 2', 'colunas': 9, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(9, (_) => 0)), 's13Linha': 1},
    {'codigo': 'T.3', 'nome': 'FANTINATO 1', 'colunas': 6, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(6, (_) => 0)), 's13Linha': 2},
    {'codigo': 'T.4', 'nome': 'FANTINATO 2', 'colunas': 8, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(8, (_) => 0)), 's13Linha': 3},
    {'codigo': 'T.5', 'nome': 'FANTINATO 3', 'colunas': 9, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(9, (_) => 0)), 's13Linha': 4},
    {'codigo': 'T.6', 'nome': 'JD VITÓRIA', 'colunas': 6, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(6, (_) => 0)), 's13Linha': 5},
    {'codigo': 'T.7', 'nome': 'CHAPARRAL 1', 'colunas': 14, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(14, (_) => 0)), 's13Linha': 6},
    {'codigo': 'T.8', 'nome': 'CHAPARRAL 2', 'colunas': 9, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(9, (_) => 0)), 's13Linha': 7},
    {'codigo': 'T.9', 'nome': 'PANSANE', 'colunas': 14, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(14, (_) => 0)), 's13Linha': 8},
    {'codigo': 'T.10', 'nome': 'ELDORADO 1', 'colunas': 14, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(14, (_) => 0)), 's13Linha': 9},
    {'codigo': 'T.11', 'nome': 'CHAPARRAL 3', 'colunas': 9, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(9, (_) => 0)), 's13Linha': 10},
    {'codigo': 'T.12', 'nome': 'ARAUCÁRIA 1', 'colunas': 8, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(8, (_) => 0)), 's13Linha': 11},
    {'codigo': 'T.13', 'nome': 'ARAUCÁRIA 2', 'colunas': 12, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(12, (_) => 0)), 's13Linha': 12},
    {'codigo': 'T.14', 'nome': 'ELDORADO 2', 'colunas': 6, 'imagem': null, 'gradeDirigente': List.generate(10, (_) => List.generate(8, (_) => '')), 'quadras': List.generate(10, (_) => List.generate(6, (_) => 0)), 's13Linha': 13},
  ];

  static final List<List<List<String>>> s13Dados = List.generate(15, (t) {
    return List.generate(2, (sub) {
      return List.generate(10, (c) => (sub == 0 && c == 0) ? 'T.${t + 1}' : '');
    });
  });

  static final List<String> nomesSegundaASexta = [
    'Carlos Silva', 'João Pereira', 'Marcos Souza', 'Antônio Carlos',
    'Paulo Roberto', 'José Eduardo', 'Roberto Alves', 'Francisco Lima',
    'Luiz Fernando', 'Ricardo Mendes', 'André Santos', 'Bruno Costa',
    'Rafael Oliveira', 'Lucas Rocha', 'Gabriel Martins', 'Matheus Araujo',
    'Diego Barbosa', 'Tiago Ribeiro', 'Rodrigo Cardoso'
  ];

  static final List<String> nomesSabado = [
    'Marcelo Souza', 'Fernando Dias', 'Sergio Ramos', 'Renato Castro',
    'Fabio Junior', 'Alexandre Lima', 'Leandro Pinto', 'Eduardo Farias',
    'Wagner Nunes', 'Anderson Souza', 'Daniel Rocha', 'Rodrigo Silva',
    'Vinicius Mendes', 'Caio Santos', 'Igor Costa', 'Leonardo Araujo',
    'Samuel Barbosa', 'Felipe Ribeiro', 'Otavio Cardoso'
  ];

  static final List<String> nomesDomingo = [
    'Paulo Henrique', 'Joao Vitor', 'Carlos Eduardo', 'Luis Gustavo',
    'Marcos Vinicius', 'Jose Carlos', 'Pedro Henrique', 'Lucas Gabriel',
    'Gabriel Henrique', 'Matheus Henrique', 'Rafael Henrique', 'Bruno Henrique',
    'Thiago Henrique', 'Diego Henrique', 'Gustavo Henrique', 'Leonardo Henrique',
    'Felipe Henrique', 'Daniel Henrique', 'Vinicius Henrique'
  ];

  static final List<List<String>> eventosTexto = List.generate(15, (row) {
    return List.generate(20, (col) {
      int bloco = col % 4;
      int blocoIndex = col ~/ 4;
      if (row == 0) {
        if (bloco == 0) return 'N*';
        if (bloco == 1) return 'PG';
        if (bloco == 2) return 'NOME';
        return 'DIAS';
      } else {
        if (bloco == 0) {
          int numero = (blocoIndex * 14) + row;
          return numero <= 70 ? numero.toString() : '';
        }
        return '';
      }
    });
  });

  static final List<List<bool>> eventosPgStatus = List.generate(15, (_) => List.generate(20, (_) => false));
  static final List<List<List<bool>>> eventosDiasStatus = List.generate(15, (_) => List.generate(20, (_) => [false, false, false]));

  static void verificarProgressoTerritorio(int territorioIndex) {
    final t = territorios[territorioIndex];
    final quadras = t['quadras'] as List<List<int>>;
    final int s13Linha = t['s13Linha'];

    int totalQuadras = 0;
    int quadrasConcluidas = 0;
    bool temAlgumaConcluida = false;

    for (var linha in quadras) {
      for (var estado in linha) {
        totalQuadras++;
        if (estado > 0) temAlgumaConcluida = true;
        if (estado == 2) quadrasConcluidas++;
      }
    }

    String dataGlobalStr = dataFormatadaGlobal;
    String dirigenteAtual = nomesSegundaASexta[0];

    int subLinhaAlvo = 0;
    if (s13Dados[s13Linha][0][2].isNotEmpty && s13Dados[s13Linha][0][3].isNotEmpty) {
      subLinhaAlvo = 1;
    }

    if (temAlgumaConcluida && s13Dados[s13Linha][subLinhaAlvo][2].isEmpty) {
      s13Dados[s13Linha][subLinhaAlvo][2] = dataGlobalStr;
      s13Dados[s13Linha][subLinhaAlvo][4] = dirigenteAtual;
    }

    if (totalQuadras > 0 && quadrasConcluidas == totalQuadras) {
      s13Dados[s13Linha][subLinhaAlvo][3] = dataGlobalStr;
    }
  }
}

AppBar customAppBar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: const Color(0xFF1B365D),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      title + (AppDataStorage.isAdminLogado ? " [Admin]" : ""),
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    centerTitle: true,
  );
}

class MiniCalendarWidget extends StatefulWidget {
  final VoidCallback onDateChanged;
  const MiniCalendarWidget({super.key, required this.onDateChanged});

  @override
  State<MiniCalendarWidget> createState() => _MiniCalendarWidgetState();
}

class _MiniCalendarWidgetState extends State<MiniCalendarWidget> {
  final List<String> _mesesNomes = [
    'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
    'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
  ];

  @override
  Widget build(BuildContext context) {
    DateTime hoje = AppDataStorage.dataSelecionadaGlobal;
    int totalDiasMes = DateTime(hoje.year, hoje.month + 1, 0).day;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '📅 ${_mesesNomes[hoje.month - 1]} ${hoje.year} (Ativo: ${AppDataStorage.dataFormatadaGlobal})',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1B365D)),
              ),
              const Text('Deslize os dias ➔', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: totalDiasMes,
              itemBuilder: (context, index) {
                int dia = index + 1;
                DateTime itemData = DateTime(hoje.year, hoje.month, dia);
                bool isSelecionado = hoje.day == dia;

                return InkWell(
                  onTap: () {
                    setState(() {
                      AppDataStorage.dataSelecionadaGlobal = itemData;
                    });
                    widget.onDateChanged();
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 36,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelecionado ? const Color(0xFF1B365D) : const Color(0xFFF4F5F7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$dia',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelecionado ? FontWeight.bold : FontWeight.w500,
                        color: isSelecionado ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B365D),
        title: Text(
          'MAPA DO TERRITÓRIO' + (AppDataStorage.isAdminLogado ? ' [Admin: ${AppDataStorage.usuarioLogadoAtual}]' : ''),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          if (AppDataStorage.isAdminLogado)
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              tooltip: 'Sair do Modo Admin',
              onPressed: () {
                setState(() {
                  AppDataStorage.isAdminLogado = false;
                  AppDataStorage.usuarioLogadoAtual = '';
                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Você saiu do modo Administrador.')));
              },
            )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MiniCalendarWidget(onDateChanged: () => setState(() {})),
            const SizedBox(height: 16),
            const Text('Território de Congregação', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1B365D))),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1,
              children: [
                DashboardCard(
                  icon: Icons.map,
                  label: 'Territórios',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TerritoriosScreen())).then((_) => setState(() {})),
                ),
                DashboardCard(
                  icon: Icons.menu_book,
                  label: 'Serviço de Campo',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicoDeCampoScreen())).then((_) => setState(() {})),
                ),
                DashboardCard(
                  icon: Icons.event,
                  label: 'Eventos',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EventosScreen())).then((_) => setState(() {})),
                ),
                DashboardCard(
                  icon: Icons.supervisor_account,
                  label: 'Dirigente',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DirigenteScreen())).then((_) => setState(() {})),
                ),
                DashboardCard(
                  icon: Icons.assignment_outlined,
                  label: 'S.13',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const S13Screen())).then((_) => setState(() {})),
                ),
                DashboardCard(
                  icon: Icons.admin_panel_settings,
                  label: AppDataStorage.isAdminLogado ? 'Painel Admin' : 'Administrador',
                  onTap: () {
                    if (AppDataStorage.isAdminLogado) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboardScreen(usuarioLogado: AppDataStorage.usuarioLogadoAtual)))
                          .then((_) => setState(() {}));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLoginScreen()))
                          .then((_) => setState(() {}));
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _mensagemErro = '';

  void _fazerLogin() {
    String user = _userController.text.trim();
    String pass = _passController.text.trim();

    bool encontrado = AppDataStorage.administradores.any((admin) => admin['usuario'] == user && admin['senha'] == pass);

    if (encontrado) {
      AppDataStorage.isAdminLogado = true;
      AppDataStorage.usuarioLogadoAtual = user;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminDashboardScreen(usuarioLogado: user)),
      );
    } else {
      setState(() {
        _mensagemErro = 'Usuário ou senha inválidos!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'LOGIN ADMINISTRADOR', context: context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.admin_panel_settings, size: 50, color: Color(0xFF1B365D)),
                  const SizedBox(height: 12),
                  const Text('Acesso Restrito', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B365D))),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(labelText: 'Usuário', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha', border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock)),
                  ),
                  if (_mensagemErro.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(_mensagemErro, style: const TextStyle(color: Colors.red, fontSize: 12)),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B365D), minimumSize: const Size.fromHeight(45)),
                    onPressed: _fazerLogin,
                    child: const Text('Entrar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdminDashboardScreen extends StatefulWidget {
  final String usuarioLogado;
  const AdminDashboardScreen({super.key, required this.usuarioLogado});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final TextEditingController _novaSenhaController = TextEditingController();
  final TextEditingController _novoAdminUserCtrl = TextEditingController();
  final TextEditingController _novoAdminPassCtrl = TextEditingController();

  void _alterarSenha() {
    if (_novaSenhaController.text.isNotEmpty) {
      setState(() {
        for (var admin in AppDataStorage.administradores) {
          if (admin['usuario'] == widget.usuarioLogado) {
            admin['senha'] = _novaSenhaController.text.trim();
          }
        }
      });
      _novaSenhaController.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Senha alterada com sucesso!')));
    }
  }

  void _cadastrarNovoAdmin() {
    String novoUser = _novoAdminUserCtrl.text.trim();
    String novaPass = _novoAdminPassCtrl.text.trim();

    if (novoUser.isNotEmpty && novaPass.isNotEmpty) {
      bool existe = AppDataStorage.administradores.any((a) => a['usuario'] == novoUser);
      if (existe) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Este usuário já existe!')));
        return;
      }

      setState(() {
        AppDataStorage.administradores.add({'usuario': novoUser, 'senha': novaPass});
      });
      _novoAdminUserCtrl.clear();
      _novoAdminPassCtrl.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Novo administrador cadastrado com sucesso!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMaster = widget.usuarioLogado == 'administrador';

    return Scaffold(
      appBar: customAppBar(title: 'PAINEL DO ADMINISTRADOR', context: context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bem-vindo, ${widget.usuarioLogado}!', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B365D))),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700),
                  onPressed: () {
                    AppDataStorage.isAdminLogado = false;
                    AppDataStorage.usuarioLogadoAtual = '';
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.logout, color: Colors.white, size: 16),
                  label: const Text('Sair', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Alterar Minha Senha', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _novaSenhaController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Nova Senha', border: OutlineInputBorder(), isDense: true),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B365D)),
                      onPressed: _alterarSenha,
                      child: const Text('Salvar Nova Senha', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (isMaster) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Cadastrar Novo Administrador', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _novoAdminUserCtrl,
                        decoration: const InputDecoration(labelText: 'Nome do Novo Administrador', border: OutlineInputBorder(), isDense: true),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _novoAdminPassCtrl,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'Senha do Novo Administrador', border: OutlineInputBorder(), isDense: true),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B365D)),
                        onPressed: _cadastrarNovoAdmin,
                        child: const Text('Cadastrar Administrador', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Administradores Cadastrados:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1B365D))),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppDataStorage.administradores.length,
                itemBuilder: (context, index) {
                  final admin = AppDataStorage.administradores[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Color(0xFF1B365D)),
                      title: Text(admin['usuario']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Senha: ${admin['senha']}'),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class TerritoriosScreen extends StatelessWidget {
  const TerritoriosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'TERRITÓRIOS', context: context),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: MiniCalendarWidget(onDateChanged: () {})),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: AppDataStorage.territorios.length,
              itemBuilder: (context, index) {
                final item = AppDataStorage.territorios[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheTerritorioScreen(territorioIndex: index))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(color: const Color(0xFF1B365D), borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Text(item['codigo'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(width: 16),
                          Expanded(child: Text(item['nome'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))),
                          const Icon(Icons.chevron_right, color: Colors.white70),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetalheTerritorioScreen extends StatefulWidget {
  final int territorioIndex;
  const DetalheTerritorioScreen({super.key, required this.territorioIndex});

  @override
  State<DetalheTerritorioScreen> createState() => _DetalheTerritorioScreenState();
}

class _DetalheTerritorioScreenState extends State<DetalheTerritorioScreen> {
  late Map<String, dynamic> territorio;
  String? _imagemPath;
  final TextEditingController _urlController = TextEditingController();
  late List<List<String>> _gradeDirigenteData;
  late List<List<int>> _quadrasData;

  @override
  void initState() {
    super.initState();
    territorio = AppDataStorage.territorios[widget.territorioIndex];
    _imagemPath = territorio['imagem'];
    _gradeDirigenteData = territorio['gradeDirigente'];
    _quadrasData = territorio['quadras'];
  }

  void _mostrarDialogoInserirUrl() {
    if (!AppDataStorage.isAdminLogado) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apenas administradores podem alterar a foto do mapa!')));
      return;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Foto do Mapa'),
          content: TextField(
            controller: _urlController,
            decoration: const InputDecoration(labelText: 'Cole o link (URL) da imagem do mapa', hintText: 'https://exemplo.com/mapa.jpg'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
            ElevatedButton(
              onPressed: () {
                if (_urlController.text.isNotEmpty) {
                  setState(() {
                    _imagemPath = _urlController.text;
                    territorio['imagem'] = _imagemPath;
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const headersDirigente = ['DIRIGENTE', 'PUBLI', 'DATA', 'DIRIGENTE', 'PUBLI', 'DATA', 'DATA INICIAL', 'DATA FINAL'];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1B365D),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('${territorio['codigo']} - ${territorio['nome']}' + (AppDataStorage.isAdminLogado ? " [Admin]" : ""), style: const TextStyle(color: Colors.white, fontSize: 16)),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.map), text: 'Mapa'),
              Tab(icon: Icon(Icons.grid_on), text: 'Dirigente'),
              Tab(icon: Icon(Icons.table_chart), text: 'Quadras Trab.'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.all(6.0), child: MiniCalendarWidget(onDateChanged: () => setState(() {}))),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: _imagemPath == null
                                  ? const Center(child: Text('Nenhum mapa cadastrado.', style: TextStyle(color: Colors.grey)))
                                  : InteractiveViewer(child: Image.network(_imagemPath!, fit: BoxFit.contain)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _mostrarDialogoInserirUrl,
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B365D), foregroundColor: Colors.white),
                          icon: const Icon(Icons.add_a_photo),
                          label: Text(_imagemPath == null ? 'Adicionar Foto do Mapa' : 'Alterar Foto do Mapa'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Table(
                            border: TableBorder.all(color: Colors.grey.shade400, width: 1),
                            defaultColumnWidth: const FixedColumnWidth(110),
                            children: [
                              TableRow(
                                decoration: const BoxDecoration(color: Color(0xFF1B365D)),
                                children: headersDirigente.map((title) => Container(padding: const EdgeInsets.all(8), alignment: Alignment.center, child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center))).toList(),
                              ),
                              ...List.generate(10, (rowIndex) {
                                return TableRow(
                                  children: List.generate(8, (colIndex) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        initialValue: _gradeDirigenteData[rowIndex][colIndex],
                                        onChanged: (val) => _gradeDirigenteData[rowIndex][colIndex] = val,
                                        decoration: const InputDecoration(border: InputBorder.none, isDense: true, hintText: '-'),
                                        style: const TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(10, (rowIndex) {
                                return Row(
                                  children: List.generate(territorio['colunas'], (colIndex) {
                                    final estado = _quadrasData[rowIndex][colIndex];
                                    Color corFundo = Colors.white;
                                    if (estado == 1) corFundo = Colors.amber.shade300;
                                    if (estado == 2) corFundo = Colors.green.shade400;

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _quadrasData[rowIndex][colIndex] = (estado + 1) % 3;
                                          AppDataStorage.verificarProgressoTerritorio(widget.territorioIndex);
                                        });
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 40,
                                        decoration: BoxDecoration(color: corFundo, border: Border.all(color: Colors.grey.shade400, width: 0.5)),
                                      ),
                                    );
                                  }),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ServicoDeCampoScreen extends StatefulWidget {
  const ServicoDeCampoScreen({super.key});

  @override
  State<ServicoDeCampoScreen> createState() => _ServicoDeCampoScreenState();
}

class _ServicoDeCampoScreenState extends State<ServicoDeCampoScreen> {
  final List<String> _meses = [
    'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
    'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
  ];

  late List<List<TextEditingController>> _controllers;
  int? _ultimoMesCarregado;

  @override
  void initState() {
    super.initState();
    _inicializarTabelaCompleta();
  }

  Future<void> _inicializarTabelaCompleta() async {
    _ultimoMesCarregado = AppDataStorage.dataSelecionadaGlobal.month - 1;
    _gerarControladores();
    await _carregarDadosSalvos();
  }

  void _gerarControladores() {
    int indiceMesAtual = AppDataStorage.dataSelecionadaGlobal.month - 1;
    int contadorSegSex = indiceMesAtual * 5;
    int contadorSab = indiceMesAtual * 3;
    int contadorDom = indiceMesAtual * 3;

    _controllers = List.generate(32, (rowIndex) {
      return List.generate(5, (colIndex) {
        if (rowIndex == 0) {
          const headers = ['Mês', 'Semana', 'Local', 'Horário', 'Dirigente'];
          return TextEditingController(text: headers[colIndex]);
        } else {
          if (colIndex == 0) return TextEditingController(text: _meses[indiceMesAtual]);
          final diasSemana = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
          final String diaSemanaStr = diasSemana[(rowIndex - 1) % 7];

          if (colIndex == 1) return TextEditingController(text: diaSemanaStr);
          if (colIndex == 3) return TextEditingController(text: '08:30');
          
          // INTEGRAÇÃO COM A ABA DIRIGENTE (Coluna 4)
          if (colIndex == 4) {
            String irmao = '';
            try {
              irmao = (diaSemanaStr == 'Sáb')
                  ? AppDataStorage.nomesSabado[contadorSab++ % AppDataStorage.nomesSabado.length]
                  : (diaSemanaStr == 'Dom')
                      ? AppDataStorage.nomesDomingo[contadorDom++ % AppDataStorage.nomesDomingo.length]
                      : AppDataStorage.nomesSegundaASexta[contadorSegSex++ % AppDataStorage.nomesSegundaASexta.length];
            } catch (e) {
              irmao = 'Dirigente';
            }
            return TextEditingController(text: irmao);
          }
          
          return TextEditingController(text: '');
        }
      });
    });
  }

  String get _chaveSharedPreferences => 'servico_campo_mes_${AppDataStorage.dataSelecionadaGlobal.month}';

  // Função para salvar a coluna Local e os demais campos alterados
  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    
    List<Map<String, String>> dadosParaSalvar = [];
    for (int i = 1; i < _controllers.length; i++) {
      dadosParaSalvar.add({
        'local': _controllers[i][2].text, // Salva o que foi digitado no Local
        'horario': _controllers[i][3].text,
        'dirigente': _controllers[i][4].text,
      });
    }

    await prefs.setString(_chaveSharedPreferences, jsonEncode(dadosParaSalvar));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dados do Serviço de Campo salvos com sucesso!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // Carrega os dados salvos (garantindo que o Local digitado volte para a tela)
  Future<void> _carregarDadosSalvos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? dadosString = prefs.getString(_chaveSharedPreferences);
    
    if (dadosString != null && mounted) {
      final List decoded = jsonDecode(dadosString);
      setState(() {
        for (int i = 0; i < decoded.length && (i + 1) < _controllers.length; i++) {
          if (decoded[i]['local'] != null && decoded[i]['local'].isNotEmpty) {
            _controllers[i + 1][2].text = decoded[i]['local'];
          }
          if (decoded[i]['horario'] != null && decoded[i]['horario'].isNotEmpty) {
            _controllers[i + 1][3].text = decoded[i]['horario'];
          }
          // Se quiser que o dirigente salvo tenha prioridade sobre o automático, descomente a linha abaixo:
          // if (decoded[i]['dirigente'] != null && decoded[i]['dirigente'].isNotEmpty) {
          //   _controllers[i + 1][4].text = decoded[i]['dirigente'];
          // }
        }
      });
    }
  }

  @override
  void dispose() {
    for (var row in _controllers) {
      for (var controller in row) controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int indiceMesAtual = AppDataStorage.dataSelecionadaGlobal.month - 1;

    if (_ultimoMesCarregado != indiceMesAtual) {
      _ultimoMesCarregado = indiceMesAtual;
      _gerarControladores();
      _carregarDadosSalvos();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SERVIÇO DE CAMPO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1B365D),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: _salvarDados,
            tooltip: 'Salvar Alterações',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MiniCalendarWidget(onDateChanged: () => setState(() {})),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_month, size: 18, color: Color(0xFF1B365D)),
                const SizedBox(width: 8),
                Text(
                  'Mês Ativo: ${_meses[indiceMesAtual]} / ${AppDataStorage.dataSelecionadaGlobal.year}',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1B365D)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(color: Colors.grey.shade400, width: 1),
                      columnWidths: const {
                        0: FixedColumnWidth(110),
                        1: FixedColumnWidth(90),
                        2: FixedColumnWidth(140),
                        3: FixedColumnWidth(90),
                        4: FixedColumnWidth(160),
                      },
                      children: List.generate(32, (rowIndex) {
                        final bool isHeader = rowIndex == 0;
                        return TableRow(
                          decoration: BoxDecoration(color: isHeader ? const Color(0xFF1B365D) : Colors.white),
                          children: List.generate(5, (colIndex) {
                            return Container(
                              padding: const EdgeInsets.all(6),
                              alignment: Alignment.center,
                              child: isHeader
                                  ? Text(
                                      _controllers[rowIndex][colIndex].text,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  : TextField(
                                      controller: _controllers[rowIndex][colIndex],
                                      readOnly: !AppDataStorage.isAdminLogado,
                                      decoration: const InputDecoration(border: InputBorder.none, isDense: true),
                                      style: TextStyle(fontSize: 13, color: AppDataStorage.isAdminLogado ? Colors.black : Colors.black87),
                                      textAlign: TextAlign.center,
                                    ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DirigenteScreen extends StatefulWidget {
  const DirigenteScreen({super.key});

  @override
  State<DirigenteScreen> createState() => _DirigenteScreenState();
}

class _DirigenteScreenState extends State<DirigenteScreen> {
  late final List<List<TextEditingController>> _dirigenteControllers;

  @override
  void initState() {
    super.initState();
    _dirigenteControllers = List.generate(20, (rowIndex) {
      return List.generate(3, (colIndex) {
        if (rowIndex == 0) {
          const headers = ['segunda a sexta', 'sábado', 'domingo'];
          return TextEditingController(text: headers[colIndex]);
        } else {
          final int idx = rowIndex - 1;
          if (colIndex == 0) return TextEditingController(text: AppDataStorage.nomesSegundaASexta[idx]);
          if (colIndex == 1) return TextEditingController(text: AppDataStorage.nomesSabado[idx]);
          return TextEditingController(text: AppDataStorage.nomesDomingo[idx]);
        }
      });
    });
  }

  @override
  void dispose() {
    for (var row in _dirigenteControllers) {
      for (var controller in row) controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'DIRIGENTE', context: context),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: MiniCalendarWidget(onDateChanged: () => setState(() {}))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(color: Colors.grey.shade400, width: 1),
                      columnWidths: const {
                        0: FixedColumnWidth(160),
                        1: FixedColumnWidth(140),
                        2: FixedColumnWidth(140),
                      },
                      children: List.generate(20, (rowIndex) {
                        final bool isHeader = rowIndex == 0;
                        return TableRow(
                          decoration: BoxDecoration(color: isHeader ? const Color(0xFF1B365D) : Colors.white),
                          children: List.generate(3, (colIndex) {
                            if (isHeader) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Text(
                                  _dirigenteControllers[rowIndex][colIndex].text,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: _dirigenteControllers[rowIndex][colIndex],
                                  onChanged: (value) {
                                    final int idx = rowIndex - 1;
                                    if (colIndex == 0) AppDataStorage.nomesSegundaASexta[idx] = value;
                                    else if (colIndex == 1) AppDataStorage.nomesSabado[idx] = value;
                                    else if (colIndex == 2) AppDataStorage.nomesDomingo[idx] = value;
                                  },
                                  decoration: const InputDecoration(border: InputBorder.none, isDense: true, hintText: '-'),
                                  style: const TextStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          }),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class S13Screen extends StatefulWidget {
  const S13Screen({super.key});

  @override
  State<S13Screen> createState() => _S13ScreenState();
}

class _S13ScreenState extends State<S13Screen> {
  final TextEditingController _anoServicoController = TextEditingController(text: '2026 / 2027');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'REGISTRO S.13', context: context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MiniCalendarWidget(onDateChanged: () => setState(() {})),
            const SizedBox(height: 10),
            const Text('REGISTRO DE DESIGNAÇÃO DE TERRITÓRIO', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1B365D))),
            const SizedBox(height: 6),
            Row(
              children: [
                const Text('Ano de Serviço: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _anoServicoController,
                    readOnly: !AppDataStorage.isAdminLogado,
                    decoration: const InputDecoration(isDense: true, border: UnderlineInputBorder()),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Table(
                    border: TableBorder.all(color: Colors.black, width: 1.2),
                    columnWidths: const {
                      0: FixedColumnWidth(65),
                      1: FixedColumnWidth(95),
                      2: FixedColumnWidth(85),
                      3: FixedColumnWidth(85),
                      4: FixedColumnWidth(85),
                      5: FixedColumnWidth(85),
                      6: FixedColumnWidth(85),
                      7: FixedColumnWidth(85),
                      8: FixedColumnWidth(85),
                      9: FixedColumnWidth(85),
                    },
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(color: Color(0xFF1B365D)),
                        children: [
                          Container(padding: const EdgeInsets.all(8), alignment: Alignment.center, child: const Text('Terr.\nn.°', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center)),
                          Container(padding: const EdgeInsets.all(8), alignment: Alignment.center, child: const Text('Última data\nconcluída*', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center)),
                          ...List.generate(8, (_) => Container(padding: const EdgeInsets.all(8), alignment: Alignment.center, child: const Text('Designado para', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center))),
                        ],
                      ),
                      TableRow(
                        decoration: const BoxDecoration(color: Color(0xFF1B365D)),
                        children: [
                          const SizedBox.shrink(),
                          const SizedBox.shrink(),
                          ...List.generate(8, (i) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                                alignment: Alignment.center,
                                child: Text(
                                  (i % 2 == 0) ? 'Data da\ndesignação' : 'Data da\nconclusão',
                                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ],
                      ),
                      ...List.generate(15, (territorioIndex) {
                        return TableRow(
                          decoration: BoxDecoration(color: territorioIndex.isEven ? Colors.white : Colors.grey.shade50),
                          children: List.generate(10, (colIndex) {
                            return Column(
                              children: [
                                Container(
                                  height: 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade400, width: 0.8))),
                                  child: Text(
                                    AppDataStorage.s13Dados[territorioIndex][0][colIndex],
                                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppDataStorage.s13Dados[territorioIndex][1][colIndex],
                                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          }),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventosScreen extends StatefulWidget {
  const EventosScreen({super.key});

  @override
  State<EventosScreen> createState() => _EventosScreenState();
}

class _EventosScreenState extends State<EventosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'EVENTOS', context: context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MiniCalendarWidget(onDateChanged: () => setState(() {})),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(color: Colors.grey.shade400, width: 1),
                      columnWidths: const {
                        0: FixedColumnWidth(40),
                        1: FixedColumnWidth(48),
                        2: FixedColumnWidth(130),
                        3: FixedColumnWidth(115),
                        4: FixedColumnWidth(40),
                        5: FixedColumnWidth(48),
                        6: FixedColumnWidth(130),
                        7: FixedColumnWidth(115),
                        8: FixedColumnWidth(40),
                        9: FixedColumnWidth(48),
                        10: FixedColumnWidth(130),
                        11: FixedColumnWidth(115),
                        12: FixedColumnWidth(40),
                        13: FixedColumnWidth(48),
                        14: FixedColumnWidth(130),
                        15: FixedColumnWidth(115),
                        16: FixedColumnWidth(40),
                        17: FixedColumnWidth(48),
                        18: FixedColumnWidth(130),
                        19: FixedColumnWidth(115),
                      },
                      children: List.generate(15, (rowIndex) {
                        final bool isHeader = rowIndex == 0;
                        return TableRow(
                          decoration: BoxDecoration(color: isHeader ? const Color(0xFF1B365D) : Colors.white),
                          children: List.generate(20, (colIndex) {
                            int bloco = colIndex % 4;

                            if (isHeader) {
                              String textoHeader = '';
                              if (bloco == 0) textoHeader = 'N*';
                              if (bloco == 1) textoHeader = 'PG';
                              if (bloco == 2) textoHeader = 'NOME';
                              if (bloco == 3) textoHeader = 'DIAS\n(Sex | Sáb | Dom)';

                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                                alignment: Alignment.center,
                                child: Text(
                                  textoHeader,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }

                            if (bloco == 0) {
                              return Container(
                                padding: const EdgeInsets.all(2),
                                alignment: Alignment.center,
                                child: Text(
                                  AppDataStorage.eventosTexto[rowIndex][colIndex],
                                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }

                            if (bloco == 1) {
                              bool isPago = AppDataStorage.eventosPgStatus[rowIndex][colIndex];
                              return GestureDetector(
                                onTap: () {
                                  if (!AppDataStorage.isAdminLogado) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apenas administradores podem alterar o status de PG!')));
                                    return;
                                  }
                                  setState(() {
                                    AppDataStorage.eventosPgStatus[rowIndex][colIndex] = !isPago;
                                  });
                                },
                                child: Container(
                                  height: 28,
                                  margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isPago ? const Color(0xFF1B365D) : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    isPago ? 'PG' : '-',
                                    style: TextStyle(
                                      color: isPago ? Colors.white : Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              );
                            }

                            if (bloco == 2) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  initialValue: AppDataStorage.eventosTexto[rowIndex][colIndex],
                                  readOnly: !AppDataStorage.isAdminLogado,
                                  onChanged: (val) {
                                    if (AppDataStorage.isAdminLogado) {
                                      AppDataStorage.eventosTexto[rowIndex][colIndex] = val;
                                    }
                                  },
                                  decoration: const InputDecoration(border: InputBorder.none, isDense: true, hintText: '-'),
                                  style: const TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }

                            List<String> rotulosDias = ['Sex', 'Sáb', 'Dom'];
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(3, (diaIndex) {
                                  bool ativo = AppDataStorage.eventosDiasStatus[rowIndex][colIndex][diaIndex];
                                  return GestureDetector(
                                    onTap: () {
                                      if (!AppDataStorage.isAdminLogado) {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apenas administradores podem marcar os dias!')));
                                        return;
                                      }
                                      setState(() {
                                        AppDataStorage.eventosDiasStatus[rowIndex][colIndex][diaIndex] = !ativo;
                                      });
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: ativo ? const Color(0xFF1B365D) : Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        rotulosDias[diaIndex],
                                        style: TextStyle(
                                          color: ativo ? Colors.white : Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9.5,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const DashboardCard({super.key, required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap ?? () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: const Color(0xFF1B365D)),
              const SizedBox(height: 8),
              Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }
}
