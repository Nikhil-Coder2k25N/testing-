import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class BankPage extends StatefulWidget {
  const BankPage({super.key});
  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {

  //my Logic
  Future<void> _saveBankDetails(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection("BankDetails")
          .add({
        "holderName": _holderNameController.text.trim(),
        "bankName": _bankNameController.text.trim(),
        "accountName": _accountNoController.text.trim(),
        "ifscCode": _ifscController.text.trim(),
        "upiId": _upiController.text.trim(),
        "createdAt": FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bank Details Saved Successfully")),
      );

      _formKey.currentState!.reset();

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _holderNameController =
  TextEditingController();
  final TextEditingController _bankNameController =
  TextEditingController();
  final TextEditingController _accountNoController =
  TextEditingController();
  final TextEditingController _ifscController =
  TextEditingController();
  final TextEditingController _upiController =
  TextEditingController();

  @override
  void dispose() {
    _holderNameController.dispose();
    _bankNameController.dispose();
    _accountNoController.dispose();
    _ifscController.dispose();
    _upiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Details"),
      ),
      body: SingleChildScrollView(
        child: _buildBankDetailsSection(
          context,
          Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildBankDetailsSection(
      BuildContext context, Color primaryColor) {
    final theme = Theme.of(context);

    return CustomCard(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance, color: primaryColor),
                const SizedBox(width: 12),
                Text(
                  "Bank Account Details",
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildTextField(
                _holderNameController, "Account Holder Name"),
            const SizedBox(height: 16),
            _buildTextField(_bankNameController, "Bank Name"),
            const SizedBox(height: 16),
            _buildTextField(
                _accountNoController, "Account Number"),
            const SizedBox(height: 16),
            _buildTextField(_ifscController, "IFSC Code"),
            const SizedBox(height: 16),
            _buildTextField(_upiController, "UPI ID (Optional)",
                isRequired: false),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveBankDetails(context);
                  }
                },
                child: const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label, {
        bool isRequired = true,
      }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (!isRequired) return null;
        if (value == null || value.isEmpty) {
          return "Required";
        }
        return null;
      },
    );
  }
}


class CustomCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const CustomCard({
    super.key,
    required this.child,
    this.elevation = 2,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
