import 'package:flutter/material.dart';


class AddressCardWidget extends StatelessWidget {

  const AddressCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
       /* Get.to(
          () => ProductDetailsScreen(
            productId: products!.id!,
          ),
        );*/
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              elevation: 8.0,
             // color: cardBackgroundColor,
              child: Padding(padding: EdgeInsets.all(10),
              child:Row(children: [
                Expanded(
                    flex: 3,
                    child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(children: [
                      Text(
                        'Title:',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                      const SizedBox(width: 5),

                      Text(
                         'Head Office',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ],),

                    const SizedBox(height: 5),


                    Row(children: [
                      Text(
                        'Contact Person :',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                      const SizedBox(width: 5),

                      Text(
                        'Lunis Khairnar',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ],),

                    const SizedBox(height: 5),


                    Row(children: [
                      Text(
                        'Contact Email:',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                      const SizedBox(width: 5),

                      Text(
                        'Test@test.com',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ],),

                    const SizedBox(height: 5),

                    Row(children: [
                      Text(
                        'Mobile Number:',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                      const SizedBox(width: 5),

                      Text(
                        '8765432145',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ],),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(),
                        /*Container(
                      height: 40.0,
                      width: 80.0,

                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        border: Border.all(color: Colors.redAccent,width: 2.0)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Track'),
                        ],),
                    ),*/
                      ],),
                    SizedBox(height: 20,),

                  ],
                )),
                  Expanded(
                    flex: 1,
                    child:
                Column(
                  children: [

                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.remove_red_eye_outlined,size: 17.0),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(height: 10,),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.edit,size: 17.0),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(height: 10,),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.delete_outline,size: 17.0),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),


                ],))

              ],)

             ),
            ),

          ],
        ),
      ),
    );
  }
}
