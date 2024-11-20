class UserQueries {
  String getUserProfile(String id) {
    return '''
      query getUsers(){
        users_by_pk(id : "$id"){
          id
          full_name
          email
          phone_number
          cognito_username
      }
    }
    ''';
  }

  String reActivateAccount() {
    return r'''
    mutation reactivateUser ($email: String!) {
      reactivate_user(email: $email) {
        message
      }
    }
    ''';
  }

  String getUserEmail() {
    return """
    query getUser(\$email: String!){
      users(where: { email: {_eq: \$email}}){
        id
      }
    }
    """;
  }

  String checkUserEmail() {
    return """
    mutation emailExists(\$email: String!) {
      check_email_exists(email: \$email) {
        emailExists
      }
    }
    """;
  }

  String userSubscription() {
    return r'''
    subscription  teamMemberStatusUpdate($id: uuid!) {
      team_members_by_pk(id:$id) {
        status
        merchant {
          status
        }
      }
    }
    ''';
  }

  String checkAppVersion() {
    return r'''
    query getAppVersion {
      app_version(order_by: {created_at: desc}, limit: 1) {
        created_at
        version
        force_update
      }
    }
    ''';
  }
}
