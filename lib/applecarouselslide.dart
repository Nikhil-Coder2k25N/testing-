import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class Applecarouselslide extends StatefulWidget {
  const Applecarouselslide({super.key});
  @override
  State<Applecarouselslide> createState() => _CrossfileState();
}
class _CrossfileState extends State<Applecarouselslide> {
  int _currentIndex = 0;
  // final List<String> product_image=[
  //   'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MGCC4_VW_34FR+watch-case-49-titanium-natural-ultra3_VW_34FR+watch-face-49-ocean-ultra3_VW_34FR?wid=5120&hei=3280&bgc=fafafa&trim=1&fmt=p-jpg&qlt=80&.v=T1lWTTZnNjJ0cHU5TWZLUktueGVoS1ZGV0ZiSDllNHd6YWJwdVV2Z2xBWm9SMGMvQkpTNDBiSVZSVExOcXdwL21waDNwS2JiYllsTkdSSzZVQyt6UTA3TEpxSjk0aTYwUmxLdzg5clk4QlA0djFINWxKM2N1ODZxM3paRjhkcHlyVDRiVmdZZVNaZWZoQXpFYWZuTUJwdCtjanNSR3I0b2ZzaC9XVGo3anVzYlh2NG8wVjlsTCtqMWFNc20rOXN6UUxEaDhOQldDNkNRMFdXOG9BTC9JMlBEaGQxRytQT2dxQXNWKzI0c0ViQQ',
  //   'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MQDP3?wid=532&hei=582&fmt=png-alpha&.v=ekdNWGRyOTZjVmxDTTNjRzZ6ZnIzZ0hqc0NvK2RZTVd5TWVhUDFuQlo0MDB0Y0lkeVg2OHRld3lCWVNZZVFRRXVTbDlvM1pMVlNzZEJDMFh0bDl2RlE',
  //   'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MGFL4?wid=532&hei=582&fmt=png-alpha&.v=YWNwdnh5aVNHd2tXL000dFJnTExHQUhqc0NvK2RZTVd5TWVhUDFuQlo0MGFCQ016dk4ydDRZN05UbHM4bXd2dkc5aEdmRHJIUnZvK2Z6S1p3czJHVUE'
  // ];
  final List<String> product_name=[
    'assets/images/AirPods Max.png',
    'assets/images/iMac.png',
    'assets/images/iPad.png',
    'assets/images/Apple Watch Ultra 3.png',
    'assets/images/Beats Solo 4.png',
  ];



  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors.tealAccent,
        appBar: AppBar(

          centerTitle: true,
          title: Image.asset("assets/images/AppleIcon.png",height:50,width:100,color: Colors.white),
          //title: Text("--- NIKHIL  APPLE  STORE ---",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black)),
          //centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            CarouselSlider(
                items: product_name.map((url){
                  return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(url,
                            //fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      }
                  );
                }).toList(),
                options:CarouselOptions(

                  height:120,
                  enlargeCenterPage:true,
                  autoPlay:true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index; //  Indicator ko update kar raha hai
                    });
                  },
                )
            ),
            // Indicator Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                product_name.length,
                    (index) => buildIndicator(index),
              ),
            ),
          ],
        )
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      width: _currentIndex == index ? 12 : 5,
      height: _currentIndex == index ? 12 : 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }
}
