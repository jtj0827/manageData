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
@ConfigurationProperties(prefix = "spring.datasource.accountmng")
@EnableTransactionManagement
@EnableJpaRepositories(
        basePackages = "com.rng.managedata.database.jpa.repository.accountMng",
        entityManagerFactoryRef = "entityManagerFactoryForAccountMng",
        transactionManagerRef = "accountMngTransactionManager")
@MapperScan(basePackages = "com.rng.managedata.database.mybatis.mapper.accountMng", sqlSessionFactoryRef = "sqlSessionFactoryForAccountMng")
public class AccountMngDatabaseConfig extends DatabaseConfig {

    @Bean(name = "dataSourceForAccountMng")
    public DataSource dataSourceForAccountMng(){
        return new LazyConnectionDataSourceProxy(new HikariDataSource(this));
    }

    @Bean(name = "entityManagerFactoryForAccountMng")
    public EntityManagerFactory entityManagerFactory(@Qualifier("dataSourceForAccountMng") DataSource dataSourceForAccountMng) {
        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setDataSource(dataSourceForAccountMng);
        factory.setPackagesToScan("com.rng.managedata.database.jpa.entity.accountMng");
        factory.setPersistenceUnitName("accountMng");
        setConfigureEntityManagerFactory(factory);

        return factory.getObject();
    }

    @Bean
    public PlatformTransactionManager accountMngTransactionManager(@Qualifier("entityManagerFactoryForAccountMng") final EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }

    @Bean(name = "sqlSessionFactoryForAccountMng")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSourceForAccountMng") DataSource dataSourceForAccountMng) throws Exception{
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        setConfigureSqlSessionFactory(sessionFactoryBean, dataSourceForAccountMng);

        return sessionFactoryBean.getObject();
    }

    @Bean(name = "sqlSessionForAccountMng")
    public SqlSessionTemplate sqlSession(@Qualifier("sqlSessionFactoryForAccountMng") SqlSessionFactory sqlSessionFactory) throws Exception{
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
