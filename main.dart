import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() { 
  runApp( 
    ChangeNotifierProvider( 
      create: (_) => ThemeProvider(), child:BusSeatBookingApp(), 
    ), 
  );
}

class BusSeatBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      themeMode: themeProvider.themeMode,
      home:  LoginPage(),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.directions_bus_filled, size: 100, color: Colors.orange),
              SizedBox(height: 10),
              Text(
                'BusSeat Booking App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person, color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordMethodPage()),
                    );
                  },
                  child: Text('Forgot Password?', style: TextStyle(color: Colors.orange)),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  // Navigate to the main app or booking page
                },
                //navigate to the main app or booking page

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text('LOGIN', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text('Sign Up', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),

                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login as',style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusOwnerLoginPage()),
                      );
                    },
                    child: Text(
                      ' Bus owner',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class BusOwnerLoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<BusOwnerLoginPage> {
  final Map<String, String> existingUsers = {
    // Mock data for existing users
    "busowner1": "password123",
    "busowner2": "admin2024",
  };

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = '';

  void loginUser() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (existingUsers.containsKey(username) &&
        existingUsers[username] == password) {
      setState(() {
        errorMessage = ''; // Clear error message on success
      });
      // Navigate to a successful login page or dashboard
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('')),
      );
    } else {
      setState(() {
        errorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Operator'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Icon and Name
            Icon(Icons.directions_bus, size: 80, color: Colors.orange),
            SizedBox(height: 10),
            Text(
              "Bus Operator App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 30),

            // Username Field
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Password Field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Error Message
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              
             SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusownerForgotPasswordPage()),
                    );
                  },
                  child: Text('Forgot Password?', style: TextStyle(color: Colors.orange)),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BusownerHomeScreen()),
                  );
                  // Navigate to the main app or booking page
                },
                //navigate to the main app or booking page

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text('LOG IN', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
         
            
            
             
      
            SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>BusownerSignupPage()),
                      );
                    },
                    child: Text('Sign Up', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),

                  ),
                ],
              ),

            // Signup and Forgot Password Links
    
      ],
    ),
      ),
    );
  }
}

class BusownerHomeScreen extends StatefulWidget {
  @override
  _busownerHomeScreenState createState() => _busownerHomeScreenState();
}

class _busownerHomeScreenState extends State<BusownerHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        // Number of tabs
        child: Scaffold(


    body: TabBarView(
      children: [
        BusesListPage(),
        BookingListPage (),
        Notificationpage(),
        BusownerSettingpage(),
       
      ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white70,
        child: TabBar(

          tabs: [

            Tab(
              icon: Icon(Icons.train,color: Colors.orange,),
              text: 'Buses',

            ),
            Tab(
              icon: Icon(Icons.book,color: Colors.orange,),
              text: 'Bookingslist',
            ),
            Tab(
              icon: Icon(Icons.notifications,color: Colors.orange,),
              text: 'Notifications',
            ),
            Tab(
              icon: Icon(Icons.settings, color: Colors.orange,),
              text: 'Settings',
            ),

          ],
        ),
      ),
        ),
    );
  }
}

class BusownerSettingpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.orange,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.light
                  ? Icons.nightlight_round
                  : Icons.wb_sunny,
              color: Colors.black,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Information
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange,
                      child: Text(
                        'B',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Business Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Email',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Phone number',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.lock, color: Colors.orange),
              title: Text('Change password'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle change password action
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.orange),
              title: Text('Delete account'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle delete account action
              },
            ),

            Divider(),

            // App Info

            ListTile(
              leading: Icon(Icons.privacy_tip, color: Colors.orange),
              title: Text('Privacy policy'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle privacy policy action
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.orange),
              title: Text('Terms & conditions'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle terms and conditions action
              },
            ),

            ListTile(
              leading: Icon(Icons.info, color: Colors.orange),
              title: Text('About us'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle about us action
              },
            ),

            Divider(),

            // Logout Button
            ListTile(
              leading: Icon(Icons.logout, color: Colors.orange),
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                // Handle logout action
              },
            ),

          ],
        ),
      ),
    );
  }
}




