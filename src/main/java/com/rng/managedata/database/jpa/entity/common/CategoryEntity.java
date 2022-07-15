package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "tcategory")
@Getter@Setter
public class CategoryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;
    @Column(length = 1) private int depth;
    @Column(length = 4) private String code;
    @Column(length = 4) private String topCode;
    @Column(length = 10) private String refGubun;
    @Column(length = 30) private String name;
    @Column(columnDefinition = "bit default 1")
    private Boolean useYn;

}
