import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Modles/SectionModel.dart';
import 'package:lamp/Widgets/profileTypeSelector.dart';

class BuyerHomeView extends StatefulWidget {
  const BuyerHomeView({super.key});

  @override
  State<BuyerHomeView> createState() => _BuyerHomeViewState();
}

class _BuyerHomeViewState extends State<BuyerHomeView> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _searchController;
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _controller.dispose();
  }

  int _selectedPage = 0;
  List<String> images = [
    'https://ce8dc832c.cloudimg.io/width/768/n@30cdc272c3448b324836bec01e0db1475c213303/_cs_/2023/07/64a3edb414cab/Arduino_UNO_R4_banner.jpg',
    'https://www.okdo.com/wp-content/uploads/2021/07/arduino-banner-1200x350-1.jpg',
    'https://media1.giphy.com/media/mFDWuDppjQJjite6FS/giphy.gif?cid=ecf05e47xes0srymallxs7dx065j642pv17oda2q7s7xef7w&ep=v1_gifs_search&rid=giphy.gif&ct=g'
  ];
  List<SectionModel> sections = List.generate(
    10,
    (index) => SectionModel(
        imageUrl:
            'https://img.freepik.com/free-photo/still-life-medical-tools_23-2149371263.jpg',
        sectionTitle: 'Medicine'),
  );

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 32.h,
                    ),
                    onPressed: () {
                      setState(() {
                        show = true;
                      });
                    }),
                Text(appLocale.home,
                    style: Theme.of(context).textTheme.bodyLarge),
                IconButton(
                    icon: Icon(
                      Icons.add_circle_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: null),
              ],
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.w),
              child: SearchBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/search.svg',
                      color: Colors.black, height: 28.h),
                ),
                backgroundColor: MaterialStatePropertyAll(
                    const Color(0xffFFF8F8).withOpacity(.5)),
                hintText: appLocale.search,
                hintStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
                elevation: const MaterialStatePropertyAll(0),
                onTap: () {},
                controller: _searchController,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Stack(
                          children: [
                            Container(
                              height: 177.h,
                              clipBehavior: Clip.antiAlias,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: PageView.builder(
                                onPageChanged: (value) =>
                                    setState(() => _selectedPage = value),
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    images[index],
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            PositionedDirectional(
                              bottom: 12.h,
                              start: 105.w,
                              child: SizedBox(
                                height: 10,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    if (index == _selectedPage) {
                                      return Container(
                                        width: 42.w,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                        ),
                                      );
                                    }
                                    return const CircleAvatar(
                                      backgroundColor: Colors.white,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 8.w);
                                  },
                                  itemCount: images.length,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          appLocale.sections,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12.h),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 22.w,
                            mainAxisSpacing: 12.h,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(8.r),
                                      top: Radius.circular(20.r)),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      sections[index].imageUrl!,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      sections[index].sectionTitle!,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: sections.length,
                        ),
                        SizedBox(height: 128.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        show
            ? ProfileTypeSelector(
                cancelButtonOnTap: () => setState(() => show = false),
                isSeller: false)
            : const SizedBox.shrink(),
      ],
    );
  }
}
