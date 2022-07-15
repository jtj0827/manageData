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
@ConfigurationProperties(prefix = "spring.datasource.servermng")
@EnableTransactionManagement
@EnableJpaRepositories(
        basePackages = "com.rng.managedata.database.jpa.repository.serverMng",
        entityManagerFactoryRef = "entityManagerFactoryForServerMng",
        transactionManagerRef = "serverMngTransactionManager")
@MapperScan(basePackages = "com.rng.managedata.database.mybatis.mapper.serverMng", sqlSessionFactoryRef = "sqlSessionFactoryForServerMng")
public class ServerMngDatabaseConfig extends DatabaseConfig {

    @Bean(name = "dataSourceForServerMng")
    @Primary
    public DataSource dataSourceForServerMng(){
        return new LazyConnectionDataSourceProxy(new HikariDataSource(this));
    }

    @Bean(name = "entityManagerFactoryForServerMng")
    @Primary
    public EntityManagerFactory entityManagerFactory(@Qualifier("dataSourceForServerMng") DataSource dataSourceForServerMng) {
        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setDataSource(dataSourceForServerMng);
        factory.setPackagesToScan("com.rng.managedata.database.jpa.entity.serverMng");
        factory.setPersistenceUnitName("serverMng");
        setConfigureEntityManagerFactory(factory);

        return factory.getObject();
    }

    @Bean
    @Primary
    public PlatformTransactionManager serverMngTransactionManager(@Qualifier("entityManagerFactoryForServerMng") final EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }

    @Bean(name = "sqlSessionFactoryForServerMng")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSourceForServerMng") DataSource dataSourceForServerMng) throws Exception{
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        setConfigureSqlSessionFactory(sessionFactoryBean, dataSourceForServerMng);

        return sessionFactoryBean.getObject();
    }

    @Bean(name = "sqlSessionForServerMng")
    public SqlSessionTemplate sqlSession(@Qualifier("sqlSessionFactoryForServerMng") SqlSessionFactory sqlSessionFactory) throws Exception{
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
