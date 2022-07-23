package com.rng.managedata.database.config;

import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.LazyConnectionDataSourceProxy;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

@Configuration
@ConfigurationProperties(prefix = "spring.datasource.customer")
@EnableTransactionManagement
@EnableJpaRepositories(
        basePackages = "com.rng.managedata.database.jpa.repository.customer",
        entityManagerFactoryRef = "entityManagerFactoryForCustomer",
        transactionManagerRef = "customerTransactionManager")
@MapperScan(basePackages = "com.rng.managedata.database.mybatis.mapper.customer", sqlSessionFactoryRef = "sqlSessionFactoryForCustomer")
public class CustomerDatabaseConfig extends DatabaseConfig {

    @Bean(name = "dataSourceForCustomer")
    public DataSource dataSourceForCustomer(){
        return new LazyConnectionDataSourceProxy(new HikariDataSource(this));
    }

    @Bean(name = "entityManagerFactoryForCustomer")
    public EntityManagerFactory entityManagerFactory(@Qualifier("dataSourceForCustomer") DataSource dataSourceForCustomer) {
        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setDataSource(dataSourceForCustomer);
        factory.setPackagesToScan("com.rng.managedata.database.jpa.entity.customer");
        factory.setPersistenceUnitName("customer");
        setConfigureEntityManagerFactory(factory);

        return factory.getObject();
    }

    @Bean
    public PlatformTransactionManager customerTransactionManager(@Qualifier("entityManagerFactoryForCustomer") final EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }

    @Bean(name = "sqlSessionFactoryForCustomer")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSourceForCustomer") DataSource dataSourceForCustomer) throws Exception{
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        setConfigureSqlSessionFactory(sessionFactoryBean, dataSourceForCustomer);

        return sessionFactoryBean.getObject();
    }

    @Bean(name = "sqlSessionForCustomer")
    public SqlSessionTemplate sqlSession(@Qualifier("sqlSessionFactoryForCustomer") SqlSessionFactory sqlSessionFactory) throws Exception{
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
