import 'network.dart';

const coinAPI = "https://rest.coinapi.io/v1/exchangerate/";
const ApiKey = "9EA43867-7CF4-4E12-93F7-CFA54190A4D1";

class API {
  Future<dynamic> getData(String currency, String crypto) async {
    var url = '${coinAPI}$crypto/$currency?apikey=$ApiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var Data = await networkHelper.getData();
    return Data;
  }
}
