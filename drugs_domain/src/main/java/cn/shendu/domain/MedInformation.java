package cn.shendu.domain;

import java.util.Date;
import cn.shendu.utils.DateUtils;

public class MedInformation {
    private Integer id;//药品信息编号
    private String medname;//药品名称
    private Date productionDate;//生产日期
    private String productionDateStr;
    private String shelflife;//保质期
    private String speciality;//药品特性
    private Double price;//价格

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMedname() {
        return medname;
    }

    public void setMedname(String medname) {
        this.medname = medname;
    }

    public Date getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(Date productionDate) {
        this.productionDate = productionDate;
    }

    public String getProductionDateStr() {
        if (productionDate != null){
            productionDateStr = DateUtils.data2String(productionDate,"yyyy-MM-dd HH:mm");
        }
        return productionDateStr;
    }

    public void setProductionDateStr(String productionDateStr) {
        this.productionDateStr = productionDateStr;
    }

    public String getShelflife() {
        return shelflife;
    }

    public void setShelflife(String shelflife) {
        this.shelflife = shelflife;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
