import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedSizeIndex = 2; // Default selected size index
  int _quantity = 1;

  void _onSizeSelected(int index) {
    setState(() {
      _selectedSizeIndex = index;
    });
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image Section
              const ProductImageSection(),

              // Product Details Section
              ProductDetailsSection(
                selectedSizeIndex: _selectedSizeIndex,
                onSizeSelected: _onSizeSelected,
                quantity: _quantity,
                incrementQuantity: _incrementQuantity,
                decrementQuantity: _decrementQuantity,
              ),

              // Description Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair.",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),

              // Bottom Action Section
              const BottomActionSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Image.asset(
            'assets/images/new_arrivel.jpg',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            child: const Icon(Icons.favorite_border, color: Colors.white),
          ),
        ),
        const Positioned(
          bottom: 16,
          left: 16,
          child: DotsIndicator(),
        ),
      ],
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  final int selectedSizeIndex;
  final ValueChanged<int> onSizeSelected;
  final int quantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const ProductDetailsSection({
    super.key,
    required this.selectedSizeIndex,
    required this.onSizeSelected,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Axel Arigato",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Clean 90 Triple Sneakers",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
              const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
              const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
              const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
              const Icon(Icons.star_half, color: Colors.orangeAccent, size: 20),
              const SizedBox(width: 8),
              Text("(270 Review)", style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                "Available in stock",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: decrementQuantity,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.remove, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("$quantity", style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: incrementQuantity,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text("Size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizeSelector(
            selectedIndex: selectedSizeIndex,
            onSelected: onSizeSelected,
          ),
        ],
      ),
    );
  }
}

class SizeSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SizeSelector({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: List.generate(5, (index) {
        bool isSelected = index == selectedIndex;
        return ChoiceChip(
          label: Text(
            '${39 + index * 0.5}',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          selected: isSelected,
          onSelected: (selected) {
            onSelected(index);
          },
          selectedColor: Colors.black, // Color when selected
          backgroundColor:
              Colors.grey[200], // Background color when not selected
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12), // Rounded corners for chips
          ),
        );
      }),
    );
  }
}

class BottomActionSection extends StatelessWidget {
  const BottomActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text(
            "\$245.00",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Add to cart",
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 5,
          backgroundColor: Colors.black,
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.grey[400],
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.grey[400],
        ),
      ],
    );
  }
}
