package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.LoginLogEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoginLogRepository extends JpaRepository<LoginLogEntity, Long> {

}
