import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Importação para simular navegação

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Estado para o BottomNavigationBar

  // --- Início da Função de Navegação ---
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) { // Simula ir para o Carrinho ao clicar no item 'Pedidos'
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CartScreen()),
      );
    }
  }
  // --- Fim da Função de Navegação ---

  @override
  Widget build(BuildContext context) {
    // Definindo as cores principais do tema do iFood
    const Color ifoodRed = Color(0xFFEA1D2C);
    const Color ifoodPurple = Color(0xFF8A14EB);
    const Color ifoodPurpleLight = Color(0xFFF2EFFF);
    const Color ifoodGray = Color(0xFF999999);

    return Scaffold(
      backgroundColor: Colors.white,
      // --- Início da AppBar Customizada ---
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Altura maior para o header
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Início da Seção de Endereço
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Boa noite, Fabiano', style: TextStyle(color: ifoodGray, fontSize: 12)),
                    Row(
                      children: [
                        Text('R. Santa Pedrina, 37', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Icon(Icons.keyboard_arrow_down, size: 18, color: ifoodRed),
                      ],
                    ),
                  ],
                ),
                // Fim da Seção de Endereço

                // Início da Seção de Ícones (Clube e Notificações)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: ifoodPurpleLight, shape: BoxShape.circle),
                      child: const Icon(Icons.diamond, color: ifoodPurple, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Stack(
                      children: [
                        const Icon(Icons.notifications_none, color: Colors.black, size: 28),
                        Positioned(
                          right: 0, top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(color: ifoodRed, shape: BoxShape.circle),
                            constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                            child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // Fim da Seção de Ícones
              ],
            ),
          ),
        ),
      ),
      // --- Fim da AppBar Customizada ---

      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Início do Grid de Categorias Primárias ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 16, // Espaçamento horizontal entre itens
                runSpacing: 16, // Espaçamento vertical entre linhas
                alignment: WrapAlignment.center,
                children: [
                  // Usando Emojis para fidelidade visual rápida sem assets
                  _buildPrimaryCategoryItem('🍔', 'Restaurantes'),
                  _buildPrimaryCategoryItem('🛒', 'Mercados'),
                  _buildPrimaryCategoryItem('💊', 'Farmácias'),
                  _buildPrimaryCategoryItem('🥤', 'Bebidas'),
                  _buildPrimaryCategoryItem('🚗', 'Corridas', isNew: true),
                  _buildPrimaryCategoryItem('🎁', 'Promoções', isNew: true),
                  _buildPrimaryCategoryItem('🥘', 'Gourmet'),
                  _buildPrimaryCategoryItem('🎯', 'Missões', isNew: true),
                  _buildPrimaryCategoryItem(Icons.grid_view_rounded, 'Ver mais'),
                ],
              ),
            ),
            // --- Fim do Grid de Categorias Primárias ---

            const SizedBox(height: 24),

            // --- Início do Carrossel de Banners Principal ---
            SizedBox(
              height: 180,
              child: PageView(
                controller: PageController(viewportFraction: 0.9), // Mostra um pouco do próximo
                children: [
                  _buildMainBanner(Colors.redAccent, 'Tudo a partir de R\$ 0,90', subText: 'Pede iFood já!'),
                  _buildMainBanner(Colors.orangeAccent, 'entrega grátis'),
                  _buildMainBanner(Colors.pinkAccent, 'cupom R\$ 30'),
                ],
              ),
            ),
            // --- Fim do Carrossel de Banners Principal ---

            const SizedBox(height: 24),

            // --- Início do Carrossel de Ofertas Verticais ---
            SizedBox(
              height: 160,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                children: [
                  _buildVerticalOffer(const Color(0xFFF1656A), 'entrega grátis aqui'),
                  _buildVerticalOffer(const Color(0xFFF1656A), 'vem que aqui tem promoções'),
                  _buildVerticalOffer(const Color(0xFFF1656A), 'cupom até R\$ 30'),
                  _buildVerticalOffer(const Color(0xFFF1656A), 'famosos com descontão'),
                ],
              ),
            ),
            // --- Fim do Carrossel de Ofertas Verticais ---

            const SizedBox(height: 24),

            // --- Início do Grid de Categorias de Comida (com imagens) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFoodCategoryItem('🍔', 'Lanches'),
                  _buildFoodCategoryItem('🍕', 'Pizza'),
                  _buildFoodCategoryItem('🥣', 'Açaí'),
                  _buildFoodCategoryItem('🥘', 'Promoções'),
                  _buildFoodCategoryItem('🍛', 'Brasileira'),
                ],
              ),
            ),
            // --- Fim do Grid de Categorias de Comida ---

            const SizedBox(height: 24),

            // --- Início do Card de Recompensas (Fiel ao image_3.png) ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle_outlined, color: Colors.amber, size: 16),
                      const SizedBox(width: 8),
                      const Text('Ganhe descontos ao fazer pedidos', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Compre a partir de R\$0,99', style: TextStyle(color: ifoodGray, fontSize: 12)),
                  const SizedBox(height: 12),
                  
                  // Início do Rastreador de Progresso (Simulando o print)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildProgressStep('🍔', isCurrent: true),
                      const Expanded(child: Divider(color: Color(0xFFCCCCCC), thickness: 1)),
                      _buildProgressStep(Icons.lock_outline, isLocked: true),
                      const Expanded(child: Divider(color: Color(0xFFCCCCCC), thickness: 1)),
                      _buildProgressStep(Icons.lock_outline, isLocked: true),
                      const Expanded(child: Divider(color: Color(0xFFCCCCCC), thickness: 1)),
                      _buildProgressStep(Icons.keyboard_arrow_down, isLocked: true, isLast: true),
                    ],
                  ),
                  // Fim do Rastreador de Progresso

                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.access_time, color: ifoodGray, size: 14),
                      SizedBox(width: 4),
                      Text('20 dias para resgatar', style: TextStyle(color: ifoodGray, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            // --- Fim do Card de Recompensas ---

            const SizedBox(height: 120), // Espaço para não ficar atrás da bottom bar
          ],
        ),
      ),
      
      // --- Início da Bottom Navigation Bar ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: ifoodGray,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Busca'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), activeIcon: Icon(Icons.receipt_long), label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
      // --- Fim da Bottom Navigation Bar ---
    );
  }

  // --- INÍCIO DAS FUNÇÕES AUXILIARES DE WIDGETS ---

  // Constrói itens do grid de categorias principais
  Widget _buildPrimaryCategoryItem(dynamic iconOrText, String label, {bool isNew = false}) {
    Widget iconWidget;
    if (iconOrText is IconData) {
      iconWidget = Icon(iconOrText, color: Colors.black, size: 32);
    } else if (iconOrText is String) {
      iconWidget = Text(iconOrText, style: const TextStyle(fontSize: 32));
    } else {
      iconWidget = const SizedBox();
    }

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 70, height: 70,
              decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(16)),
              child: Center(child: iconWidget),
            ),
            if (isNew)
              Positioned(
                top: 0, left: 0, right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: const Color(0xFFEA1D2C), borderRadius: BorderRadius.circular(4)),
                    child: const Text('Novo', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.black)),
      ],
    );
  }

  // Constrói os banners principais (simulando imagem com container e texto)
  Widget _buildMainBanner(Color color, String text, {String subText = ''}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(subText.isNotEmpty)
            Text(subText, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1)),
        ],
      ),
    );
  }

  // Constrói carrossel de ofertas verticais
  Widget _buildVerticalOffer(Color color, String text) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🔥', style: TextStyle(fontSize: 24)),
          const Spacer(),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold), maxLines: 3, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  // Constrói itens do grid de comida com imagem (simulada por emoji)
  Widget _buildFoodCategoryItem(String emoji, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 40)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black)),
      ],
    );
  }

  // Constrói etapas do rastreador de progresso de recompensas
  Widget _buildProgressStep(dynamic content, {bool isCurrent = false, bool isLocked = false, bool isLast = false}) {
    Widget stepWidget;
    Color stepColor = isCurrent ? const Color(0xFFF9E8D8) : const Color(0xFFF2F2F2);
    
    if (content is String) {
      stepWidget = Text(content, style: const TextStyle(fontSize: 20));
    } else if (content is IconData) {
      stepWidget = Icon(content, color: isLocked ? const Color(0xFFCCCCCC) : const Color(0xFF999999), size: 20);
    } else {
      stepWidget = const SizedBox();
    }

    return Container(
      width: 36, height: 36,
      decoration: BoxDecoration(
        color: stepColor,
        shape: BoxShape.circle,
        border: isLast ? Border.all(color: const Color(0xFFCCCCCC)) : null,
      ),
      child: Center(child: stepWidget),
    );
  }

  // --- FIM DAS FUNÇÕES AUXILIARES DE WIDGETS ---
}