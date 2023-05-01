// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:slide_menu_drawer/constants.dart';
import 'package:slide_menu_drawer/tk_icons.dart';
import 'package:slide_menu_drawer/transactions_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final TextStyle menuFontStyle =
      TextStyle(fontSize: 18, color: white.withOpacity(0.6));

  late double width, height;
  bool pressMenu = false;

  late AnimationController ctrl;
  late Animation<double> scaleAnimation;
  late Animation<double> scaleMenuAnimation;
  late Animation<Offset> menuAnimation;
  final Duration duration = Duration(milliseconds: 300);

  late final PageController pageController;

  @override
  void initState() {
    ctrl = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween(begin: 1.0, end: 0.8).animate(ctrl);
    scaleMenuAnimation = Tween(begin: 0.5, end: 1.0).animate(ctrl);
    menuAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut));
    pageController = PageController(viewportFraction: 0.85, initialPage: 1);
    super.initState();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: drawerColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(alignment: Alignment.centerLeft, child: drawerMenu(context)),
            home(context),
          ],
        ),
      ),
    );
  }

  Widget drawerMenu(BuildContext context) {
    return SlideTransition(
      position: menuAnimation,
      child: ScaleTransition(
        scale: scaleMenuAnimation,
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.fromLTRB(30, 60, 0, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///         HEADER               ///////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('asset/prof.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Camil Oruclu',
                    style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Baku, Azerbaijan',
                    style:
                        TextStyle(color: white.withOpacity(0.7), fontSize: 13),
                  ),
                ],
              ),

              ///       MENU  ITEMS            ///////////////
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 3),
                      Icon(
                        Tk.card,
                        color: white,
                        size: 15,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Cards',
                        style: TextStyle(
                          color: white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        color: white.withOpacity(0.6),
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Accounts',
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: white.withOpacity(0.6),
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Messages',
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: white.withOpacity(0.6),
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Deposits',
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.euro_symbol,
                        color: white.withOpacity(0.6),
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Currency',
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.loop,
                        color: white.withOpacity(0.6),
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Transfers',
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),

              ///        LOG OUT               ///////////////
              Row(
                children: [
                  Icon(
                    Tk.exit,
                    color: white.withOpacity(0.6),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 18,
                      color: white.withOpacity(0.6),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget home(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      left: pressMenu ? width * 0.55 : 0,
      right: pressMenu ? -0.6 * width : 0,
      top: 0,
      bottom: 0,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: ClipRRect(
          borderRadius:
              pressMenu ? BorderRadius.circular(20) : BorderRadius.circular(0),
          child: Scaffold(
            backgroundColor: backColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: width / 1.3,
                  decoration: BoxDecoration(
                    color: headerColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: AnimatedIcon(
                                icon: AnimatedIcons.menu_close,
                                progress: ctrl,
                                color: white,
                                size: 28,
                              ),
                              onTap: () {
                                setState(() {
                                  pressMenu ? ctrl.reverse() : ctrl.forward();
                                  pressMenu = !pressMenu;
                                });
                              },
                            ),
                            Text(
                              'My Cards',
                              style: TextStyle(fontSize: 20, color: white),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: white,
                                size: 28,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),

                      /// PAGEVIEW
                      SizedBox(
                        height: width / 2,
                        child: PageView(
                          controller: pageController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage('asset/tamkart.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage('asset/kart1.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage('asset/vtb.png'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions',
                        style: TextStyle(
                            fontSize: 20,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.sort,
                        color: white,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(color: white.withOpacity(0.6)),
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/apple.jpg'),
                              product: 'Macbook Pro 15"',
                              brand: 'Apple',
                              price: '-2.499',
                              priceColor: Colors.red[900],
                              dolarColor: Colors.red[900],
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/bank.png'),
                              product: 'Incoming transfer',
                              brand: 'Kapital Bank',
                              price: '+500',
                              priceColor: Colors.green[600],
                              dolarColor: Colors.green[600],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Yesterday',
                              style: TextStyle(color: white.withOpacity(0.6)),
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/gap.png'),
                              product: 'Coats',
                              brand: 'GAP',
                              price: '-299',
                              priceColor: Colors.red[900],
                              dolarColor: Colors.red[900],
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/strb.png'),
                              product: 'Coffee',
                              brand: 'Starbucks',
                              price: '-5.99',
                              priceColor: Colors.red[900],
                              dolarColor: Colors.red[900],
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/bank.png'),
                              product: 'Salary',
                              brand: 'Kapital Bank',
                              price: '+10.000',
                              priceColor: Colors.green[600],
                              dolarColor: Colors.green[600],
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/paypal.png'),
                              product: 'Money transfer',
                              brand: 'Paypal',
                              price: '+2.000',
                              priceColor: Colors.green[600],
                              dolarColor: Colors.green[600],
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/bakcell.png'),
                              product: 'Balance',
                              brand: 'Bakcell',
                              price: '-10',
                              priceColor: Colors.red[900],
                              dolarColor: Colors.red[900],
                            ),
                            SizedBox(height: 10),
                            TransactionsWidget(
                              circleImage: AssetImage('asset/strb.png'),
                              product: 'Coffee',
                              brand: 'Starbucks',
                              price: '-5.99',
                              priceColor: Colors.red[900],
                              dolarColor: Colors.red[900],
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
