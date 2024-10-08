import 'package:booking_home_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int? _age;
  @override
  void initState() {
    _emailController.text = widget.userModel?.email ?? '';
    _phoneController.text = widget.userModel?.phone ?? '';
    _age = widget.userModel?.age ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
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
                      const CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/57899051?v=4'),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xfffcd1a8),
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
                widget.userModel?.name ?? '',
                style: const TextStyle(
                  fontSize: 25,
                  color: Color(0xfffcd1a8),
                ),
              )),
              const SizedBox(height: 8),
              const Text('Your Email'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(color: Color(0xffABABAB)),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xffABABAB),
                  ),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffABABAB)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Phone Number'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _phoneController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your phone Number',
                  hintStyle: const TextStyle(color: Color(0xffABABAB)),
                  prefixIcon: const Icon(
                    Icons.phone_android_rounded,
                    color: Color(0xffABABAB),
                  ),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffABABAB)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Age'),
              const SizedBox(height: 8),
              DropdownButtonFormField(
                menuMaxHeight: 300,
                value: _age,
                items: List.generate(100, (index) => index + 1)
                    .map((age) => DropdownMenuItem(
                          value: age,
                          child: Text(
                            age.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select your age',
                  hintStyle: const TextStyle(color: Color(0xffABABAB)),
                  prefixIcon: const Icon(
                    Icons.cake,
                    color: Color(0xffABABAB),
                  ),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffABABAB)),
                  ),
                ),
                dropdownColor: const Color(0xff333333),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text('Website'),
              const SizedBox(height: 8),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: widget.userModel?.website ?? 'Enter your website',
                  hintStyle: const TextStyle(color: Color(0xffABABAB)),
                  prefixIcon: const Icon(
                    Icons.web,
                    color: Color(0xffABABAB),
                  ),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffABABAB)),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffcd1a8),
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
