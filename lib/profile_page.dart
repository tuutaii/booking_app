import 'package:booking_home_app/components/custom_text_field.dart';
import 'package:booking_home_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  int? _age;

  @override
  void initState() {
    super.initState();
    // Schedule state initialization after layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userModel = context.read<UserProvider>().user;
      if (userModel != null) {
        _emailController.text = userModel.email ?? '';
        _phoneController.text = userModel.phone ?? '';
        _websiteController.text = userModel.website ?? '';
        setState(() {
          _age = userModel.age;
          if (_age == 0) _age = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = context.watch<UserProvider>().user;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 110,
                  width: 110,
                  child: Stack(
                    children: [
                      const Hero(
                        tag: 'profile-avatar',
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/57899051?v=4',
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  userModel?.name ?? 'Guest User',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _emailController,
                label: 'Your Email',
                hint: 'Enter your email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                label: 'Phone Number',
                hint: 'Enter your phone Number',
                prefixIcon: Icons.phone_android_rounded,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              const Text('Age'),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                menuMaxHeight: 300,
                initialValue: _age,
                items: List.generate(100, (index) => index + 1)
                    .map(
                      (age) => DropdownMenuItem(
                        value: age,
                        child: Text(
                          age.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Select your age',
                  prefixIcon: Icon(Icons.cake),
                ),
                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _websiteController,
                label: 'Website',
                hint: 'Enter your website',
                prefixIcon: Icons.web,
                keyboardType: TextInputType.url,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
