import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_show_app/models/Category.dart';
import 'package:flutter_show_app/services/categoryServices.dart';
import 'package:flutter_show_app/shared/appTextStyles.dart';
import 'package:flutter_show_app/shared/reusableBoxShadows.dart';
import 'package:flutter_show_app/shared/reusableWidgets.dart';
import 'package:flutter_show_app/shared/ribbon.dart';
import 'package:flutter_show_app/shared/sizeConfig.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.appBarWithCustomAction(true, context, []),
      body: FutureBuilder(
        future: CategoriesServices.getCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            return _buildListView(snapshot);
          } else if (snapshot.hasError) {
            return Center(
              child: const Text(
                "Error has happened",
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Center(
                child: ReusableWidgets.showLoaderWithoutDialog(context));
          }
        },
      ),
    );
  }

  ListView _buildListView(AsyncSnapshot<List<Category>> snapshot) {
    return ListView.separated(
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 20),
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [ReusableBoxShadows.defaultContainerShadow()],
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        alignment: Alignment.center,
        child: Ribbon(
          farLength: snapshot.data![index].isActive! ? 1 : 60,
          nearLength: snapshot.data![index].isActive! ? 1 : 30,
          title: snapshot.data![index].isActive! ? "" : 'USKORO',
          color: snapshot.data![index].isActive!
              ? Colors.transparent
              : Colors.yellow[700],
          titleStyle: TextStyle(
            //backgroundColor: Colors.red,
            color: Colors.white,
            fontSize: 13,
          ),
          location: RibbonLocation.topEnd,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  height: 160,
                  width: SizeConfig.blockSizeHorizontal * 100 - 40,
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data![index].imagePath!,
                    width: SizeConfig.blockSizeHorizontal * 100 - 40,
                    height: 160,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    placeholder: (context, url) => Center(
                        child: Container(
                      child: SvgPicture.asset(
                        "assets/images/logo.svg",
                        color: Colors.grey[400],
                      ),
                      height: 130,
                    )),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                height: 160,
                width: SizeConfig.blockSizeHorizontal * 100 - 40,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 100 - 80,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        snapshot.data![index].name!,
                        maxLines: 3,
                        minFontSize: 1,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.newStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ).copyWith(shadows: [
                          ReusableBoxShadows.defaultContainerShadow2()
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data![index].numberOfSalons == 2 ||
                              snapshot.data![index].numberOfSalons == 3 ||
                              snapshot.data![index].numberOfSalons == 4
                          ? snapshot.data![index].numberOfSalons.toString() +
                              " opcije dostupne"
                          : snapshot.data![index].numberOfSalons.toString() +
                              " opcija dostupno",
                      style: AppTextStyles.newStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ).copyWith(shadows: [
                        ReusableBoxShadows.defaultContainerShadow2()
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        height: 160,
      ),
    );
  }
}
