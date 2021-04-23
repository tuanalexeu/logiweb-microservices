package com.alekseytyan.service.implementation;

import com.alekseytyan.dao.api.DriverDao;
import com.alekseytyan.dto.DriverDTO;
import com.alekseytyan.entity.Driver;
import com.alekseytyan.service.api.DriverService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DriverServiceImpl extends AbstractServiceImpl<Driver, DriverDao, DriverDTO, Long> implements DriverService {

    @Autowired
    public DriverServiceImpl(DriverDao dao, ModelMapper mapper) {
        super(dao, mapper, DriverDTO.class);
    }

    @Override
    public Driver findDriverByUser(String email) {
        return getDao().findDriverByUser(email);
    }

    @Override
    public List<Driver> findCoDrivers(Long orderId) {
        return getDao().findCoDrivers(orderId);
    }
}
