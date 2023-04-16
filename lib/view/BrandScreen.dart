import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/CommonWidget.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:onlinestoreapp/view/CartScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/MyProfileScreen.dart';
import 'package:onlinestoreapp/view/SignInScreen.dart';
import 'package:onlinestoreapp/view/SignUpScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/BottomNavigationbar.dart';
import 'package:onlinestoreapp/view/navigation_drawer/drawerHeader.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'NotificationScreen.dart';

class BrandScreen extends StatefulWidget {
  @override
  BrandScreenState createState() => BrandScreenState();
}

class BrandScreenState extends State<BrandScreen>
    with SingleTickerProviderStateMixin {

  final drawer_icon = "assets/icon/paragraph.png";
  final profile = "https://images.unsplash.com/photo-1642775588061-5743b12a47c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";
  var scaffoldkey = GlobalKey<ScaffoldState>();

  final List<String> product_name = [
    "Wilson",
    "Converse",
    "Umbro",
    "Nike",
    "Puma",
    "Vans",
    "Reebok",
    "Adidas"
  ];
  final List<String> color = [
    "#88E3B8",
    "#61D1DD",
    "#6698E1",
    "#EDA72D",
    "#E26A98",
    "#997BEB",
    "#A48C82",
    "#81B2F4"
  ];

  final List<String> images = [
    //wilson
    "https://toppng.com/uploads/preview/wilson-logo-wilson-tennis-logo-11563260271o7ynmjmmgf.png",
    //converse
    "https://banner2.cleanpng.com/20180901/ese/kisspng-logo-converse-brand-chuck-taylor-all-stars-sneaker-converse-magic-sneaker-5b8b0324f400d2.5545997715358369649995.jpg",
    //umbro
    "https://w7.pngwing.com/pngs/682/439/png-transparent-t-shirt-hoodie-umbro-clothing-sleeve-t-shirt-angle-text-logo.png",
    //nike
    "https://i.pinimg.com/originals/c6/3b/1c/c63b1c27722c3eb3ec0ed886fc107f73.jpg",
     //puma
    "https://pngset.com/images/puma-logo-free-logos-nike-logo-white-puma-logo-text-symbol-alphabet-stencil-transparent-png-152858.png",
    //vans
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTomQwvWwYxBS0r5F17Cx2NFADppk2Jmomrux3USZCK2u-zpayw__O7wBH48yHSP6ZtSKk&usqp=CAU",
    //reebok
    "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxQTExYUFBQXFxYYGR0dGBkZGRkgHRkZHB8YHRwZHyMgHyoiHx8nHx0cIzQjJysuMTExHyE2OzYwOiowMS4BCwsLDg4PFg4ODy4aFhouMC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uMC4uLi4uLi4uLi4uLi4uLi4uLi4uLv/AABEIAK0BIwMBIgACEQEDEQH/xAAcAAABBAMBAAAAAAAAAAAAAAACAQMGBwAECAX/xABNEAABAwEEBwQGBgcGBAYDAAABAgMRAAQSITEFBxMiQVFhBnGBoRQjMmKRwUJSsdHw8TNDU3KSorIIFTVzwuEkY4LTF5Ojs8PSJTRE/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAH/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwC1wxc3yZjGKVXrcsI59fyoEPFRuHI0b3q4u8c56fnQYl/Z7pExx78aRLFzfJkD54fOshBTfcIHMkgDkK10aUbWbqnW4PvJ++g2Vetywjn1/KlDwb3SJj861nbc0j2HW8c99J+dG2+y4JLiJPJae7nQOJYLe8TMfPClV63LCOfWgaeKyEnI8vjRvHZxd45zQYHwgXCJI+ePzpEsbPeJmKNtkLF45mm2nis3VZHlQEobXLCOfWsD4RuESRhPfSPHZRd45z0o0MhQvnM40AJZ2e8TP+9YobXEYRz60jTpcN1WXSleOzi7xzmgIWgJ3IxGE0KWdnvHHhhRpYChfOefjTbTpcN1WXSgJSdriMIwxpduALkY5TwoXVbMwnjjjRpYBF8zMT40AJa2e8TPDDrWKRtcRhGGNALSFYLICeZIHdjQOW9tBAQ4jH3knH40D/pEC5GPsz5UiW9lvHHhh+OlGlgEX+MT4502y4XDdVlE4UCqRtd4YRhj+OtFt8LkY+zPlNC6vZmE5HHGjDIu3+MT450AJb2W8cZww+PyrFN7XeGHDGsaWXDdVlE4c6x5ZbMJyzxoC2wjZxj7M+U0iUbLE4zhhRbEXb/0oveOdA0vaGFZDHCgVTe13hhwx/HWl24IuRj7M+U0LzhbN1OUTjTbjzKcS4gLGMFScDnlNA6lGyxOM4YVimtrvDDhjTdkfDs7yVAfVIz8KJ5wtm6nLPGgPbgi5GOU0iU7LE4zhhRKYAF8ZxPjQMq2mCuHKgxTO03gY4Y0RfCtyMThNA86WzdTl1pxTASL4mc6APQT9YVlB6arp8KygeccSUwn2uFDZ9yb+E5TjSCz3N+ZjGKU+tywjxz/ACoIPrxE6MdUPZvtf1CufIroXXaq7op1HJxrH/rBqhdDgbdmRI2qMOe8KDUwrMK6yOjWXMmW0x7icZ8KFywWdIuKs7SozlCIPxFBzFobtHarKQbO+430CjdPek7p+FXfqr1hpt4Wy+Ai0IAOHsuJyKkjgRhI6iOnga4NXTDNlVbLOlLSmykOIQIQpKlBMgZJIJGWETVcdhLapnSFlWkx65CT+6shCh8FGg6ccQpRJT7PCnXlpUCE4nhFaek9MNWRpa3lBLbYlSj8cBmSZgAZ1T2n9dDxWRY20toBgOOC8tQ53Zup7t6guuz7k38JynGgcQoqvJ9nhXObutDSqjJtZ/8ALZ/+lSPs5rutTRCbS0h9viUC44Ov1T3QO+gu59YUIRielDZzcm/hOU4153Z3S7FoZTaWHNo2cMoUlXFKhwUOXyrfcIWCokJCRiTlGc9KBFtqKpHszPhTr6woQjE9KqntbrrDRLNhbS5dwLzk3TzuJEEj3ifA1Bl60dK3rwtN3oltqPNJoOjrOboIXgeE402ptRVeA3ZnPhVC6M1xaQQRti2+kZhSAlRHRSIAPeDVu9ie3DGkWvVApWmA42oi8icJ6pPA/ZlQefrudSdEvxHtNcP+Yiuf9Dj/AIhn/NR/UKvzXVZbuiXzM7zXD/mIqgLE9s3ELIm6tKo53SDHlQdYKbUVTG7M+FOPKChCMTPDDCqE0xrm0g6SGdnZ0ZAJSFqjqpYIJ7gK0dHa2NKNKvbZLnRxtEfyhJ86DomzqCRC8D1xwoC2q9e+jM+FQfsLrMZ0isMuJDFojdTMociSbhzCvdPgTU62/wCrj3Z8poFtCgoQjEzw5UrCgkQvA9ccKjXbLtixopAU4b7qwdm0nBSveJ+imcJ+E1UunNcOkH1EtlthPAIQFEDqpcye4Cgvq4q9e+jM9I/KnH1BQhGJ6YYVzmxrV0qn/wDqvCIuqbajySDU17Fa50lYbtraUXsA63NwE5X0mSkdQT3AY0FrsqCRC8DPHHCuZ9Zyf/ylr/zSfiAa6WCNrvAgDIcZ4z51zVrP/wAUtfR2PglIoLK/s/JJsT4Tn6T5bNurOYUEiF4HrjhVZ/2elXbG+rP18f8Aptmp/pi3tNMrtDyw222JUTjly5kzAAzNBsJbUFSfZmfCnLQbwhGJ4xhXP3aDW3pB15arO6WWckNhLZISMiolJ3jmeFS7VNbtKWtXpNotDnoyTAF1sbZY+iDcm4OJHcOMBajCwkQvA9aaQ2oKvGbs+VGWdpvTHCO6s297ciJwmgd26OY+H+1LTHoB+t5VlALbxUQk5GjtHq4u4Tn4fnRuuhSboMk03ZvVzfwnLw7qCFa7Ezol1Zz2jf8AWBVC6IWEvslRAAcQSTkAFCSavjXiJ0Y6oezfax/6hVBWNguLQ2IBWpKROUqIHzoOm3e2mj0exbbNjn65B+dYO2OjSLy7bZp4+uR9gNc26e0K9ZH1sPouOIOPIjgpJ4pPA01o2wrfdQ02AXFqCUAqSmVHISogAnISc6C0dbOshi0WdVks69pfUkuLAISAkhV0ExJJA6RNQjVvotVo0jZkpGCHA6s8ktkKx7yAPEV6uidUWkXlBK20MicStxJw4wEEz5VcHYHsazottSRvOri+6RiqOAAm6kTlPxoK31+6cUt5myg7qEbRfvLUVBM/upH8xqMat+xp0laC2VlDaBecWIvQckpniYOJyg1sa6V3tL2gzIhqO7ZN/Oa0eyHbe0aOS6lhLRDpSVbRJJ3ZiIUOZoLftOqHRaEhOycJj2i6ue/Ax5VWWs3sCdGltxtZWw7ISVReQsY3DGcjEHofHdZ116RTkizY/wDLX/3K8btbrBtWkWw1aEtBIWFi4hQMgEcVHCCaD19RunFM28Wck7K0ApKeG0SCpCu/Ajxqca+dNGzWNFnbN02hRC8cdmiCoeJKR3TVTaugf7yskZ7ZNTf+0Q2Urscjg99rdBXfZjQTlttLVnbICnD7RySkAlSj3AGrr0Pqh0aAEuIcdVGKlOLTJ7kEAVS/ZbtE7YXw+yEFYSU74JEKiciDOHOpe7ru0ioQUWb/AMtz/uUG7rS1XNWNo2myFWzT+kaWb11JMXknOAcwe+ag3Y3TqrFa2rQDASoBwY7zZICweeGPeBUg0nratz7DtnWhi46goUQhd6FCDBK4nwqDmqOg9c1oKtFPyZF5r/3EVz4a6D1uvBWhFgGTDP8AW3VDaJSC+yDkXET/ABCoLa7H6lWlMpetrjl9Sb2yQQkIBEgKVBJVziIyxzprtJqZbLa12Ja9olJUGlkKC4+ikwCFHhMjuzq2FNqKr0bszPSnX1hYhOJmfCg5GZdUhSVJJSpJBSRgUqBkEdQa6g7GaVTa7Axa1e2puVnhtESFn+JJrmrT6ItNoAEQ84I7lqq6dVbav7lvcAH8ZygrNBT3a3Tq7banbQsk31G4D9FsYISOUJjxk8al2rvVkLY0LTaFqQ0onZoRAUsAwVEkYJkEZY1XYrp7VqtKNGWQHCWUH4igjOldSNiWzLLjrTl2QSoLSTH0gRMdxFUnpjRrlnecZcELbVdVGXQjoRBHfXVYbN6/G7Mz0maoHXkQdKukcW2v6RQT7Uf2jW9YiwoyqzrugnPZqEo+EKT3AVVms/8AxS1/5n+lNTn+zc4EqtsmMGfteqDaz/8AFLX/AJp+xNBZP9n9xAsNpLiglCXipRJgABtuSTyioPrP7dnSDuyalNlbUbg4uKy2ivkOA6mo+z2geRY1WNBCWlu7Rce0s3UpCSfqi7McT3UvZPQfptqbs+0S2FnFSjkkYmB9JUZDjQevq37EL0i8SoFNnbxdXzOYbSfrHjyHeJ6G0ZZkJQllKQlttICEpEBIGAGFa2gdBt2RptplF1tvLmeajzUczXo2k3wAnEigB5woN1OAp1TISm8M4nxrLO4ECFYGmW2iFXiN2ZnpQD6YvmPgKStz0pHPyNZQM+j3N+ZjGKydr0jxz/Km23VKVdUcDnhTlo3IuYTnx+2ghOu1V3RTqOTjWP8A1g1Q2hD/AMQx/mt/1Jq+ddYnRDij7W0bx/6xVD6E/Tsf5rf9SaDoXWJ2NRpRk3YQ+0DslnjP0Fe6fI49/O1usbjDimnUlDiFQpJwKVD8ZiusrRuRcwnPj9tQbWjq+GkGduyALWgHkNskfQPC99U+B5gPP1R6wRaALPaVf8QgerJ/XJA5/tAMTzGPOrJ/S9I8c65KSpbSwReQ4hXUKQpJ+IIIq/tWfb9NuaDaiEWlA9YODiRk4kHzAyPQigq7XTZyjSz88UtEHmNmgfaDXq6l+zljtnpItLQdU3sykFShuqvAxdI4geVSDXt2UW62i3tgqLabjwAxuSSlcckyQehB4Gqr7N6edsT4fZICgIIUJStJglKgCJBgHMZCgvpvVboteVlCY99wz/NQWjVzolv27MgAYXi6tIx71RURs2vYhONihXG69gfBSCRx41Eu3msN/SYS2ptLTSTeuJJJUrEAqOAMDIADxoLe0X2L0Sw826ylouoUCi66SbwyIF8z8Khn9otwqXY1RAAeHj6uvG1GdnS/bxaCk7JgEk8C4oEJT3gEq8Bzqytb3ZU2yx3Wky60dogcVQIUjxGXUCgp7VXo2z2i3oZtKAtC0LCUkkSsCRkQcgauVeqrRaBJswV0vuD/AF1zxZbQ4w6laCW3G1Sk5FKknr14GrP0br0dCQm0WZLhAxLa7knnBSY+NBNv/DDRSgVejJQBnLjkc5Jv4VqHsNoMbuyZPCfSFfH26gPa/W67amV2dlkMNuC64b5WtSTmkGAEgjA54VFuxHZ9VutbTCUykqCnD9VpJBWT4YDqRQXVrlsYRoh6DgC0AOm0RFUFox0IeaUrJLiCe4KBNX3rmeUdEvgnC81wH7RFc+UHXItIi4BPAGfOl2ez3pnhy8fKqE7J63H7I0lp1pNoSgANqKylSQMgTBCgMIkT1pztVrgtVqaUy22llKxC1BV5ZBwIBhITIkZT3UEI00+HLQ+tJlKnXFA8wVKI8qvDVQs/3IEBOKw+B4lY+2qM0Xo9y0OoZaSVOLN1IHPn3AYk8hXUXZrQaLLZGWE4lpsCeaokq8VSaDlQV0zq3CXdGWRSVYJZSg8cU4HzkVRWsPs0uw2taLsNOErZMYFBM3eUpmCO48RWx2I1iWrRoLbd1xlRktr4E5lJzST4jpQdHbf9XHuz5TXPOulaTpV4JM3EtpP7wQCR517ek9d7y0EM2VDTh/WKcUuD9YJupE98jpVavvrdWpa1Fa1qJUTiVKUcT1JNBa39nSylZthyEMievrcKhGs//FLX0dj4BIq5NVXZ1zR9iSHBdeeO0cECUyIQg4ZhIkjgVGqb1n/4pa/83/SmaD2exnYZOkNGvuI3bQ28Q2eChs0HZq6HgeBqEuNuMuFKgptxtWOYUhST8QQaun+zskKsloBy28+Nxuntb2rwWoG02ZMWhCd5I/XJHD98DI8cuUBu6rdYQ0g2LO9AtKEwTkHUjC+Bz5gd+Rwm93ZY5zhyrk2w2xxhxLjalIdQqUqGBSofiCDXRWrbtojSbPrID7YG0RljlfTxunyOFBKCztN6Y4RnlWbe9uRE4TQvrKDCcB8ftpxbSQm8PaiZnjQD6B73lWU16Uvn5D7qyg2HHgpN0GScKbs/q5vYTl4fnS+j3N+ZjGKwet92PHP8qDyO2HZpOkWFMqUpKFFJvJid0g8RzFQ+y6lrGhaFItNoKkqCgDs4JSQfqdKsbb7PdiY45Z40uwub8zHDvw+dBln9XN7CcvCgeZKyVJEg0f6X3Y8ZmkNo2e7Exx86CHdsNWVj0g9trzjTihvbO6Asj6SryTvRx4152jNT7FmdQ8i12htxBlCk7OQeP0MowIOBBIqwyxs96ZjhlnhSD1vSPHOgB1grkwFA8+OEHD44VAu1GqGxWlRXZlqs7isbqRLZPE3TF3wIHSrA29zciY49+PzpSxs96ZjhHOgpR3UZaEnG1Mgcylc/AT9tepojUWkEKftBcThutpCJHGSokx4CrWja+7HjnWbe5uRMYTPOg1dG6OZYZSxZmwhCckgfEknEk8ScTW5Zzs5vYTlSbHZ70z0yzrANrjlHjnQRDthqys1vWp2Cy4rEuNxvdVJOCj1wPWoK/qNemGrW0v8AeQtJ+Yq6PSLu5ExhNLsdnvTPCMqCoLBqLIUPSLWAn6rbck+JMD4GrE7MdkWLCi7Z24SYKlqMrXHFR+WXSvbCdrjlGHOs293cjpNB5va7QzekbKuyqWpIWUklMSLqgriIzFeCdV2jRZtgti6cw6D62cpvf6Th0qYbLZ70zwjKsCNrjlGHOgpzSGol28SzaUFHDaJIIHW7M/AUFh1GvKPrLW3HEIQomO9V0Crl9Ijcj3Z8ppS3s96Z4Rl+MqCP9jexlk0aDs0EuqzdXvKI5AgQkTwEV7pZN6/GEz4Z0dza45RhzrNv+rj3Znwmg0u0WiLPbmiy82HEzMGQU5i8k5g45iqy0tqMRMsWoo9x1F7+ZJH2VbRb2e9nw5fjKsDe03pjhGdBS7Goq0HFdqaSnmlClGOcEj4VNeyerCx2RQcTetD4xC3IAT1SnIHqZNTPb/q492Z8JrLmy3s5w5UCsrCBCsDM/j4VANP6obParQ7aVvPJ2qyshOzgTylJNT7Z7TemOEZ/jOs28+rj3Z8pigj/AGO7INWBlbLDi3AtzaEuXZBuhOEACMBUiYcDYuqwOdCUbLHOcOVYGtpvTHCM6CDdptU9ltr6rQpTjRXivZ3IUcd+CDvEZxy5zTWhNUrFmdQ/Z7VaA4g8dnBHFKhdxB5VPvSL25HSay7ssc5w5UBMOhAuqwNNIZKVXiMM/CjDO03pjhGeVZ6Re3IicJoHfTEc/I0tM+ge95f71lA2haioBU3eNOWjdi5hOceVE48FC6MzQMerm9xyjp+dA4yhKhKs+M0y0tRICpu8ZrxNN6BtbxKmLe40DkC0woeaAfOojpjsnpxeDWldrPA3mj/KkjzoLNfF2LmE5xjStpSU3lxPEkxXP2mOyun2v0htLg5ofUsHwC58qhmk7M+hU2hDqVH9qFg/zY0HUh00yDDr7SRxvOIGXea07Z2z0e37Ntsw53Xmz9hNct1lB0w9rI0SgAuWtsqP1UuL/oSa8/8A8XtGTvPrUOjTnzSK53rKC/7Tro0cn9HtzzhsY8s1VqnXjYI//XtJVxJDQ/8AkNUVWUF6WHXfZFuBLzT6WzmohJA5EhJmO6an9i0qy+2lyyuJcbV9JBnHkeIPQwa5Mr0dB6dtFkc2lneW0vjdOChyUDgodCDQdXobSUyYvRjzmmmFFRheI61VvZHXG06oItqQ0sketQDcP7wxKfMd1Wmi1tvIBbWFpVilQIKSOYIwoFtBKSLmA4xTiEJKbxi9Ez1oWFbPBWE02pkk3xlM+FArCiowvEdaW0EpMIwEYxzo3nA4Lqc86RhWzEKzOOFASW03ZMXonxpphRUYXiOvOhW0Zv4BMzJPDOtHSvamxoELtbCDOSnEDnwmaD0bQSkwjARw505s03b2F6JnjP51Dl61tFsgpNovmZ9Whahw4xFeBbNdliSsltl9eMjBCRn1UT5UFmMEqMLyjjzrLQSkwjAdOdU/pLXyteDdjSBOBW6T5BI+2vIc126QghCLOgT9RRPmuPKgvu4m7e+lE9Z/Om7OSowvEdedc4WrWhpRaifSimTMIQ2I/lnzry7X2xt7vt2y0HptVgfAECg6itSyg7uCYnpWvatLWVtN5doYQqJlTqBj4qrlG0Wtxwytaln3lE/aa39D9mrVav0FndcH1kpN0d6juj40HRQ7daOBO0trBHCHEn+mvMtWtjRaDDdpJHutPZ+KKr3QepO1u4vOtMjDdErX5Qn+apvoXU7o5j9PtH157yiE/BEeZNAruuPRuTaH3HDlcaEk9JUK9XRfay02jFGjLVd4F8tMjv3lXiO4GvY0VoJizYssNNJGO4lIMdYEnxr0H1bQQnhiZoNKzvWj6aEN+62tTg+JbT9lb620hMgC9HDnSMuhsXVZ00hkpN85Z+FAO2c5n4f7UlbfpiOZ+BpaBk2e5vzJHCsT63PCOXX8qbbUoqhU3eM5U5acIueN3y+dAin9nugTHzpSxc3wZjh34fOiYCSmVRPGc6aZUoqAVN3jOXTzoDT63PCOXX8qbfIALakpWB9YTM9KctOEXPG7RspSQCqJ4znQR3TGr3RzoKnLK2TxKBsyfFEGorbdSNjevFh15g8ASHEjwICv5qsZhSiQFTHGcqK04Rc8btBRel9SdraJ2LzTwHAyhR8DKf5qiuluw+kLNi9ZHUgZqSm+kd6kSPOuoWUpKQVRe4zn0+VNMKUTCpjrlQciEVldVaf7N2S0RtLOy5nJKBPxGI+NRLSWpWwOplpbrC8cAq8me5W950FBVlWLpbUtbm5LKm3hGU7NR8Fbv81QvS2gbTZjD7DjfCVJN3wVkfA0HnV7vZXtha9HrvWd0gTvNqxQrvT8xB614VZQdA9kNa1ktxS3aCLM9kAoy2s9FnI9FR0JqeekRuCCMp6c65CqXdjdY1rsEJBDrI/VOSQP3FZo8MOlBeHbZWkWG9ro9DLpHtocCr/eiFhJ7jjynKqR0zrI0q4tSXLQtojAoShLZT0wAUD3mrl7FawbLpAhAcuOxi04QFT7vBXhj0FF257BWW34qRcdjB5sC8OiuCh0PhFBzpbdLvvfpXnXP31qV9prTqT9suwdq0cZcTfaPsuoxT0CuKFdD4E1GKDKysrYsNiceWENNrcWckoSVE+AoNesqx+zWpm1vEKtCk2ZGcHeX8AYHifCrF0NqusFlIKWi8sAb7u/j0TF0fCgorQfZa12sgWdhbgJi9EInqpUJHxqwdEajHYCrXaEoE+wyLyvFSoAPcFVc6W0hAgAEJwAgQe7nNBZiSd/KOPOgjHZ7Vno5gBSbOFKH0nfWGRxx3Qe4CpOh39WAAPZw+GVZaCQdzKOHOnVJTdnC9HjP30AKTssRjOGNYlva7xw4UlmJJN/LhPOktBIMImI4ZTQKLQVbkZ4TSqTssRjOGNGtKbsiL0eM/fTdmxJv5cJoCDW03iY4UIfvbkdJoX1EGETHTKnVpSEyIvRwzmgT0EczWUxtHOavOsoNhx8KF0ZmgZ9VN7jlHT86JTAQL4JkY40KPW54Ry6/lQI6yVm8nI8+lOOPBYujM/LH5U2t4tm6IIHPrRqYCBfBJI59cPnQIz6qb3HKOlC4wVm8Ig8/hRI9bnhHLrQrfLe6IIHP40DjrwWLqczz6Y0LPq5vcco6UqmAjeBkjn8K87TOnbPZ29ranUNJGUnFXRIxKjhkBQbrjJWbwyPyw+VHabSkpOMDMlUAADmTlVR9pNeV2W7CzgMA66PMIB+0+FVjprtJarWZtDy3OhMJHckQkfCgvzSWtHRtkvAv7Zf1WBfy97BHnUXTrxs6nFX7K6luRCgtClHnKSAB/EapesoOmdHaytG2oXUWlKFGN16W8eUq3Se4mpCyUXDeurQvlCkkfYa5FqedgOxmlniF2dTlmamdotSkJPUJzXh0jrQWtpzVdo+1SrYBomSFMm4R1uxcJ7xUC03qQdBJsdoS6PqOi4oDleEpUe8Jq19AsvsN7N+0G0LGF8tpR4AJ+c03pXtNYrG4EO2ltDh+gpQkDmqPZHVUUHN2nuytrsZi0MON+8RKT3KTKT8a8iuuLI83aUX0rStGUoIUkjzBqK9otWmj7SSNgGlzG0Z3DjxKfYJ8KDnNCyCCDBGRHCrF7Ea4LTZIbtANoZ5k+tSMMlfT7lY9RT/AGn1I2pmV2ZxL6Pqncc6DHdPxHdVe6S0Y9Z13Hmltq5LSRPdOY6ig6W0Fpyy6RQpbK0OIP6RtXtAHMLQfhxB4E1B+2mpxp5Rc0coNqOKmVzcxOJQrEp/dxHKIiqdsFucZWHGnFNrGSkkgj4VafYrXQUQi3IvYRtkDHvWgZ96fhQeh2b1JMNFKrc6pxWezalKO4q9tXhdqxNEaBZsyYs7LbTecJEEgczmT3mn9GW1m1th1pxK0HAKQQR/sehp7bmbkCPZ6xlQG8sOC6nPPH8daxpYbEKzzwpFo2e8MeGP46ViG9rvHDhhQBsTN/hN7rGdOOrDghOeeNDtzNyMJu9YypVo2WIxnDGgVpwNi6rPPD8dKbDJBv8ACZ6xnRob2u8cOGH460IfJNyMPZnjGVATytoITwxxpWnA2Lqs88KRaNliMZwxpUNbTeOHDCgbSwQb5ymfCnHlbTBPDHGgD5JuQIy60S07LEYzhjQE06GxdVnnhTSGSk3zkMfCnENBzeOByw6UAfKjcMQcJoH/AE1PX4VlB6CnmfKsoGUXrwvTd4zMU5aeFzxu+Ux40q3woXBMnDHKha9V7XHl0/OgNi7G/F7jeifOmmr14Xpu8ZmPOlcZLhvCIPPphRreCxcEyeeWGPyoEtPDZ+N3ymKF20tNNlx5SEBIlSnCBA6k14Ha7tlZ9Ft3njfdWPVtIIvKjiZ9lPvHrEnCqF7ZdtLTpFwqeVdRO40mbieX7yo+kfLKgnvbDXOReasIvZgvOCR3oQc+9XLI1VWktIOvuFx1xTizmpRJPd0HQYCtSsoMrKyjbQVEAAkkwAMyTkBQBUk7H9hrVpFXqUhLYO86vBA6Dio9BPWKnOr/AFRRcf0ikgHFFnGZ6unh+4MecYirbasIAAaSlDYG6kCAAOAAECgiPYnVjZLEUrcRtnR+sdSLoPuJOCcciZPWvd7Wdp7NYUBx5wIBySn2lnkEjE9+Q51EdY+ttpgKYskOvTClnFtsju9tXTIceVUjpPSTr7inXnFOLVmpRx7ug6DCgnHbDW7abTLdnHo7WV4Yuq6lf0eGCcepqv3FkkkkknEk5kniaCsoNzRulXmFXmHXGlc21qST3wcam2gtclvZhLyW7QOa03V9IUiMepBNQbR9jcecS00grcWYSlOZP4xnhV76u9VbdjCH37rlowPNLfGEiMVe98IoJV2W0k7aGUuv2dxi8J2bpB5QencQD0rb0vo9p5OzW0hxsjFJSFJnuiJracdDgupzzxpGl7LBXHHCgrrtFqXsbwKrO4qzuRN2b7c/uk3h4GByqs+0erXSFklSmS42P1jUqHiIvDxFdHlgk38Iz6xnRuOBzdTnnj+OtByroDtFabEu/Z3Vtq+kAd1UcFJyPjVxdjNcNmfAbtaU2d6MHP1ajGcnFBnnI61Je0fYawWoH0hgbQ4h1vdXyxIi93KBqte0eo+0NhTlkdS8jMIXCXI5T7Cj4poLosa70FRlJEgkyDyI4UVomdyYj6OU+Fc56E7V6R0SvYrCwgGSw8FXTjiUz7PHFOB61cHYbWZY7YkN3i0+f1SyMT7isAruz6UExhN3hfjpN77ZmmrPM78xH0sp8azYmdphE3usZ/GjdXtBCeGONAFomdyY93KfDjTpCbuEXo6TP2zQtuBsXVZ54fjpQBgg38ImesZ0C2eZN/LheynxpLRM7kxH0cp8KJ1W0wTmMcaVtwNi6rPPCgJV27hF6OETP2zTdmmTfy4XufjSBgg38Iz6xROq2uCeGONAFomdyY93Lyp5d27hF6OETP20LbobF1WeeFAlgpN8xGfWgblz3/OsrZ9OT18vvrKAFsBAviZGOOVI1632uGUdfyoGgq8L03euUU5aeGz8bvlMUAreLZuiIHPPGobrK7fM6NTs2YctShupOKWwfprjyTx7q29YXa82CzgNtly0uSG03Sq4P2i8MhhAOZ6Axz1a7NaXVqccbdWtRJUpSFEknicKBrSekHLQ6p55ZW4sypSjiT8gBAAGAAAFalbQ0a9+yc/gV91J/dr37Jz+BX3UGtWVtHRj37Fz+BX3VidGPHJlz+BX3UAWOyLdWlttJWtRhKQJJJ4VfurvVm3o9CbQ8EuWqO9DU8E81e98MJk9U/YJFgaDz4T6U4MQY9Sk5IHvHifDIYzRgKkX5jrl50BAhwErMBPHIRxJnuql9Z2tRTt+yWFcMCUrdHtOc0oPBGeOau7Pb1y9sXnlKsVkQ5sU4PuISqHFfswQPYHE8ThkMap/u179i5/Ar7qDVrK2v7se/YufwK+6sGjXv2Tn8CvuoNWn7FZFuuJbbSVrWQEpGZJ4UX92vfsnP4FfdV1akuxGwQLbaEQ44k7MKEbNs/Sx+kryHeaD3NWPYBqws3lwq0rHrFj6IOOzR7o4niceQEtL5BuCIy6xS2mZFzxu/wC1OJu3cYvR0mftmgFxoNi8nPLGkaTtcVcMMKGzgzvzHvZT40tomdzKMbvPwoEL5BuYRl1jKjcbDYvJzyx/HSiSU3cYvR0mftmmrPM78xH0sp8aAmkbTFWYwwoduZuYRN3rGVY/M7mUY3cp8Kd3bvC9HSZ++aDT0vollxu460h1BMXXEhQ7xhgetV5p3UnZ3gpdlcNnVPsKlbfgSb6fie6rKs8zvzEfSynxrLRM7kx7uU+FBUth7SaX0R6u2sqtNmThtEm8pCR9VecAcHByxFWJ2c7UWW1o2lldCz9JCsFo/eTmMs8RXtm7cjC9HSZ++aimkNX9leXtglVmfGKXmDs1Xuo9lXWRQSlpsOC8rPLD8daAPkm5hEx1jKvAszlus5uPRamh+vYTdcH+Y0MFHq2SfdqQpcQpAKYkjD60xyzmgxxOyxTxwxpW2w4Lys8sKGzzO/lGF7n40NomdyYj6OU+FAqXyTcwjLrFE6nZYp44Y0aym7hF6OETP203Zpk38uF7/egJtoOC8rPLCgS+VG4Yg4dax+Z3Jj3cp8KdWU3cIvRwzn7aDPQU8z5fdWVrXXPe86ygfU+Fi4AZPOhR6rPGeXT86NbISLwzFBZjtJvcMo6/lQYpkuG8DAPPpSqfCxcEyeJ6Y/KgfeLZujLrTq2QgXhmPnhQCg7L2sZ5dPzpFMle8DAPP4UtnO0m9wyjrQuvFBujIUBqf2guiQTz6Y0iDsvaxnl0pX2g2LwzHOks52k3uGUdaAVMFZviADz6YfKjW8HBdAIJ50Cnig3RkKN5oNi8nMc6BEK2WBxnl0pCyVm+DgcY44Vln9ZN7hlFIt4pN0ZCgNT1/dEg9aRCtlgrGeVK82GxeTn1obP6yb3DKKDCyVG+DgcYpVvBzdGBzxoVPFJuDIYUbzYbF5OfWgRCtlgcZxwoSwSb+EZx0pbONpirhyoVPFJuDIYeFAa3Q5ujDjjWIXssDjOOHwpX2g2Lyc8saSzp2glWYwwoBLBJvyIz6xnRLc2u6MOOP460JeINzhMeGVG+2GxeTnljQIheywOM44fjpQ7Ezfwj2o4xnRWdO0EqzGGFDtjNzhN3wyoCWvabow44/jrWIc2W6ceOFK+gNiU55Y1jCA4JVnlhQBsTO0wj2o4xnRLXtd0YRjjQ7Y3rnCbvhlR2hAbF5OZwxoEQ5st048cPx0odgQb+Ee1HnRsNhwXlZ5YUG2JVc4THhQEtW1wGEY40qHQ2LpxOeFJaBsxKeOGNKw2HBeVnlhQAGCDfkRnRLVtcBhGONAh4k3DlMeFG+NninjzoFQ6G904nPCgSwUm+chjHGjZbDgvKz6UCHio3DllQOenJ5HyrKX0NPX41lB//2Q==",
    //adidas
    "https://cdn.imgbin.com/9/2/7/imgbin-adidas-logo-adidas-adidas-logo-9G45F5g1MtbZKnnLP8bfnDy3J.jpg"
  ];




  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: scaffoldkey,

      drawer: navigationDrawer(),
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(ColorCode.Color_White),
        title: Text(string.brands, style: TextStyle(fontWeight: FontWeight.w700,
            color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
        titleSpacing: 30,
        actions: <Widget>[
          Center(


            child: Container(
              width: 100,
              padding: const EdgeInsets.only(right: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(new PageRouteBuilder(
                              opaque: true,
                              transitionDuration: const Duration(milliseconds: 0),
                              pageBuilder: (BuildContext context, _, __) {
                                return new CartScreen();
                              }));
                        },
                        child:
                        Container(child: Image.asset(
                          "assets/icon/shopping_cart.png",
                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                          height: 30,
                          width: 30,
                        ),),),


                    ],
                  ),
                  //  if (constantKey.cartCount != 0)
                  Positioned(
                    top: 10,
                    right: 14,
                    child: Container(

                      padding: EdgeInsets.only(left:
                      5, right: 5, top: 2, bottom: 2
                      ),
                      decoration: BoxDecoration(

                          shape: BoxShape.circle,
                          color: getColorFromHex("#00C4D3")),
                      alignment: Alignment.center,
                      child: Text("0", style: TextStyle(fontSize: 12),),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Center(
            child: InkWell(
              child: Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.only(right: 15),
                  child: profile != null
                      ? ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        profile!,
                        fit: BoxFit.fill,
                      ))
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset("assets/image/blank.webp"))),
              onTap: () {

              },
            ),
          ),
        ],
        leadingWidth: 40,
        leading: InkWell(
          child: Container(
            padding: EdgeInsets.only(left: 15),

            child: Image.asset(drawer_icon, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),),
          ),
          onTap: () {
            scaffoldkey.currentState?.openDrawer();
          },
        ),
      ),
      body: SafeArea(


          child: Container(
            height: MediaQuery.of(context).size.height,
            color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
            child: SingleChildScrollView(
              child:

              Column(

                children: [


                  Row(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.1,
                        margin: EdgeInsets.only(left: 18, top: 10),
                        decoration: BoxDecoration(
                            color:  isDark?Colors.black54:getColorFromHex(ColorCode.Color_White),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color:  isDark?Colors.white24:Colors.black12.withOpacity(0.3),
                                spreadRadius: 1,

                                blurRadius: 5,)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Image.asset(
                                "assets/icon/search.png",
                                color:  isDark?Colors.white:getColorFromHex(
                                    ColorCode.Color_darkblue),
                                height: 20,
                                width: 20,
                              ),),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Flexible(
                                child: TextFormField(
                                    decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: string.search,
                                        hintStyle: TextStyle(
                                          color:  isDark?Colors.white:getColorFromHex("#C2D2D3"),
                                          fontSize: 15,
                                        )
                                    )),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.only(right: 15),

                                child: Image.asset(
                                  "assets/icon/equalizer.png",
                                  color: isDark?Colors.white:getColorFromHex(
                                      ColorCode.Color_menu_icon),
                                  height: 20,
                                  width: 20,
                                ),),
                              onTap: () {

                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


SizedBox(height: 15,),
        Container(
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width/1.1 ,
          child: GridView.builder(
              padding: const EdgeInsets.only(left: 5, right: 5),
              physics: NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery
                      .of(context)
                      .orientation ==
                      Orientation.landscape
                      ? 2
                      : 2,

                  mainAxisSpacing: 10,
                  crossAxisSpacing: 14,
                  childAspectRatio: 2 / 2.1),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {

                    },
                    child: Card(
                      color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 0,

                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 100,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                  color: getColorFromHex(color[index]),
                                /*  boxShadow: [
                                    BoxShadow(
                                      color:  isDark?Colors.white24:Colors.black12,
                                      spreadRadius:3,

                                      blurRadius: 5,)
                                  ]*/
                              ),
                             /*   child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.fill,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 100,
                                  ),
                                ),*/
                            ),

                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,

                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius
                                        .circular(8.0),
                                    color:  isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:  isDark?Colors.white:Colors.black26,
                                        blurRadius:8.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(0.0,
                                           0), // shadow direction: bottom right
                                      )
                                    ],
                                  ),

                                  child: Container(
                                    margin: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            product_name[index],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: isDark?Colors.white: getColorFromHex(
                                                    ColorCode
                                                        .Color_darkblue),
                                                fontWeight: FontWeight
                                                    .w700
                                            ),
                                          ),

                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Container(
                                              child: Text(
                                                "8 Product",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color:  isDark?Colors.white:getColorFromHex(
                                                        ColorCode
                                                            .Color_darkblue),
                                                    fontWeight: FontWeight
                                                        .normal
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Container(
                                              child: Image.asset(
                                                "assets/icon/star.png",
                                                color: Colors.amber,
                                                height: 15,
                                                width: 15,
                                              ),),
                                            Text(
                                              "4.3",
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color:  isDark?Colors.white:getColorFromHex(
                                                    ColorCode
                                                        .Color_darkblue),
                                                fontWeight: FontWeight
                                                    .w900,
                                              ),
                                            ),

                                          ],
                                        ),

                                        SizedBox(height: 15,),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        )));
              }),)
                ],
              ),
            ),
          )
      ),
    );


  }







}
