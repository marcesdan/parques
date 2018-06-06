package parques

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ObjetivoServiceSpec extends Specification {

    ObjetivoService objetivoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Objetivo(...).save(flush: true, failOnError: true)
        //new Objetivo(...).save(flush: true, failOnError: true)
        //Objetivo objetivo = new Objetivo(...).save(flush: true, failOnError: true)
        //new Objetivo(...).save(flush: true, failOnError: true)
        //new Objetivo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //objetivo.id
    }

    void "test get"() {
        setupData()

        expect:
        objetivoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Objetivo> objetivoList = objetivoService.list(max: 2, offset: 2)

        then:
        objetivoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        objetivoService.count() == 5
    }

    void "test delete"() {
        Long objetivoId = setupData()

        expect:
        objetivoService.count() == 5

        when:
        objetivoService.delete(objetivoId)
        sessionFactory.currentSession.flush()

        then:
        objetivoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Objetivo objetivo = new Objetivo()
        objetivoService.save(objetivo)

        then:
        objetivo.id != null
    }
}
