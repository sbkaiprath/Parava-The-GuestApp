import 'package:flutter/foundation.dart';
import './trending_local_item.dart';

class TrendingLocal with ChangeNotifier {
  List<TrendingLocalItem> _items = [
    TrendingLocalItem(
        id: "m1",
        description:
            "International Theatre Festival of Kerala (ITFoK) is an international theatre festival held every year in December in Thrissur city of Kerala State, India. The festival is organised by Kerala Sangeetha Nataka Akademi and Cultural Department of Government of Kerala. The festival was started in 2008",
        title: "Thrissur Drama Festival",
        place: "Thrissur",
        imageUrl:
            'https://theatrefestivalkerala.com/wp-content/uploads/2019/12/pattela-at-home-500x500.jpg'),
    TrendingLocalItem(
        id: "m2",
        description:
            "Theyyam (Teyyam, Theyam, Theyyattam) is a popular ritual form of worship in Kerala, India, predominantly in the Kolathunadu area (consisting of present-day Kasargod, Kannur Districts, Mananthavady Taluk of Wayanad and Vadakara and Koyilandy Taluks of Kozhikode of Kerala) and also in South Canara and Kodagu of Karnataka as a living cult with several thousand-year-old traditions, rituals and customs. The performers of Theyyam belong to the lower caste community in ancient caste structure formed by Namboothiri brahmins in Kerala, and have an important position in Theyyam. The people of these districts consider Theyyam itself as a channel to a God and they thus seek blessings from Theyyam. A similar custom is followed in the Mangalore region of neighbouring Karnataka known as Bhuta Kola. ",
        title: "Theyyam",
        place: "Kannur-Kasragode",
        imageUrl:
            'https://3.bp.blogspot.com/-pG6Ev_q2J_g/WLEdp-vUvAI/AAAAAAABFIw/PfNbibSMoCkZEh5QkSJJHb4O-61M_0mpQCLcB/s1600/IMG_2191.JPG'),
    TrendingLocalItem(
        id: "m3",
        description:
            "Pulikkali  is a recreational folk art from the state of Kerala.[1] It is performed by trained artists to entertain people on the occasion of Onam, an annual harvest festival, celebrated mainly in the Indian state of Kerala. On the fourth day of Onam celebrations (Nalaam Onam), performers painted like tigers and hunters in bright yellow, red, and black dance to the beats of instruments like Udukku and Thakil. Literal meaning of Pulikkali is the 'play of the tigers' hence the performance revolve around the theme of tiger hunting. The folk art is mainly practiced in Thrissur district of Kerala. Best place to watch the show is at Thrissur on the fourth day of Onam, where Pulikkali troupes from all over the district assemble to display their skills. The festival attracts thousands of people to the Thrissur city. Pulikkali is also performed during various other festive seasons. ",
        title: "PulliKalli",
        place: "Thrissur",
        imageUrl:
            "https://i.pinimg.com/originals/4f/a8/59/4fa8592c9a9efe9d9e29d46c35f4210e.jpg"),
    TrendingLocalItem(
        id: "m4",
        description:
            "Thiruvathirakali, also known as Kaikottikkali, is a very popular group dance of Kerala. Thiruvathirakali is performed by the women of Hindu community, often during festive seasons like Onam and the Thiruvathira day in the Malayalam month of Dhanu (December- January). Performed by maids in order to attain everlasting marital bliss, Thiruvathirakali is a simple and gentle dance with the lasya element or the amorous charm predominating. The dance is performed around a nilavilakku (a ceremonial lamp) or a floral decoration especially during Onam. The dancers move in a circular pattern, accompanied by rhythmic clapping of the hands, to the tune of the Thiruvathira pattu. One of the performers sings the first line of the Thiruvathira pattu (song) while the rest repeat it in chorus. The songs are often narrations from the folk epics.",
        title: "Thiruvathira",
        place: "All Kerala",
        imageUrl:
            "https://live.staticflickr.com/3213/2861820871_8a34c4574c_b.jpg"),
    TrendingLocalItem(
        id: "m5",
        description:
            "Kolkaliis a folk art performed in North Malabar region of Kerala State in south India. There are two styles of Kolkali - The actual Kolkali and Thekkan Koladi.The actual Kolkali consists of Thacholi kali, Rajasooyam etc.The actual kolkali is almost at verge of extinction and thekkan koladi is still alive as it is added in state kololsavams. The dance performers move in a circle, striking small sticks and keeping rhythm with special steps. The circle expands and contracts as the dance progress. The accompanying music gradually rises in pitch and the dance reaches its climax. Kolkali is now a popular event in Kerala School Kalolsavam, which is considered as the biggest cultural event of Asia. ",
        title: "Kolkali",
        place: "North Malabar",
        imageUrl:
            "https://www.keralatourism.org/images/enchanting_kerala/large/popular_forms_of_kolkali_a_traditional_folk_dance20190831111455_943_1.jpg")
  ];
  List<TrendingLocalItem> get items {
    return [..._items];
  }

  TrendingLocalItem findProduct(String id) {
    return _items.firstWhere((trend) => trend.id == id);
  }
}
