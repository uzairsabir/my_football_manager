import 'package:my_football_manager/Support/Export/MyExport.dart';

class CompetitionService {
  Future<Competition_GDT?> getTeamsByLeagueID(
      {required BuildContext context,
      required String menuID,
      required String leagueID,
      bool isShowLoader = true,
      bool isHideLoader = true}) async {
    if (await MyNetwork().isConnectedToNetwork(context)) {
      Competition_GDT? competition_gdt;

      if (isShowLoader) {
        MyUtils.showloader(context);
      }

      MyUtils.printMe('Service_Request: /competitions/${leagueID}/teams');

      try {
        Response response =
            await DioClient().dio.get('/competitions/${leagueID}/teams');
        MyUtils.printMe('Service_Response : $response');

        competition_gdt = Competition_GDT.parseFromJson(response.data);

        MyUtils.printMe("length_is_${competition_gdt.teamDT!.length}");

        if (competition_gdt.teamDT!.length > 0) {
          //await MyListGridVM(parentMenuID: menuID).clearAll(context);
          int i = 0;
          for (var item in competition_gdt.teamDT!) {
            await MyListGridVM(parentMenuID: menuID).insertFav(
                context,
                item.id ?? 0,
                item.name ?? "",
                "${MyLanguage.of(context)!.translateFromFile("Short Name")}: ${item.shortName}",
                "${MyLanguage.of(context)!.translateFromFile("TLA")}: ${item.tla}",
                item.crest ?? "",
                "${MyLanguage.of(context)!.translateFromFile("Address")}: ${item.address}",
                "${MyLanguage.of(context)!.translateFromFile("Website")}: ${item.website}",
                "${MyLanguage.of(context)!.translateFromFile("Founded")}: ${item.founded}",
                "${MyLanguage.of(context)!.translateFromFile("Venue")}: ${item.venue}");

            i++;
          }
        }
        if (competition_gdt.competitionDT != null) {
          await MyListGridVM(parentMenuID: "${Menu.home.index.toDouble()}")
              .insertHome(
            context,
            competition_gdt.competitionDT!.id ?? 0,
            "${MyLanguage.of(context)!.translateFromFile("Welcome To The Football Manager \n Season ")}${competition_gdt.filtersDT!.season}",
            competition_gdt.competitionDT!.name ?? "",
            competition_gdt.competitionDT!.code ?? "",
            competition_gdt.competitionDT!.type ?? "",
            competition_gdt.competitionDT!.emblem ?? "",
          );
        } else {
          MyUtils.showSnackBarError(
              context,
              (MyLanguage.of(context)
                  ?.translateFromFile("Something went wrong"))!);
        }

        if (isHideLoader) {
          MyUtils.hideloader();
        }

        return competition_gdt;
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
