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
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.LazyConnectionDataSourceProxy;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

@Configuration
@ConfigurationProperties(prefix = "spring.datasource.common")
@EnableTransactionManagement
@EnableJpaRepositories(
        basePackages = "com.rng.managedata.database.jpa.repository.common",
        entityManagerFactoryRef = "entityManagerFactoryForCommon",
        transactionManagerRef = "commonTransactionManager")
@MapperScan(basePackages = "com.rng.managedata.database.mybatis.mapper.common", sqlSessionFactoryRef = "sqlSessionFactoryForCommon")
public class CommonDatabaseConfig extends DatabaseConfig{
    @Bean(name = "dataSourceForCommon")
    public DataSource dataSourceForCommon(){
        return new LazyConnectionDataSourceProxy(new HikariDataSource(this));
    }

    @Bean(name = "entityManagerFactoryForCommon")
    public EntityManagerFactory entityManagerFactory(@Qualifier("dataSourceForCommon") DataSource dataSourceForCommon) {
        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setDataSource(dataSourceForCommon);
        factory.setPackagesToScan("com.rng.managedata.database.jpa.entity.common");
        factory.setPersistenceUnitName("common");
        setConfigureEntityManagerFactory(factory);

        return factory.getObject();
    }

    @Bean
    public PlatformTransactionManager commonTransactionManager(@Qualifier("entityManagerFactoryForCommon") final EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }

    @Bean(name = "sqlSessionFactoryForCommon")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSourceForCommon") DataSource dataSourceForCommon) throws Exception{
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        setConfigureSqlSessionFactory(sessionFactoryBean, dataSourceForCommon);

        return sessionFactoryBean.getObject();
    }

    @Bean(name = "sqlSessionForCommon")
    public SqlSessionTemplate sqlSession(@Qualifier("sqlSessionFactoryForCommon") SqlSessionFactory sqlSessionFactory) throws Exception{
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
