import 'package:crypton_test/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static final List<Widget> _widgetsList = [
    _NewsWidget(),
    Center(child: Text("page 2")),
    Center(child: Text("page 3")),
    Center(child: Text("page 4")),
    Center(child: Text("page 5")),
  ];

  _onTap(int index) {
    if (index == _selectedTab) return;
    setState(() {
      _selectedTab = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainScreenBackground,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.mainScreenDefault),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps_outlined), label: "Name"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Name"),
            BottomNavigationBarItem(
                icon: Icon(Icons.workspaces_outline), label: "Name"),
            BottomNavigationBarItem(icon: Icon(Icons.gpp_good), label: "Name"),
          ],
          currentIndex: _selectedTab,
          onTap: _onTap,
        ),
        body: _widgetsList[_selectedTab],
      ),
    );
  }
}

class _NewsWidget extends StatelessWidget {
  const _NewsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _name = "Firstname Secondname";

    final List<Widget> _listPosts = [
      _PostWidget(
          name: _name,
          text:
              "Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. "),
      _PostWidget(
          name: _name,
          text:
              "Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. "),
      _PostWidget(
          name: _name,
          text:
              "Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. "),
      _PostWidget(
          name: _name,
          text:
              "Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. "),
      _PostWidget(
          name: _name,
          text:
              "Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. "),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: _listPosts,
      ),
    );
  }
}

class _PostWidget extends StatefulWidget {
  const _PostWidget({
    Key? key,
    required String name,
    required String text,
  })  : _name = name,
        _text = text,
        super(key: key);

  final String _name;
  final String _text;

  @override
  State<_PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<_PostWidget> {
  bool _isTap = true;
  Color _favoriteColor = AppColors.mainScreenSelectedItem;

  void _onTapFavorite() {
    if (_isTap) {
      _favoriteColor = AppColors.mainScreenUnselectedItem;
      _isTap = !_isTap;
    } else {
      _favoriteColor = AppColors.mainScreenSelectedItem;
      _isTap = !_isTap;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(color: AppColors.mainScreenBackground, boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            )
          ]),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("${widget._name}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("${widget._text}"),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        IconButton(
                            splashRadius: 20,
                            onPressed: _onTapFavorite,
                            icon: Icon(
                              Icons.favorite,
                              color: _favoriteColor,
                            )),
                        Text("12",
                            style: TextStyle(
                                color: AppColors.mainScreenUnselectedItem,
                                fontSize: 14)),
                        SizedBox(
                          width: 25,
                        ),
                        IconButton(
                            splashRadius: 20,
                            onPressed: () {},
                            icon: Icon(
                              Icons.comment,
                              color: AppColors.mainScreenUnselectedItem,
                            )),
                        Text("12",
                            style: TextStyle(
                                color: AppColors.mainScreenUnselectedItem,
                                fontSize: 14)),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
