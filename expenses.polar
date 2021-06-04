allow(actor: String, "GET", expense: Expense) if
    expense.SubmittedBy = actor;

# RBAC
allow(actor: User, action: String, resource) if
    user_in_role(actor, role) and
    role_allow(role, action, resource);

# Call User.Roles() to determine membership
user_in_role(actor: User, role: String) if
  role in actor.Roles();

# Admins can do anything
role_allow("admin", _action, _resource);
