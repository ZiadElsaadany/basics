//❌
class User {
  final String role;

  User(this.role);

  void accessDashboard() {
    if (role == 'admin') {
      print('Access granted to admin dashboard.');
    } else if (role == 'editor') {
      print('Access granted to editor dashboard.');
    } else {
      print('Access denied.');
    }
  }
}
/// ✅
/// 

void main(List<String> args) {

  final backendData = {"rule": "admin"}; 

  DashboardAccessRole role = UserRoleFactory.fromString(backendData['rule']!);
  role.accessDashboard(); // Admin can access everything.

}
class UserRoleFactory {
  static final Map<String, DashboardAccessRole> _roles = {
    'admin': AdminDashboardAccess(),
    'editor': EditorDashboardAccess(),
    'guest': UserDashboardAccess(),
  };

  static DashboardAccessRole fromString(String role) {
    return _roles[role] ?? UserDashboardAccess(); // default fallback
  }
}



abstract class DashboardAccessRole {
  void accessDashboard() ;
}
class  AdminDashboardAccess implements DashboardAccessRole {
  @override
  void accessDashboard() {
    print('Access granted to admin dashboard.');
  }
}
class EditorDashboardAccess implements DashboardAccessRole {
  @override
  void accessDashboard() {
    print('Access granted to editor dashboard.');
  }
}
class UserDashboardAccess implements DashboardAccessRole {
  @override
  void accessDashboard() {
    print('Access denied.');
  }
}