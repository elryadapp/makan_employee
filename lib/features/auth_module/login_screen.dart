import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/components/animated_commponent.dart';
import 'package:makan_employee/core/components/app_button.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/components/app_text_form_field.dart';
import 'package:makan_employee/core/components/makan_footer.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/core/utils/constants.dart';
import 'package:makan_employee/core/utils/icon_broken.dart';
import 'package:makan_employee/core/validators/validations.dart';
import 'package:makan_employee/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final String phoneCode = '+966';
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MediaQuery.of(context).viewInsets.bottom == 0
          ? Container(
              color: AppUi.colors.bgColor,
              child: const MakanFooter(
                isSFooter: true,
              ),
            )
          : Container(
              height: 0,
            ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, Routes.selectLanguage, (route) => false);

          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Column(
            children: [
              Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      MakanSlideAnimation(
                          horizontalOffset: 0,
                          verticalOffset: -100,
                          child: Container(
                            width: Constants.getwidth(context),
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppUi.colors.whiteColor),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  AppText(
                                    LocaleKeys.AuthWords_Login.tr(),
                                    fontSize: 3.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                 
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: MakanButton(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          height: 5.h,
                                          border: Border.all(
                                              color: AppUi
                                                  .colors.shimmerBaseColor),
                                          color: AppUi.colors.whiteColor,
                                          titleWidget: CountryCodePicker(
                                            padding: EdgeInsets.zero,
                                            // onChanged: (val) {
                                            //   if (val.code != '') {}
                                            // },
                                            dialogSize: Size(
                                                Constants.getwidth(context) *
                                                    .8,
                                                Constants.getHeight(context) *
                                                    .7),
                                            dialogTextStyle: TextStyle(
                                                color: AppUi
                                                    .colors.lightGreyColor),
                                            searchDecoration:
                                                const InputDecoration(
                                              prefixIcon:
                                                  Icon(IconBroken.Search),
                                              hintText: 'ابحث عن الدولة',
                                            ),
                                            initialSelection: 'sa',
                                            textStyle: TextStyle(
                                                color: AppUi
                                                    .colors.lightGreyColor),
                                            flagDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            enabled: false,
                                            showCountryOnly: false,
                                            showOnlyCountryWhenClosed: false,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: AppTextFormFeild(
                                          textInputType: TextInputType.phone,
                                          isFilled: true,
                                          controller: _phoneController,
                                          validator: (phone) =>
                                              AppValidations.phoneValidation(
                                                  phoneCode + phone!),
                                          hint: LocaleKeys.AuthWords_PhoneNumber
                                              .tr(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  AppTextFormFeild(
                                    obscureText: isVisable,
                                    isFilled: true,
                                    onTapSuffixIcon: () {
                                      setState(() {
                                        isVisable = !isVisable;
                                      });
                                    },
                                    suffixIcon: Icon(
                                      isVisable
                                          ? IconBroken.Show
                                          : IconBroken.Hide,
                                      color: !isVisable
                                          ? AppUi.colors.brownColor
                                          : AppUi.colors.lightGreyColor,
                                    ),
                                    prefixIcon: const Icon(IconBroken.Lock),
                                    controller: _passwordController,
                                    validator: (confirmPassword) =>
                                        AppValidations
                                            .confirmPasswordvalidation(
                                                _passwordController.text,
                                                confirmPassword!),
                                    hint: LocaleKeys.AuthWords_Password.tr(),
                                  ),
                              
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  BlocBuilder<AuthCubit, AuthState>(
                                    builder: (context, state) {
                                      var cubit = AuthCubit.get(context);
                                     if(state.loginStatus==LoginStatus.loading){
return AppUtil.appLoader(isSmall: true);
                                     }
                                     else{
                                       return MakanButton(
                                        height: 4.h,
                                        onTap: () {
                                          if (_loginFormKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            cubit
                                                .authLogin(
                                                  context,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                    phoneNumber:  
                                                        _phoneController.text)
                                              ;
                                          } else {
                                            return;
                                          }
                                        },
                                        color: AppUi.colors.brownColor,
                                        title:
                                            LocaleKeys.AuthWords_SignUpNow.tr(),
                                        borderRadius: BorderRadius.circular(20),
                                      );
                                     }
                                    }
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  )),
            
        
            ],
          ),
        ),
      ),
    );
  }
}
