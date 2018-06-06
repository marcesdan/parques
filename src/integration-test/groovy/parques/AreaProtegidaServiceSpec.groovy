package parques

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class AreaProtegidaServiceSpec extends Specification {

    AreaProtegidaService areaProtegidaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new AreaProtegida(...).save(flush: true, failOnError: true)
        //new AreaProtegida(...).save(flush: true, failOnError: true)
        //AreaProtegida areaProtegida = new AreaProtegida(...).save(flush: true, failOnError: true)
        //new AreaProtegida(...).save(flush: true, failOnError: true)
        //new AreaProtegida(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //areaProtegida.id
    }

    void "test get"() {
        setupData()

        expect:
        areaProtegidaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<AreaProtegida> areaProtegidaList = areaProtegidaService.list(max: 2, offset: 2)

        then:
        areaProtegidaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        areaProtegidaService.count() == 5
    }

    void "test delete"() {
        Long areaProtegidaId = setupData()

        expect:
        areaProtegidaService.count() == 5

        when:
        areaProtegidaService.delete(areaProtegidaId)
        sessionFactory.currentSession.flush()

        then:
        areaProtegidaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        AreaProtegida areaProtegida = new AreaProtegida()
        areaProtegidaService.save(areaProtegida)

        then:
        areaProtegida.id != null
    }
}
