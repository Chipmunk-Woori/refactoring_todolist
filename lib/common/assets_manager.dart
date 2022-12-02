class AssetManager {
  factory AssetManager(){
    return _instance;
  }
  //factory : 새로운 인스턴스를 생성하고 싶지 않을 때 사용하는 생성자
  //기존에 생성된 인스턴스가 아니라면 새롭게 생성되고, 기존 인스턴스가 있다면 기존 것을 리턴
  // <-> constructor : 매번 인스턴스를 새로 생성하여 비용 많이 듦
  // - 기존에 이미 생성된 인스턴스가 있다면 return하여 재사용함
  // - 하나의 클래스에서 하나의 인스턴스만 생성

  AssetManager._internal();

  static final AssetManager _instance = AssetManager._internal();

  String apple = 'assets/icons/apple.svg';
  String circle = 'assets/icons/circle.svg';
  String contact = 'assets/icons/contact.svg';
  String dating = 'assets/icons/dating.svg';
}

final AssetManager assetManager = AssetManager();