class BusesListPage extends StatefulWidget {
  @override
  _BusesListPageState createState() => _BusesListPageState();
}

class _BusesListPageState extends State<BusesListPage> {
  final List<Map<String, dynamic>> _busList = [
    {
      'time': '8:00 AM - 5:00 PM',
      'name': 'Express Bus',
      'seats': 52,
      'price': 'LKR 1400',
      'type': 'AC',
    },
  ];

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _deleteBus(int index) {
    setState(() {
      _busList.removeAt(index);
    });
  }

  void _onBusTap(Map<String, dynamic> bus) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OwnerSeatManagement(), // Pass the bus details
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Buses List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // Journey Date Box
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Journey Date'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Icon(Icons.calendar_today, color: Colors.orange),
                  ],
                ),
              ),
            ),
          ),

          // List of buses
          Expanded(
            child: ListView.builder(
              itemCount: _busList.length,
              itemBuilder: (context, index) {
                final bus = _busList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: GestureDetector(
                    onTap: () => _onBusTap(bus), // Trigger action on tap
                    child: Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time: ${bus['time']}',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Bus Name: ${bus['name']}',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              'No of Seats: ${bus['seats']}',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              'Price: ${bus['price']}',
                              style: TextStyle(fontSize: 14, color: Colors.green),
                            ),
                            Text(
                              bus['type'],
                              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                          onSelected: (value) {
                            if (value == 'edit') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddBusPage()),
                              );
                            } else if (value == 'delete') {
                              _deleteBus(index);
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 'edit', child: Text('Edit')),
                            PopupMenuItem(value: 'delete', child: Text('Delete')),
                          ],
                          icon: Icon(Icons.more_vert),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBusPage()),
          );
        },
      ),
    );
  }
}

class OwnerSeatManagement extends StatefulWidget {
  @override
  _OwnerSeatManagementState createState() => _OwnerSeatManagementState();
}

class _OwnerSeatManagementState extends State<OwnerSeatManagement> {
  String selectedBusType = 'Mini Bus'; 
  int seatCount = 24; 
  List<bool> seatStatus = List.generate(24, (index) => true); 
  int? selectedSeatNumber; 

  void updateBusType(String type) {
    setState(() {
      selectedBusType = type;
      if (type == 'Mini Bus') {
        seatCount = 24;
        seatStatus = List.generate(24, (index) => true);
      } else if (type == 'Coach Bus') {
        seatCount = 54;
        seatStatus = List.generate(54, (index) => true);
      }
      selectedSeatNumber = null; 
    });
  }

  void toggleSeatAvailability(int index) {
    setState(() {
      seatStatus[index] = !seatStatus[index];
    });
  }

