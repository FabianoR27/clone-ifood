import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SACOLA', style: TextStyle(fontSize: 14)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {}, 
            child: const Text('Limpar', style: TextStyle(color: Color(0xFFEA1D2C)))
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informações do Restaurante
            const Row(
              children: [
                CircleAvatar(backgroundColor: Colors.black, child: Text('AW', style: TextStyle(color: Colors.white, fontSize: 12))),
                SizedBox(width: 12),
                Text('Açaí do Will', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Adicionar mais itens', style: TextStyle(color: Color(0xFFEA1D2C), fontWeight: FontWeight.w500)),
            const Divider(height: 32),

            // Itens adicionados
            const Text('Itens adicionados', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60, height: 60,
                      decoration: BoxDecoration(color: Colors.brown[200], borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.icecream, color: Colors.brown),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Creme De Ovomaltine'),
                        SizedBox(height: 4),
                        Text('R\$ 16,00', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                // Contador de itens
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Icon(Icons.remove, color: Color(0xFFEA1D2C), size: 16)),
                      Text('2'),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Icon(Icons.add, color: Color(0xFFEA1D2C), size: 16)),
                    ],
                  ),
                )
              ],
            ),
            const Divider(height: 48),

            // Resumo de valores
            const Text('Resumo de valores', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildSummaryRow('Subtotal', 'R\$ 16,00'),
            _buildSummaryRow('Taxa de entrega', 'R\$ 6,00'),
            _buildSummaryRow('Taxa de serviço', 'R\$ 0,99'),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('R\$ 22,99', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
      
      // Bottom Bar Fixa
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -5))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total com a entrega', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text('R\$ 22,99 / 2 itens', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEA1D2C),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                  );
                },
                child: const Text('Continuar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value),
        ],
      ),
    );
  }
}