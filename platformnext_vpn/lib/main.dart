import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Next - Unlimited VPN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isConnected = false;
  String _currentServer = 'Auto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Platform Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      // TODO: Navigate to settings
                    },
                  ),
                ],
              ),
            ),
            
            // Connection Status
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _isConnected ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: _isConnected ? Colors.green : Colors.red,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    _isConnected ? Icons.vpn_key : Icons.vpn_key_outlined,
                    color: _isConnected ? Colors.green : Colors.red,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isConnected ? 'Connected' : 'Disconnected',
                    style: TextStyle(
                      color: _isConnected ? Colors.green : Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Server: $_currentServer',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            // VPN Connection Button
            Container(
              margin: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isConnected = !_isConnected;
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isConnected ? Colors.red : Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: (_isConnected ? Colors.red : Colors.green).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    _isConnected ? Icons.stop : Icons.play_arrow,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
              ),
            ),
            
            // Server List
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Available Servers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: const [
                          _ServerItem(name: 'Auto', icon: Icons.auto_awesome),
                          _ServerItem(name: 'United States', icon: Icons.flag),
                          _ServerItem(name: 'United Kingdom', icon: Icons.flag),
                          _ServerItem(name: 'Germany', icon: Icons.flag),
                          _ServerItem(name: 'Japan', icon: Icons.flag),
                          _ServerItem(name: 'Singapore', icon: Icons.flag),
                          _ServerItem(name: 'Vietnam', icon: Icons.flag),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServerItem extends StatelessWidget {
  final String name;
  final IconData icon;

  const _ServerItem({
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white70,
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        onTap: () {
          // TODO: Handle server selection
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}