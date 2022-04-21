import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    'assets/avatar.jpg',
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.widgets_outlined),
                      title: Text(
                        'Menu options',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.cached),
                      title: Text(
                        'Refunds',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text(
                        'Transactions',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.tune),
                      title: Text(
                        'Settings',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ListTile(
              title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.grey),
              ),
              leading: IconButton(
                icon: const Icon(
                    Icons.logout,
                    color: Colors.grey,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
