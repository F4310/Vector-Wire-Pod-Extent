
class VectorSendAction{

  goExplorer(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=explore_start&serial=$serial");

    final response = await http.get(url);
  }

  goDance(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_imperative_dance&serial=$serial");

    final response = await http.get(url);
  }

  goHome(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_system_charger&serial=$serial");

    final response = await http.get(url);
  }
  goSleep(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_system_sleep&serial=$serial");

    final response = await http.get(url);
  }

  goWeather(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_weather_extend&serial=$serial");

    final response = await http.get(url);
  }

  goPicture(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_photo_take_extend&serial=$serial");

    final response = await http.get(url);
  }
  goComeHere(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_imperative_come&serial=$serial");

    final response = await http.get(url);
  }

  goPlayCube(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_play_rollcube&serial=$serial");

    final response = await http.get(url);
  }

  goTrick(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_play_anytrick&serial=$serial");

    final response = await http.get(url);
  }

  goFecthCube(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_imperative_fetchcube&serial=$serial");

    final response = await http.get(url);
  }

  sayTime(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_clock_time&serial=$serial");

    final response = await http.get(url);
  }

  popaWheelie(String ip, String serial) async {
    var url =
    Uri.parse("http://$ip/api-sdk/cloud_intent?intent=intent_play_popawheelie&serial=$serial");

    final response = await http.get(url);
  }

  streamingOn(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/begin_cam_stream?serial=$serial");

    await http.get(url);
  }
  streamingOff(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/stop_cam_stream?serial=$serial");

    await http.get(url);
  }

  assumeVec(String ip, String serial) async{
    var url =
     Uri.parse("http://$ip/api-sdk/assume_behavior_control?serial=$serial");

     await http.get(url);
  }

  releaseVec(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/release_behavior_control?serial=$serial");

    await http.get(url);
  }
  moveForward(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=140&rw=140&serial=$serial");

    await http.get(url);
  }

  moveBack(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=-150&rw=-150&serial=$serial");

    await http.get(url);
  }

  moveBackLeft(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=-100&rw=190&serial=$serial");

    await http.get(url);
  }

  moveBackRight(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=-190&rw=100&serial=$serial");

    await http.get(url);
  }

  moveLeft(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=-150&rw=150&serial=$serial");

    await http.get(url);
  }
  moveForwardLeft(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=100&rw=190&serial=$serial");

    await http.get(url);
  }

  moveRight(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=150&rw=-150&serial=$serial");

    await http.get(url);
  }

  moveForwardRight(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=190&rw=100&serial=$serial");

    await http.get(url);
  }

  moveStop(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/move_wheels?lw=0&rw=0&serial=$serial");

    await http.get(url);
  }


  EyesColor(String ip, String serial, int color) async{
    var url =
    Uri.parse("http://$ip/api-sdk/eye_color?color=$color&serial=$serial");

    await http.get(url);
  }

  AlexaSign(String ip, String serial) async{
    var url =
    Uri.parse("http://$ip/api-sdk/alexa_sign_in?serial=$serial");

    await http.get(url);
  }


  TextSay(String ip, String serial, String text)async{
    await assumeVec(ip, serial);
    var url = Uri.parse("http://$ip/api-sdk/say_text?text=$text&serial=$serial");
    await http.get(url);
    await releaseVec(ip, serial);

  }

  Future<String>GetNumPhoto(String ip, String serial)async{

    var url = Uri.parse("http://$ip/api-sdk/get_image_ids?serial=$serial");
    final  response =  await http.get(url);
    return response.body;

  }

  Future<void> AjusteVolume(String ip, String serial, double value) async{

    int valor = (value*5).toInt();
    var url = Uri.parse("http://$ip/api-sdk/volume?volume=$valor&serial=$serial");
    final response = await http.get(url);

  }

  Future<List<String>>GetPhotos(String ip, String serial) async {

    var response = await GetNumPhoto(ip, serial);
    var jsonDecoded = await json.decode(response);

    int tamanho = jsonDecoded.length;

    List<String> minPhotos= [];

    for(int i = tamanho; i>0; i--){

      int indice = jsonDecoded[i-1];

      minPhotos.add("http://$ip/api-sdk/get_image?serial=$serial&id=$indice");
    }

    return minPhotos;


  }

  DeletePhoto(String ip, String serial, String urlPhoto)async{

    Uri uri = Uri.parse(urlPhoto);
    String? id = uri.queryParameters['id'];

    await assumeVec(ip, serial);
    var url = Uri.parse("http://$ip/api-sdk/delete_image?serial=$serial&id=$id");
    http.get(url);
    return true;

  }


}