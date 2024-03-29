import 'package:etaka/logics/models/offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constant.dart';

class DashBoardMainItemCard extends StatelessWidget {
  final String asset;
  final String title;
  final Function onTap;
  const DashBoardMainItemCard(
      {Key? key, required this.asset, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: SvgPicture.asset(asset),
              ),
              Material(
                  color: Colors.transparent,
                  child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onTap: () {
                        onTap.call();
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                      )))
            ],
          ),
          SizedBox(height: 5),
          Text(title,
              style: TextStyle(
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

class PayBillsItem extends StatelessWidget {
  final String asset;
  final String title;
  const PayBillsItem({Key? key, required this.asset, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          // height: 80,
          // width: 55,
          child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(asset),
            ),
          ),
          SizedBox(height: 2),
          Text(title)
        ],
      )),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          children: [
            ClipOval(
              child: Material(
                elevation: 10,
                color: Colors.grey
                    .shade200, //To let the Container background be displayed
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool isRoot;
  final PreferredSizeWidget? appBar;
  final Widget? bottomBar;
  final Widget? floatingActionButton;
  const CustomScaffold(
      {Key? key,
      required this.body,
      this.isRoot = false,
      this.appBar,
      this.bottomBar,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: h,
                width: w,
                child: Image.asset("assets/img/bck_r.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: [
                      Image.asset("assets/img/vector_1_r.png"),
                      Image.asset("assets/img/vector_2_r.png"),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isRoot) CustomBackButton(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                    child: SingleChildScrollView(
                      child: body,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomPrimaryButton extends StatelessWidget {
  final String btnText;
  // final Color btnColor;
  final Function onTap;
  const CustomPrimaryButton(
      {Key? key, required this.btnText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 250,
          child: Text(btnText,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              )),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: () {
          onTap.call();
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             SendMoneyConfirmation()));
        },
      ),
    );
  }
}

class OfferItemCard extends StatelessWidget {
  final Offer offer;
  const OfferItemCard({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Container(
          height: 100,
          width: w - 15,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 60, width: 60, child: Image.network(offer.photo!)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(offer.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                          offer.details.length > 160
                              ? offer.details.substring(0, 160)
                              : offer.details,
                          textAlign: TextAlign.justify,
                          style: TextStyle()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