  void selectSeat(int index) {
    setState(() {
      selectedSeatNumber = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Seats'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            DropdownButton<String>(
              value: selectedBusType,
              onChanged: (String? newValue) {
                if (newValue != null) updateBusType(newValue);
              },
              items: <String>['Mini Bus', 'Coach Bus']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            SizedBox(height: 16),
            Text(
              'Front',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: seatCount ~/ 4, 
                itemBuilder: (context, rowIndex) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < 2; i++)
                            GestureDetector(
                              onTap: () {
                                int seatIndex = rowIndex * 4 + i;
                                selectSeat(seatIndex);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: seatStatus[rowIndex * 4 + i]
                                      ? Colors.green // Available
                                      : Colors.grey, // Unavailable
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '${rowIndex * 4 + i + 1}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Spacer(), // Aisle
                          
                          for (int i = 2; i < 4; i++)
                            GestureDetector(
                              onTap: () {
                                int seatIndex = rowIndex * 4 + i;
                                selectSeat(seatIndex);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: seatStatus[rowIndex * 4 + i]
                                      ? Colors.green 
                                      : Colors.grey, 
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '${rowIndex * 4 + i + 1}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (rowIndex != seatCount ~/ 4 - 1)
                        SizedBox(height: 16), 
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (selectedSeatNumber != null)
              Text(
                'Seat: $selectedSeatNumber',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            else
              Text(
                'No Seat Selected',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            if (selectedSeatNumber != null)
              ElevatedButton(
                onPressed: () {
                  if (selectedSeatNumber != null) {
                    int seatIndex = selectedSeatNumber! - 1; 
                    toggleSeatAvailability(seatIndex);
                  }
                },
                child: Text(
                  seatStatus[selectedSeatNumber! - 1] ? 'Make Unavailable' : 'Make Available',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  foregroundColor: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AddBusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Add Bus',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Bus Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'No of Seats'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Registration No'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Departure Place'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Arrival Place'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Departure Time'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Arrival Time'),
                  ),
                ),
              ],
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'AC/Non AC'),
              items: [
                DropdownMenuItem(child: Text('AC'), value: 'AC'),
                DropdownMenuItem(child: Text('Non AC'), value: 'Non AC'),
              ],
              onChanged: (value) {},
              value: 'AC',
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Available On'),
              items: [
                DropdownMenuItem(child: Text('Weekdays'), value: 'Weekdays'),
                DropdownMenuItem(child: Text('Weekends'), value: 'Weekends'),
                DropdownMenuItem(child: Text('Everyday'), value: 'Everyday'),
              ],
              onChanged: (value) {},
              value: 'Weekdays',
            ),
            Spacer(), // Push the button to the bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Orange color
                ),
                onPressed: () {
                  Navigator.pop(context); // Navigate back to BusesListPage
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingListPage extends StatefulWidget {
  @override
  _BookingListPageState createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  String? selectedBus;
  TextEditingController searchController = TextEditingController();

  final List<String> busList = ["Annai Muthumari", "PPT Travels", "JGC Travels","NCG express"];
  final List<Map<String, String>> bookings = [
    {
      "seatNo": "1 (M)",
      "pickupPlace": "Vishaka Pillayar Kovil  Rd",
      "phoneNo": "94 77 123 4567",
      "name": "John Sebastian",
      "time": "8:00 PM",
      "status": "Paid"
    },
  ];

  List<Map<String, String>> filteredBookings = [];

  @override
  void initState() {
    super.initState();
    filteredBookings = bookings; // Initially show all bookings
  }

  void filterBookings(String query) {
    setState(() {
      filteredBookings = bookings.where((booking) {
        return booking['pickupPlace']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Bookings List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Search Bar with Dropdown
            Row(
              children: [
                
            Expanded(
              child: DropdownButtonFormField(
                  hint: Text("Select Bus"),
                  value: selectedBus,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBus = newValue;
                    });
                  },
                  items: busList.map((String bus) {
                    return DropdownMenuItem<String>(
                      value: bus,
                      child: Text(bus),
                    );
                  }).toList(),
              ),
            ),
              ],
            ),
            SizedBox(height: 10),

            // Booking Info List
            Expanded(
              child: ListView.builder(
                itemCount: filteredBookings.length,
                itemBuilder: (context, index) {
                  final booking = filteredBookings[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Seat: ${booking['seatNo']}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Pickup: ${booking['pickupPlace']}"),
                              Text("Phone: ${booking['phoneNo']}"),
                            ],
                          ),
                          // Right Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                booking['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Time: ${booking['time']}"),
                              Text(
                                booking['status']!,
                                style: TextStyle(
                                  color: booking['status'] == "Paid"
                                      ? Colors.green
                                      : booking['status'] == "Unpaid"
                                          ? Colors.red
                                          : Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Notificationpage extends StatefulWidget {
  @override
  _NotificationpageState createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  List<Map<String, String>> notifications = [
    {
      'title': 'A seat is cancelled in the bus from Jaffna to Colombo',
      'link': 'View Details'
    },
    {
      'title': 'A seat is requested in the bus from Jaffna to Colombo',
      'link': 'View Details'
    }
    // Add more notifications here if needed
  ];

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  void deleteAllNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back to login page
            Navigator.pop(context); // Replace with actual navigation logic
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onSelected: (value) {
              if (value == 'Delete All Notifications') {
                deleteAllNotifications();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Delete All Notifications',
                child: Text('Delete All Notifications'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification['title'] ?? ''),
            subtitle: GestureDetector(
              onTap: () {
                // Navigate to Bus Preview Page
              },
              child: Text(
                notification['link'] ?? '',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            trailing: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'Delete Notification') {
                  deleteNotification(index);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Delete Notification',
                  child: Text('Delete Notification'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Settingpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.orange,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.light
                  ? Icons.nightlight_round
                  : Icons.wb_sunny,
              color: Colors.black,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Information
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange,
                      child: Text(
                        'U',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Email',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Phone number',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.lock, color: Colors.orange),
              title: Text('Change password'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle change password action
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.orange),
              title: Text('Delete account'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle delete account action
              },
            ),

            Divider(),

            // App Info

            ListTile(
              leading: Icon(Icons.privacy_tip, color: Colors.orange),
              title: Text('Privacy policy'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle privacy policy action
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.orange),
              title: Text('Terms & conditions'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle terms and conditions action
              },
            ),

            ListTile(
              leading: Icon(Icons.info, color: Colors.orange),
              title: Text('About us'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle about us action
              },
            ),

            Divider(),

            // Logout Button
            ListTile(
              leading: Icon(Icons.logout, color: Colors.orange),
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                // Handle logout action
              },
            ),

          ],
        ),
      ),
    );
  }
}



class BusownerSignupPage extends StatefulWidget {
  

  BusownerSignupPage();

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<BusownerSignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(

              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.business, color:Colors.orange),
                labelText: 'Business Name',
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
           SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            
            

            SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ownerSetPasswordPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text('Next', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ownerSetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Password'), backgroundColor: Colors.orange),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BusOwnerLoginPage()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Forgot Password Page remains the same
class BusownerForgotPasswordPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password'), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select OTP Method', style: TextStyle(fontSize: 18, color: Colors.orange)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerificationPage(method: 'SMS')));
              },
              child: Text('Send OTP via SMS', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerificationPage(method: 'Email')));
              },
              child: Text('Send OTP via Email', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
        length: 4,
        // Number of tabs
        child: Scaffold(


    body: TabBarView(
      children: [
        SearchBusPage(),
        BookingTab(),
        NotificationsTab(),
        SettingsTab(),
      ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: themeProvider.themeMode == ThemeMode.light ? Colors.white70 : Colors.black87,
        child: TabBar(

          tabs: [

            Tab(
              icon: Icon(Icons.home,color: Colors.orange,),
              text: 'Home',

            ),
            Tab(
              icon: Icon(Icons.book,color: Colors.orange,),
              text: 'Bookings',
            ),
            Tab(
              icon: Icon(Icons.notifications,color: Colors.orange,),
              text: 'Notifications',
            ),
            Tab(
              icon: Icon(Icons.settings, color: Colors.orange,),
              text: 'Settings',
            ),

          ],
        ),
      ),
        ),
    );
  }
}

class SearchBusPage extends StatefulWidget {
  @override
  _SearchBusPageState createState() => _SearchBusPageState();
}

class _SearchBusPageState extends State<SearchBusPage> {
  //const SearchBusPage({super.key});
DateTime? _selectedDate;

 Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Search Buses'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'From',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.swap_horiz),
                  onPressed: () {
                    // Logic to swap locations can be added here
                  },
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'To',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            

 

  // Journey Date Box
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Journey Date'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Icon(Icons.calendar_today, color: Colors.orange),
                  ],
                ),
              ),
            ),
          ),
           
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BusResultsScreen()),
                  );

                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                ),
                child: Text(
                  'SEARCH BUSES',
                  style: TextStyle(fontSize: 18,color: Colors.black,),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}



