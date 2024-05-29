import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true
        ),
        home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;
  bool search = false;
  List<bool> followList = List.generate(13, (index) => false);
  final ScrollController scrollController = ScrollController();
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        isScrolled = scrollController.hasClients &&
            scrollController.offset > (kToolbarHeight + 174.0);
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers:  <Widget>[
                SliverToBoxAdapter(
                  child: isScrolled ? const SizedBox(height: 309) :
                  Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 231.0,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'images/image 121.png'),
                                      fit: BoxFit.fill
                                  )
                              )
                          ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: GestureDetector(
                                onTap: () {
                                  exit(0);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.55)
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white
                                  )
                                ),
                              )
                            )
                          ]
                        ),
                        Container(
                            height: 78.0,
                            decoration: const BoxDecoration(
                                color: Color(0xFFC32422)
                            ),
                            child: Center(
                                child: ListTile(
                                    title: const Text(
                                        'The weekend',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white
                                        )
                                    ),
                                    subtitle: const Text(
                                        'Community • +11K Members',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white
                                        )
                                    ),
                                    trailing: InkWell(
                                        child: Container(
                                            width: 35.0,
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.0
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Colors.transparent,
                                            ),
                                            child: const Center(
                                                child: Icon(
                                                  size: 18.0,
                                                  Icons.share_outlined,
                                                  color: Colors.white,
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                      ]
                  )
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                        ),
                        children: [
                          TextSpan(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...'),
                          TextSpan(
                            text: 'Read more',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: index == 0 ? const EdgeInsets.only(right: 2.5) : index == 4 ? const EdgeInsets.only(left: 2.5) :  const EdgeInsets.symmetric(horizontal: 2.5),
                            child: Container(
                              height: 20.0,
                              width : index == 4 ? 40.0 : 68.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.pinkAccent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  index == 4 ? '+1' : 'Outdoor',
                                  style: const TextStyle(
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11.0,
                                    height: 0.2,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 5,
                              child: Text(
                                'Media, docs and links',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: const ImageIcon(
                                  AssetImage("images/arrow-right.png"),
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    image: DecorationImage(
                                      image: AssetImage('images/image 121.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'Mute notifications',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Switch(
                            thumbIcon: MaterialStateProperty.resolveWith(
                                  (final Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return const Icon(
                                    Icons.circle,
                                    color: Colors.pinkAccent,
                                  );
                                }
                                return const Icon(
                                  Icons.circle,
                                  color: Colors.grey,
                                );
                              },
                            ),
                            value: selected,
                            thumbColor: MaterialStateProperty.resolveWith(
                                  (final Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.pinkAccent;
                                }
                                return Colors.grey;
                              },
                            ),
                            trackOutlineColor: MaterialStateProperty.resolveWith(
                                  (final Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return null;
                                }
                                return Colors.transparent;
                              },
                            ),
                            activeTrackColor: Colors.grey.withOpacity(0.2),
                            inactiveTrackColor: Colors.grey.withOpacity(0.2),
                            onChanged: (value) => setState(() => selected = value),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton.icon(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage("images/trash.png"),
                                  size: 28,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                    'Clear chat',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    )
                                )
                            )
                          ]
                      )
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 4.0)),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton.icon(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage("images/lock.png"),
                                  size: 28,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                    'Encryption',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    )
                                )
                            )
                          ]
                      )
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 4.0)),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton.icon(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage("images/logout.png"),
                                  size: 28,
                                  color: Colors.pinkAccent,
                                ),
                                label: const Text(
                                    'Exit Community',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Colors.pinkAccent,
                                    )
                                )
                            )
                          ]
                      )
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 4.0)),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton.icon(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage("images/dislike.png"),
                                  size: 28,
                                  color: Colors.pinkAccent,
                                ),
                                label: const Text(
                                    'Report',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Colors.pinkAccent,
                                    )
                                )
                            )
                          ]
                      )
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        color: Colors.transparent,
                        child: search ? searchActive() : searchPassive(),
                      )
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('images/image 110.png'),
                          radius: 25.0,
                        ),
                        title: const Text(
                          'Yashika',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: const Text(
                          '29, India',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: followList[index]
                            ? SizedBox(
                          width: 120.0,
                          height: 40.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            onPressed: () {
                              if (mounted) {
                                setState(() => followList[index] = !followList[index]);
                              }
                            },
                            child: const Text(
                              'Following',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                              ),
                            )
                          )
                        )
                            : SizedBox(
                          width: 120.0,
                          height: 40.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFEF456F),
                            ),
                            onPressed: () {
                              if (mounted) {
                                setState(() => followList[index] = !followList[index]);
                              }
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                              )
                            )
                          )
                        )
                      );
                    },
                    childCount: followList.length,
                  )
                )
              ]
          ),
            isScrolled ? Container(
                height: 78.0,
                color: const Color(0xFFC32422),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            exit(0);
                          },
                          child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.15)
                              ),
                              child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white
                              )
                          ),
                        )
                      ),
                      Expanded(
                        flex: 8,
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage('images/image 121.png')
                          ),
                          title: const Text(
                            'The weekend',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            )
                          ),
                          subtitle: const Text(
                            'Community • +11K Members',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            )
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Stack(
                                      children: [ Container(
                                        height: 184,
                                        width: MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                              child: TextButton.icon(
                                                onPressed: () {},
                                                icon: const ImageIcon(
                                                  AssetImage("images/link.png"),
                                                  size: 28,
                                                  color: Colors.black,
                                                ),
                                                label: const Text(
                                                  'Invite',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                  )
                                                )
                                              )
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                              child: TextButton.icon(
                                                onPressed: () {},
                                                icon: const ImageIcon(
                                                  AssetImage("images/user-add.png"),
                                                  size: 28,
                                                  color: Colors.black,
                                                ),
                                                label: const Text(
                                                  'Add member',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                              child: TextButton.icon(
                                                onPressed: () {},
                                                icon: const ImageIcon(
                                                  AssetImage("images/user-new.png"),
                                                  size: 28,
                                                  color: Colors.black,
                                                ),
                                                label: const Text(
                                                  'Add Group',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                  )
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      ),
                                        Positioned(
                                          top: 10.0,
                                          left: MediaQuery.of(context).size.width/2 - 44,
                                          child: Container(
                                           width: 88.0,
                                           height: 6.0,
                                           decoration: BoxDecoration(
                                               color: const Color(0xFF494949),
                                             borderRadius: BorderRadius.circular(15.0)
                                           )
                                          )
                                        )
                                      ]
                                    )
                                  );
                                }
                              );
                            },
                            child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.15)
                                ),
                                child: const Icon(
                                    Icons.more_vert_rounded,
                                    color: Colors.white
                                )
                            ),
                          )
                        )
                      )
                    ]
                  ),
                )
            ) : Container()
        ]
        )
      )
    );
  }

  Widget searchPassive() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
          title: const Text(
              'Members',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0
              )
          ),
          trailing: GestureDetector(
              onTap: () {if(mounted) {
                setState(() => search =! search);
              }},
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.2)
                ),
                alignment: Alignment.center,
                child: Container(
                    width: 27,
                    height: 27,
                  color: Colors.transparent,
                  child: const ImageIcon(
                    AssetImage("images/search.png"),
                    color: Colors.black
                  )
                )
              )
          )
      ),
    );
  }

  Widget searchActive() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                height: 43.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey.withOpacity(0.2)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
                  child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(25)
                      ],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.grey
                      ),
                    decoration: const InputDecoration(
                      hintText: 'Search member',
                        border: InputBorder.none
                    )
                  ),
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: TextButton(
                  onPressed: () {if(mounted) {
                    setState(() => search =! search);
                  }},
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.black
                    )
                  )
                )
              )
          )
        ]
      ),
    );
  }
}
