class RolePermissionUtils {
  static bool hasPermission(
    List<String> userPermissions,
    String requiredPermission,
  ) {
    return userPermissions.contains(requiredPermission);
  }

  static bool hasRole(List<String> roles, String role) {
    return roles.contains(role);
  }
}