import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const urlAPI = "https://shielded-lowlands-87962.herokuapp.com/api/";
const urlImage = "https://shielded-lowlands-87962.herokuapp.com/";
const apiKeyMap = "EGAzhmbOrycEXAWPWtOspStQSZKW2CACMtGM7cvm";
const apiKeyMaHoa = "mYaON1rG83Hjdqxf93GXFlY4IxpEwLcoAXWUKwjR";

SizedBox slideShimmer() {
  return SizedBox(
    height: 215,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.only(left: 10),
        width: 271,
        height: 215,
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 215,
            child: Card(
              elevation: 1.0,
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(16.0),
                  topEnd: Radius.circular(16.0),
                  bottomStart: Radius.circular(16.0),
                  bottomEnd: Radius.circular(16.0),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/j.jpg",
                    width: 271,
                    height: 132,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Check-in điểm du lịch ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF242A37),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 0),
                              child: const Icon(
                                Icons.thumb_up,
                                color: Color(0XFF0066FF),
                                size: 18,
                              ),
                            ),
                            const Text(
                              " 5.6k",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0XFF242A37),
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const FaIcon(
                                FontAwesomeIcons.solidEye,
                                color: Color(0XFF3EFF7F),
                                size: 18,
                              ),
                            ),
                            const Text(
                              " 6.1k",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0XFF242A37),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Color(0XFFFF2D55),
                                size: 18,
                              ),
                            ),
                            const Text(
                              " Nha Trang",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0XFF242A37),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

SizedBox slideNhuCauShimmer() {
  return SizedBox(
    height: 35,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Container(
          width: 100,
          padding: const EdgeInsets.only(left: 15, right: 15),
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0X33B1BCD0),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
  );
}

Container sliderTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
    child: Text(
      title,
      style: const TextStyle(
        color: Color(0XE6242A37),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    ),
  );
}
