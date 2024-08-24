import 'package:flutter/material.dart';

import '../../../Controllers/register_user_controller.dart';
import '../../utils/widgets/custom_text_field.dart';
import '../home/lending_screen.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({Key? key}) : super(key: key);

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final RegisterUserController _controller = RegisterUserController();
  var _result;

  @override
  void initState() {
    super.initState();
    _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.pngkey.com/png/full/787-7877336_rand-romas-circular-headshot-gentleman.png',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'User Details',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: _controller.nameController,
            labelText: 'Enter name',
            hintText: 'name',
            icon: Icons.person,
          ),
          const SizedBox(height: 30),
          CustomTextField(
              controller: _controller.emailController,
              labelText: 'Enter email',
              hintText: '',
              icon: Icons.email),
          const SizedBox(height: 30),
          CustomTextField(
            controller: _controller.addressController,
            labelText: 'Enter Address',
            hintText: 'address',
            icon: Icons.add_reaction_sharp,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: _controller.ageController,
            labelText: 'Enter age',
            hintText: 'age',
            icon: Icons.add,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: _controller.genderController,
            labelText: 'Gender',
            hintText: 'gender',
            icon: Icons.lens_outlined,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Select the correct option'),
                RadioListTile(
                  title: const Text('Male'),
                  value: 1,
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Female'),
                  value: 2,
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Other'),
                  value: 3,
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  },
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.storeUserData();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ButtonNavigtionPage(),
                          ),
                        );
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
