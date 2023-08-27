import 'package:dkh/src/models/transaksi/TransaksiModel.dart';
import 'package:dkh/src/services/api.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController {
  var isLoading = true.obs;
  var isLoadingPage = false.obs;
  var transaksi = <TransaksiData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTransaksi();
  }

  void getTransaksi() async {
    try {
      isLoading(true);
      var res = await ApiService().transaksi();
      if (res != null) {
        transaksi.value = res;
      } else {
        transaksi.value = [];
      }
    } finally {
      isLoading(false);
    }
  }

  num calculateTotal(String? jumlah) {
    num total = 0;
    if (jumlah != null) {
      total = num.parse(jumlah);
    }
    return total;
  }
}
