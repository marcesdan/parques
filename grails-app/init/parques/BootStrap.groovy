package parques

class BootStrap {

    def init = { servletContext ->

        def role = "ROLE_ADMIN"
        if (!Role.findByAuthority(role)) {
            new Role(authority: role).save()
        }
        if (!User.findByUsername('marces')) {
            def user = new User(username: 'marces', password: 'secret')
            user.save()
            def ur = new UserRole(user: user, role: Role.findByAuthority(role))
            ur.save()
        }
    }

    def destroy = {
    }
}
