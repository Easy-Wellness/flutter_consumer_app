import 'package:flutter/material.dart';
import 'package:users/screens/appointment_list/appointment_list_screen.dart';
import 'package:users/screens/appointment_list/cancel_or_reschedule_screen.dart';
import 'package:users/screens/appointment_list/collect_review_and_rating_screen.dart';
import 'package:users/screens/chat_list/chat_list_screen.dart';
import 'package:users/screens/me/me_screen.dart';

import 'screens/error/error_screen.dart';
import 'screens/explore/create_booking_screen.dart';
import 'screens/explore/explore_screen.dart';
import 'screens/explore/search_services_screen.dart';
import 'screens/explore/service_details_screen.dart';
import 'screens/loading/loading_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/me/edit_profile_screen.dart';
import 'widgets/pick_location_screen.dart';

enum RootScreen {
  exploreScreen,
  appointmentListScreen,
  chatListScreen,
  meScreen,
}

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (_) => LoginScreen(),
  LoadingScreen.routeName: (_) => LoadingScreen(),
  ErrorScreen.routeName: (_) => ErrorScreen(),

  /// Sub-screens of the root Explore Screen
  ExploreScreen.routeName: (_) => ExploreScreen(),
  PickLocationScreen.routeName: (_) => PickLocationScreen(),
  SearchServicesScreen.routeName: (_) => SearchServicesScreen(),
  ServiceDetailsScreen.routeName: (_) => ServiceDetailsScreen(),
  CreateBookingScreen.routeName: (_) => CreateBookingScreen(),

  /// Sub-screens of the root Appointment List Screen
  AppointmentListScreen.routeName: (_) => AppointmentListScreen(),
  CollectReviewAndRatingScreen.routeName: (_) => CollectReviewAndRatingScreen(),
  CancelOrRescheduleScreen.routeName: (_) => CancelOrRescheduleScreen(),

  /// Sub-screens of the root Chat List Screen
  ChatListScreen.routeName: (_) => ChatListScreen(),

  /// Sub-screens of the root Me Screen
  MeScreen.routeName: (_) => MeScreen(),
  EditProfileScreen.routeName: (_) => EditProfileScreen(),
};
