import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:followup/follow_up_you.dart';
import 'local_storage.dart';

class DropdownMenuNode1 extends StatefulWidget {
  const DropdownMenuNode1({super.key});

  @override
  State<DropdownMenuNode1> createState() => _DropdownMenuNode1State();
}

class _DropdownMenuNode1State extends State<DropdownMenuNode1> {
  final List<String> data = ['Male', 'Female', 'Transgender'];
  late String _dropdownValue = data.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8,), Text('Gender: '),
            DropdownMenu<String>(
              menuHeight: 200,
              initialSelection: data.first,
              onSelected: _onSelect,
              dropdownMenuEntries: _buildMenuList(data),
            ),
          ],
        ) 
        
        
      ],
    );
  }

  void _onSelect(String? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  List<DropdownMenuEntry<String>> _buildMenuList(List<String> data) {
    return data.map((String value) {
      return DropdownMenuEntry<String>(value: value, label: value);
    }).toList();
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _DatePickerItem(
                children: <Widget>[
                  const Text('Birthday'),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in date picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: date,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        // This shows day of week alongside day of month
                        showDayOfWeek: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => date = newDate);
                        },
                      ),
                    ),
                    // In this example, the date is formatted manually. You can
                    // use the intl package to format the value based on the
                    // user's locale settings.
                    child: Text(
                      '${date.month}-${date.day}-${date.year}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}


class CheckingNameRoute extends StatelessWidget {
  CheckingNameRoute({super.key});
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: true,
        title: const Text('Checking in'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 370.0,
              // padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "ID",
                  hintStyle: TextStyle(color: Colors.grey,textBaseline: TextBaseline.ideographic,),
              
                  prefixIcon: Icon(Icons.perm_identity),
                  suffixIcon: Icon(Icons.close),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 0.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 370.0,
              // padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.grey,textBaseline: TextBaseline.ideographic,),
              
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.close),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 0.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: (){
                  LocalStorage.initSP();
                  LocalStorage.save("Name", nameController.text);
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => CheckingGenderRoute()));
                },
                child: const Text('Next'),
              )
            ),
          ]
        )
      )
    );   
  }
}

class CheckingGenderRoute extends StatelessWidget {
  CheckingGenderRoute({super.key});
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: true,
        title: const Text('Checking in'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: DropdownMenuNode1()
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const CheckingBirthdayRoute()));
                },
                child: const Text('Next'),
              )
            ),
          ]
        )
      )
    );   
  }
}

class CheckingBirthdayRoute extends StatelessWidget {
  const CheckingBirthdayRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: true,
        title: const Text('Checking in'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DatePickerExample(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: const Text('Save'),
              )
            ),
          ]
        )
      )
    );   
  }
}