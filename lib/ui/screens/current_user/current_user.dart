import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swole_app/constants/app_strings.dart';
import 'package:swole_app/constants/colors.dart';
import 'package:swole_app/constants/dimens.dart';
import 'package:swole_app/ui/utils/ui_helper/ui_helper.dart';
import 'package:swole_app/ui/widgets/app_bar_widget.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';
import '../../../view_model/auth_view_model.dart';
import '../../utils/constants.dart';

class CurrentUserScreen extends StatefulWidget {
  const CurrentUserScreen({Key? key}) : super(key: key);

  @override
  State<CurrentUserScreen> createState() => _CurrentUserScreenState();
}

class _CurrentUserScreenState extends State<CurrentUserScreen> {
@override
  void didChangeDependencies(){
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<AuthViewModel>(context,listen: false).currentUser();
  }
  @override
  Widget build(BuildContext context) {

    debugPrint(AppConstants.checkMailStatus.toString());
    final authViewModel = Provider.of<AuthViewModel>(context).users;
    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: const AppBarWidget(title: AppStrings.currentUserTitleText),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(title: "${AppStrings.currentUserEmailText} : ${authViewModel?.data?.email}",color: AppColors.whiteColor,),
              UIHelper.verticalSpace(Dimens.size10),
              TextWidget(title: "${AppStrings.currentUserPasswordText} : ${authViewModel?.data?.password}",color: AppColors.whiteColor,),
              UIHelper.verticalSpace(Dimens.size10),
              TextWidget(title: "${AppStrings.currentUserStatusText} : ${authViewModel?.data?.status}",color: AppColors.whiteColor,),
              UIHelper.verticalSpace(Dimens.size10),
              TextWidget(title: "${AppStrings.currentUserAccessText} : ${authViewModel?.data?.lastAccess}",color: AppColors.whiteColor,),
            ],
          ),
        ),
      ),
    );
  }
}
