import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/core/makan_cubit/makan_cubit.dart';
import 'package:makan_employee/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:makan_employee/features/game_selection_module/games_cubit/games_cubit.dart';
import 'package:makan_employee/features/main_services_module/main_services_cubit/main_services_cubit.dart';
import 'package:makan_employee/features/scanning_module/makan_scanning_cubit/makan_scanning_cubit.dart';




class BlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
         BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
           BlocProvider<MakanCubit>(
          create: (context) => MakanCubit(),
        ),
            BlocProvider<MainServicesCubit>(
          create: (context) => MainServicesCubit(),
        ),
         BlocProvider<MakanScanningCubit>(
          create: (context) => MakanScanningCubit(),
        ),
         BlocProvider<GamesCubit>(
          create: (context) => GamesCubit(),
        ),
      ];
}
