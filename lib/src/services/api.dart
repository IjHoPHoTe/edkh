import 'package:dkh/src/config/env.dart';
import 'package:dkh/src/models/transaksi/TransaksiModel.dart';
import 'package:dkh/src/services/app_exception.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

mixin BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      Get.rawSnackbar(message: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      Get.rawSnackbar(message: message);
    } else if (error is ApiNotRespondingException) {
      Get.rawSnackbar(message: 'Oops! It took longer to respond');
    }
  }
}

class ApiService extends GetConnect with BaseController {
  // Future<List<ProdukData>?> produk() async {
  //   var url = Uri.parse('$BASE_URL/produk');
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var produk = produkModelFromJson(response.body);
  //     return produk.data;
  //   } else {
  //     return null;
  //   }
  // }
  Future<List<TransaksiData>?> transaksi() async {
    // final token = await getToken();
    var url = Uri.parse('$BASE_URL/semua_kas');
    final response = await http.get(url);
    if (response != null) {
      var transaksi = transaksiModelFromJson(response.body);
      return transaksi.data;
    } else {
      return null;
    }
  }
}
  // Future<Transaksi?> addProduk(String user_id, String nama_produk,
  //     String deskripsi, String stok, String harga, String image) async {
  //   dynamic body = ({
  //     "user_id": user_id,
  //     "nama_produk": nama_produk,
  //     "deskripsi": deskripsi,
  //     "stok": stok,
  //     "harga": harga,
  //     "image": image
  //   });
  //   final response = await BaseClient()
  //       .post(BASE_URL, '/produk/store', body, "")
  //       .catchError((error) {
  //     if (error is BadRequestException) {
  //       var apiError = json.decode(error.message!);
  //       Get.rawSnackbar(message: apiError["message"]);
  //     } else {
  //       handleError(error);
  //     }
  //   });
  //   print(response);
  //   if (response != null) {
  //     var log = transaksiModelFromJson(response);
  //     return log;
  //   } else {
  //     return null;
  //   }
  // }
// }
