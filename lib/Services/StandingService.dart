import 'package:my_football_manager/Support/Export/MyExport.dart';

class StandingService {
  Future<Standing_GDT?> getTeamsStandingAndResults(
      {required BuildContext context,
      required String menuID,
      required String leagueID,
      bool isShowLoader = true,
      bool isHideLoader = true}) async {
    if (await MyNetwork().isConnectedToNetwork(context)) {
      Standing_GDT? standing_GDT;

      if (isShowLoader) {
        MyUtils.showloader(context);
      }

      //MyUtils.printMe('Service_Request: /competitions/${leagueID}/standings');

      try {
        Response response =
            await DioClient().dio.get('/competitions/${leagueID}/standings');
        MyUtils.printMe('Service_Response : $response');

        standing_GDT = Standing_GDT.parseFromJson(response.data);

        //  MyUtils.printMe("length_is_${standing_GDT.standingGroups!.length}");

        if (standing_GDT.standingGroups!.length > 0) {
          for (var item in standing_GDT.standingGroups!) {
            // MyUtils.printMe("group_table_1_${"${item.group}"}");

            for (var table in item.tablesDT!) {
              if (table.teams.id!.toDouble() == double.parse(menuID)) {
                //MyUtils.printMe("group_table_3_${"${table.teams.id}"}");

                await TeamDetailVM.addItem(TeamDetailVM(
                    stage:
                        "${MyLanguage.of(context)!.translateFromFile("Stage: ")} ${item.stage}",
                    group:
                        "${MyLanguage.of(context)!.translateFromFile("Group: ")} ${item.group}",
                    position:
                        "${MyLanguage.of(context)!.translateFromFile("Position: ")} ${table.position}",
                    played:
                        "${MyLanguage.of(context)!.translateFromFile("Played: ")} ${table.playedGames}",
                    won:
                        "${MyLanguage.of(context)!.translateFromFile("Won: ")} ${table.won}",
                    draw:
                        "${MyLanguage.of(context)!.translateFromFile("Draw: ")} ${table.draw}",
                    lost:
                        "${MyLanguage.of(context)!.translateFromFile("Lost: ")} ${table.lost}",
                    points:
                        "${MyLanguage.of(context)!.translateFromFile("Points: ")} ${table.points}",
                    goalsFor:
                        "${MyLanguage.of(context)!.translateFromFile("Goal For: ")} ${table.goalsFor}",
                    goalsAgainst:
                        "${MyLanguage.of(context)!.translateFromFile("Goal Against: ")} ${table.goalsAgainst}",
                    goalDifference:
                        "${MyLanguage.of(context)!.translateFromFile("Goal Difference: ")} ${table.goalDifference}",
                    crest: "${table.teams.crest}"));

                MyUtils.printMe(
                    "group_table_2_${"${table.teams.id!.toDouble()} == ${menuID}"}");

                break;
              }
            }
          }
        } else {
          MyUtils.showSnackBarError(
              context,
              (MyLanguage.of(context)
                  ?.translateFromFile("Something went wrong"))!);
        }

        if (isHideLoader) {
          MyUtils.hideloader();
        }

        return standing_GDT;
      } catch (e) {
        MyUtils.hideloader();
        MyUtils.showSnackBarError(context,
            (MyLanguage.of(context)?.translateFromFile("unable_to_parse"))!);

        MyUtils.printMe('Error : $e');
      }

      return null;
    }
  }
}
