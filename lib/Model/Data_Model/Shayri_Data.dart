class ShayriData{
  ShayriData({required this.imagePath,this.title});

  final String? imagePath;
  final String? title;


  factory ShayriData.fromJson(Map json){
    return ShayriData(imagePath:json['imagePath'],title:json['title']);
  }




}