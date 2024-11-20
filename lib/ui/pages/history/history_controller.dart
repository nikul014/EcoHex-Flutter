import 'dart:convert';

import '../../../constants/enums/view_state.dart';
import '../../../controller/base_controller.dart';
import '../../../data_handler/data_constants.dart';
import '../../../model/weekly_challenge_model.dart';
import '../../../utils/pagination_utils.dart';

class HistoryController extends BaseController
    with PaginationUtils<WeeklyChallenge> {
  @override
  void onInit() {
    super.onInit();
    initPagination();
  }

  updateLoader(ViewStateEnum state) {
    if (pageNo >= 1) {
      moreLoading = state;
    } else {
      setLoaderState(state);
    }
  }

  void getDataFromAPI() async {
    updateLoader(ViewStateEnum.busy);

    final Map<String, dynamic> parsedData =
        json.decode(DataConstants.weeklyChallengesJson);

    final weeklyChallengeResponse =
        WeeklyChallengeResponse.fromJson(parsedData);
    dataList = weeklyChallengeResponse.weeklyChallenges;
    updateLoader(ViewStateEnum.idle);
    // List<DataModel> temp = DataModel.fromJsonArray(result.data!['data']);
    // if (temp.isEmpty || temp.length < recordsPerPage) {
    //   hasReachedMax = true;
    // }
    // if (pageNo == 0) {
    //   dataList.clear();
    // }
    // if (temp.isNotEmpty) {
    //   dataList.addAll(temp);
    // }
    // updateLoader(ViewStateEnum.idle);
    //
    update();
  }

  @override
  bool isLoading() {
    return state == ViewStateEnum.busy || moreLoading == ViewStateEnum.busy;
  }

  @override
  void fetchData() {
    getDataFromAPI();
    update();
  }

  @override
  void loadMore() {
    // getDataFromAPI();
    // update();
  }
}

//class for query should be as below
class UserQuery {
  String getData() {
    return r'''
    query data($limit: Int, $offset: Int) {
      data(limit: $limit, offset: $offset,order_by:{created_at:desc_nulls_last}) {
        id
        name
      }
    }
    ''';
  }
}