class BusResultsScreen extends StatefulWidget {
  @override
  _BusResultsScreenState createState() => _BusResultsScreenState();
}

class _BusResultsScreenState extends State<BusResultsScreen> {
  final List<String> locations = ['Colombo', 'Kandy'];
  String? selectedStartingPoint;
  String? selectedDestination;
  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<Widget> getBusDetails() {
    if (selectedStartingPoint == 'Kandy' &&
        selectedDestination == 'Colombo' &&
        selectedDate != null &&
        selectedDate!.day == 7 &&
        selectedDate!.month == 11 &&
        selectedDate!.year == 2024) {
      return [
        buildBusCard(
          name: "Silva Travels (A/C Conditioned)",
          route: "Kandy - Colombo",
          time: "4:00 AM - 8:00 AM",
          availableSeats: "15/24",
        ),
      ];
    } else if (selectedStartingPoint == 'Colombo' &&
        selectedDestination == 'Kandy' &&
        selectedDate != null &&
        selectedDate!.day == 7 &&
        selectedDate!.month == 11 &&
        selectedDate!.year == 2024) {
      return [
        buildBusCard(
          name: "ILL Travels (Non-A/C Conditioned)",
          route: "Colombo - Kandy",
          time: "9:00 AM - 2:00 PM",
          availableSeats: "13/54",
        ),
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Results'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdowns for Starting Point and Destination
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedStartingPoint,
                    hint: Text('Starting Point'),
                    items: locations.map((location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedStartingPoint = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Starting Point',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedDestination,
                    hint: Text('Destination'),
                    items: locations.map((location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDestination = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Destination',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Date Picker for Journey Date
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => selectDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? 'Journey Date'
                            : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Icon(Icons.calendar_today, color: Colors.orange),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Displaying Bus Details
            Expanded(
              child: ListView(
                children: getBusDetails(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to Build Bus Cards
  Widget buildBusCard({
    required String name,
    required String route,
    required String time,
    required String availableSeats,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(route),
            SizedBox(height: 4),
            Text(time),
            SizedBox(height: 8),
            Text(
              "Available seats: $availableSeats",
              style: TextStyle(color: Colors.green),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserSeatSelection()),
                );
              },
              child: Text("Book"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class UserSeatSelection extends StatefulWidget {
  @override
  _UserSeatSelectionState createState() => _UserSeatSelectionState();
}

class _UserSeatSelectionState extends State<UserSeatSelection> {
  List<bool> seatStatus = List.generate(54, (index) => index > 11); 
  List<bool> selectedSeats = List.generate(54, (index) => false); 
  int? selectedSeatNumber; 
  final int seatPrice = 400; 

  // Dummy data for bus details
  final String busName = "Silva Travels";
  final String busNumber = "CP-6543";
  final String startingLocation = "Kandy";
  final String destination = "Colombo";
  final String startingTime = "4.00 AM";
  final String arrivalTime = "8.00 AM";

  void selectSeat(int index) {
    if (seatStatus[index]) {
      setState(() {
        
        for (int i = 0; i < selectedSeats.length; i++) {
          selectedSeats[i] = false;
        }
        
        selectedSeats[index] = true;
        selectedSeatNumber = index + 1;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Seat ${index + 1} is already booked!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seat'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Card(
              color: Colors.teal[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      busName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[900],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Bus No: $busNumber",
                      style: TextStyle(fontSize: 16, color: Colors.teal[800]),
                    ),
                    Text(
                      "From: $startingLocation   To: $destination",
                      style: TextStyle(fontSize: 16, color: Colors.teal[800]),
                    ),
                    Text(
                      "Departure: $startingTime   Arrival: $arrivalTime",
                      style: TextStyle(fontSize: 16, color: Colors.teal[800]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Front',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 9, 
                itemBuilder: (context, rowIndex) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                          for (int i = 0; i < 2; i++)
                            GestureDetector(
                              onTap: () {
                                int seatIndex = rowIndex * 6 + i;
                                selectSeat(seatIndex);
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: selectedSeats[rowIndex * 6 + i]
                                      ? Colors.yellow 
                                      : seatStatus[rowIndex * 6 + i]
                                          ? Colors.green 
                                          : Colors.grey, 
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '${rowIndex * 6 + i + 1}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Spacer(),
                          
                          for (int i = 2; i < 4; i++)
                            GestureDetector(
                              onTap: () {
                                int seatIndex = rowIndex * 6 + i;
                                selectSeat(seatIndex);
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: selectedSeats[rowIndex * 6 + i]
                                      ? Colors.yellow 
                                      : seatStatus[rowIndex * 6 + i]
                                          ? Colors.green 
                                          : Colors.grey, 
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '${rowIndex * 6 + i + 1}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (rowIndex != 8) SizedBox(height: 20), // Aisle spacing
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (selectedSeatNumber != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Seat: $selectedSeatNumber',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Price: Rs. $seatPrice',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              )
            else
              Text(
                'No Seat Selected',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ElevatedButton(
              onPressed: selectedSeatNumber != null
                  ? () {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Proceeding to payment for Seat $selectedSeatNumber'),
                        ),
                      );
                    }
                  : null,
              child: Text('Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.orange,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.light
                  ? Icons.nightlight_round
                  : Icons.wb_sunny,
              color: Colors.black,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Information
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange,
                      child: Text(
                        'U',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Email',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Phone number',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.lock, color: Colors.orange),
              title: Text('Change password'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle change password action
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.orange),
              title: Text('Delete account'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle delete account action
              },
            ),

            Divider(),

            // App Info

            ListTile(
              leading: Icon(Icons.privacy_tip, color: Colors.orange),
              title: Text('Privacy policy'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle privacy policy action
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.orange),
              title: Text('Terms & conditions'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle terms and conditions action
              },
            ),

            ListTile(
              leading: Icon(Icons.info, color: Colors.orange),
              title: Text('About us'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle about us action
              },
            ),

            Divider(),

            // Logout Button
            ListTile(
              leading: Icon(Icons.logout, color: Colors.orange),
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                // Handle logout action
              },
            ),

          ],
        ),
      ),
    );
  }
}



class BookingTab extends StatefulWidget {
  @override
  _BookingTabState createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Bookings'),
          centerTitle: true,
        ),
    body:  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row with buttons for Upcoming and Past Bookings
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action when Upcoming Bookings button is pressed
                  print('Upcoming Bookings pressed');
                },
                child: Text('Upcoming Bookings'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action when Past Bookings button is pressed
                  print('Past Bookings pressed');
                },
                child: Text('Past Bookings'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Search Bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Search Bookings",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),

        ],
      ),
    ),
    );
  }
}

class NotificationsTab extends StatefulWidget {
  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  List<Map<String, String>> notifications = [
    {
      'title': 'A seat is cancelled in the bus from Jaffna to Colombo',
      'link': 'View Details'
    },
    // Add more notifications here if needed
  ];

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  void deleteAllNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back to login page
            Navigator.pop(context); // Replace with actual navigation logic
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onSelected: (value) {
              if (value == 'Delete All Notifications') {
                deleteAllNotifications();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Delete All Notifications',
                child: Text('Delete All Notifications'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification['title'] ?? ''),
            subtitle: GestureDetector(
              onTap: () {
                // Navigate to Bus Preview Page
              },
              child: Text(
                notification['link'] ?? '',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            trailing: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'Delete Notification') {
                  deleteNotification(index);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Delete Notification',
                  child: Text('Delete Notification'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Sign-Up Page with Next to enter password
class SignUpPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'), backgroundColor: Colors.orange),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person, color: Colors.orange),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.account_circle, color: Colors.orange),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetPasswordPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text('Sign up', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Set Password Page
class SetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Password'), backgroundColor: Colors.orange),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text('Next', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Forgot Password OTP Method Selection Page
class ForgotPasswordMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password'), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select OTP Method', style: TextStyle(fontSize: 18, color: Colors.orange)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerificationPage(method: 'SMS')));
              },
              child: Text('Send OTP via SMS', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerificationPage(method: 'Email')));
              },
              child: Text('Send OTP via Email', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}

// OTP Verification Page
class OTPVerificationPage extends StatelessWidget {
  final String method;

  OTPVerificationPage({required this.method});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP - $method'), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter OTP sent via $method', style: TextStyle(fontSize: 18, color: Colors.orange)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'OTP',
                prefixIcon: Icon(Icons.lock, color: Colors.orange),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetPasswordPage()));
              },
              child: Text('Verify OTP', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}