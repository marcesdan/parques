// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'parques.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'parques.UserRole'
grails.plugin.springsecurity.authority.className = 'parques.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/**',               access: ['permitAll']],
        [pattern: '/assets/**',      access: ['permitAll']],
        [pattern: '/**/js/**',       access: ['permitAll']],
        [pattern: '/**/css/**',      access: ['permitAll']],
        [pattern: '/**/images/**',   access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']],
        [pattern: '/areaProtegida/**', access: ['ROLE_ADMIN']],
        [pattern: '/especie/**', access: ['ROLE_ADMIN']],
]
grails.plugin.springsecurity.filterChain.chainMap = [
        [pattern: '/assets/**',      filters: 'none'],
        [pattern: '/**/js/**',       filters: 'none'],
        [pattern: '/**/css/**',      filters: 'none'],
        [pattern: '/**/images/**',   filters: 'none'],
        [pattern: '/**/favicon.ico', filters: 'none'],
        [pattern: '/**',             filters: 'JOINED_FILTERS']
]
grails.views.json.compileStatic = false

