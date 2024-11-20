import '../../../controller/base_controller.dart';
import '../../../ui/pages/history/history_screen.dart';
import '../../../ui/pages/more/more_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class DashboardController extends BaseController {
  int currentIndex = 0;

  List pages = [
    HomeScreen(),
    HistoryScreen(),
    ProfileScreen(),
    MoreScreen(),
  ];

  void changeTab(int index) {
    currentIndex = index;
    update();
  }
}
