


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/icon_broken.dart';

class ContentType {
  final String message;

  final Color? color;

  ContentType(this.message, [this.color]);

  static ContentType failure = ContentType('failure', AppUi.colors.failureRed);
  static ContentType success =
      ContentType('success', AppUi.colors.successGreen);
  
}
class AppUtil {
   static appCachedImage({imgUrl,width,height}) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => ClipRRect(
                                borderRadius: BorderRadius.circular(5),

        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,

              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => appLoader(isSmall: true),
      errorWidget: (context, url, error) =>  Icon(IconBroken.Shield_Fail,color: AppUi.colors.brownColor,)
    );
  }

   static Widget appLoader({bool isSmall=false}) => Align(
         alignment: Alignment.center,
         child: Lottie.asset(AppUi.assets.loading, height:isSmall?6.h:12.h),
       );

       static appAlert(context,
      {String? title, String? msg, ContentType? contentType}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        padding: EdgeInsets.only(bottom: 16.h),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: Container(
            decoration: BoxDecoration(
              color: contentType == ContentType.failure
                  ? const Color.fromARGB(255, 238, 218, 217)
                  : contentType == ContentType.success
                      ? const Color.fromARGB(255, 187, 216, 203)
                      : const Color.fromARGB(255, 240, 213, 186),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: contentType == ContentType.failure
                            ? AppUi.colors.failureRed
                            : AppUi.colors.successGreen
                              ,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: contentType == ContentType.failure
                          ? Image.asset(AppUi.assets.errorIcon)
                          :
                               Image.asset(AppUi.assets.successIcon)
                             ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          title ?? '',
                          fontSize: 3.sp,

                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        AppText(
                          msg ?? '',
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          fontSize: 2.sp,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))));
  }
 
}
