import 'dart:convert';

const postsJson = """
[
  {
    "id": 1,
    "title":
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body":
        "quia et suscipitsuscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "id": 2,
    "title": "qui est esse",
    "body":
        "est rerum tempore vitaesequi sint nihil reprehenderit dolor beatae ea dolores nequefugiat blanditiis voluptate porro vel nihil molestiae ut reiciendisqui aperiam non debitis possimus qui neque nisi nulla"
  },
  {
    "id": 3,
    "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
    "body":
        "et iusto sed quo iurevoluptatem occaecati omnis eligendi aut advoluptatem doloribus vel accusantium quis pariaturmolestiae porro eius odio et labore et velit aut"
  },
  {
    "id": 4,
    "title": "eum et est occaecati",
    "body":
        "ullam et saepe reiciendis voluptatem adipiscisit amet autem assumenda provident rerum culpaquis hic commodi nesciunt rem tenetur doloremque ipsam iurequis sunt voluptatem rerum illo velit"
  },
  {
    "id": 5,
    "title": "nesciunt quas odio",
    "body":
        "repudiandae veniam quaerat sunt sed alias aut fugiat sit autem sed esvoluptatem omnis possimus esse voluptatibus quisest aut tenetur dolor neque"
  }
]
""";

class ApiFacade {
  FakeAPI fakeAPI = FakeAPI();
}

class FakeAPI {
  Future<void> fetchData() async {
    List data = await encodeAndReturnData();
    data.forEach((element) {
      print(element['id']);
      print(element['title']);
      print("=========================================");
    });
  }

  Future<void> fetchDataWithBody() async {
    List data = await encodeAndReturnData();
    data.forEach((element) {
      print(element['id']);
      print("Body of post: " + element['body']);
      print("========================================================");
    });
  }
}

Future<List> encodeAndReturnData() async {
  await Future.delayed(Duration(seconds: 2));
  var encodedVal = jsonDecode(postsJson);
  return encodedVal;
}

void main() {
  var apiFacade = ApiFacade();

  apiFacade.fakeAPI.fetchData();

  apiFacade.fakeAPI.fetchDataWithBody();

  /*
  This pattern make able to use one method/class 
  (whatever we have) within other method/class. Like a spagetti.
  */
}
