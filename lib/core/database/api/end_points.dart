class EndPoint {
  static const String baseUrl = 'https://gp-node-server.vercel.app/api/';
  static const String signIn = 'users/login';
  static const String signUp = 'users/signup';

  static const String question = '/question';
  static const String chefDelete = 'chef/delete';
  static const String chefGet = 'chef/get-chef/';
  static const String sendCode = 'chef/send-code';
  static const String changeForgottenPassword =
      'chef/change-forgotten-password';
  static const String updateChef = 'chef/update';
  static const String logout = 'chef/logout';
  static const String addMeal = 'meal/add-to-menu';
  static const String updateMeal = 'chef/update-meal/';
  static const String deleteMeal = 'meal/delete-meal/';
  static const String getAllMeal = 'meal/get-meals';

  static String getChefDataEndPoint(id) {
    return '$chefGet$id';
  }

  static String getUpdateMealEndPoint(id) {
    return '$updateMeal$id';
  }

  static String getDeleteMealEndPoint(id) {
    return '$deleteMeal$id';
  }

  static String getAllChefsMeals(id) {
    return 'chef/get-chef/$id/meals';
  }
}
// /chef/get-chef/653940754fdeafb89abdc0ce/meals

class ApiKeys {
  static const String id = '_id';
  static const String email = 'email';
  static const String password = 'password';
  static const String phoneNumber = 'phoneNumber';
  static const String profilePic = 'profilePic';
  static const String bio = 'bio';
  static const String message = 'message';
  static const String confirmPassword = 'confirmPassword';
  static const String code = 'code';
  static const String name = 'name';

}
