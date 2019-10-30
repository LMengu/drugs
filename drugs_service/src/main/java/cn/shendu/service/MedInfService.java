package cn.shendu.service;

import cn.shendu.domain.MedInformation;

import java.util.List;

public interface MedInfService {
    public List<MedInformation> findAll() throws Exception;
}
