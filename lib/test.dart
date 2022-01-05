import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/Models/nhucau_object.dart';
import 'package:vietnam_travel_app/Providers/nhucau_provider.dart';

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextPageState();
  }
}

class TextPageState extends State<TextPage> {
  CarouselSlider slideShowNhuCau(List<Column> lst) {
    return CarouselSlider(
      items: lst,
      options: CarouselOptions(
          viewportFraction: 0.5,
          height: 55,
          autoPlay: false,
          enableInfiniteScroll: true),
    );
  }

  final List<Column> imgListNhuCau = [];
  void loadListNhuCau() {
    FutureBuilder a = FutureBuilder<List<NhuCauObject>>(
      future: NhuCauProvider.getAllNhuCau(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<NhuCauObject> lstRs = snapshot.data!;
          return ListView.builder(
              itemCount: lstRs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0XFF0869E1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.only(
                            left: 22, top: 7, right: 22, bottom: 7),
                        child: Text(
                          lstRs[index].tenNhuCau,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
        }
        return Text("Không có dữ liệu");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<NhuCauObject>>(
          future: NhuCauProvider.getAllNhuCau(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NhuCauObject> lstRs = snapshot.data!;
              return ListView.builder(
                  itemCount: lstRs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0XFF0869E1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.only(
                                left: 22, top: 7, right: 22, bottom: 7),
                            child: Text(
                              lstRs[index].tenNhuCau,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
