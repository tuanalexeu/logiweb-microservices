package com.alekseytyan.logiweb.service.implementation;

import com.alekseytyan.logiweb.aspect.CrudAnnotation;
import com.alekseytyan.logiweb.dto.DriverDTO;
import com.alekseytyan.logiweb.dto.DriverStatsDTO;
import com.alekseytyan.logiweb.dto.LorryDTO;
import com.alekseytyan.logiweb.dto.OrderDTO;
import com.alekseytyan.logiweb.util.pathfinding.Route;
import com.alekseytyan.logiweb.dao.api.DriverDao;
import com.alekseytyan.logiweb.entity.Driver;
import com.alekseytyan.logiweb.service.api.DriverService;
import com.alekseytyan.logiweb.service.api.OrderService;
import com.alekseytyan.logiweb.util.date.DateChecker;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DriverServiceImpl extends AbstractServiceImpl<Driver, DriverDao, DriverDTO, Long> implements DriverService {

    private final OrderService orderService;

    @Autowired
    public DriverServiceImpl(DriverDao dao,
                             ModelMapper mapper,
                             OrderService orderService) {

        super(dao, mapper, DriverDTO.class, Driver.class);

        this.orderService = orderService;
    }

    @Override
    @Transactional
    @CrudAnnotation(code = "driver")
    public DriverDTO save(DriverDTO driverDTO) {
        return super.save(driverDTO);
    }

    @Override
    @Transactional
    @CrudAnnotation(code = "driver")
    public DriverDTO update(DriverDTO driverDTO) {
        return super.update(driverDTO);
    }

    @Override
    @Transactional(readOnly = true)
    public DriverDTO findDriverByUser(String email) {
        return convertToDTO(getDao().findDriverByUser(email));
    }

    @Override
    @Transactional(readOnly = true)
    public List<DriverDTO> findCoDrivers(Long orderId) {
        return convertToDTO(getDao().findCoDrivers(orderId));
    }

    @Override
    @Transactional(readOnly = true)
    public List<DriverDTO> findSuitableDrivers(OrderDTO orderDTO, Route route, LorryDTO lorryDTO) {
        String cityName = lorryDTO.getCity().getName();

        // Checks whether a driver hasn't reached hours limit in the current month
        DateChecker dateChecker;
        if(route.isPossible()) {
            dateChecker = DateChecker.calculateHoursInMonth(route.getTime());
            return convertToDTO(getDao().findSuitableDrivers(cityName, dateChecker.getHours()));
        }

        return convertToDTO(getDao().findSuitableDrivers(cityName, 177));
    }

    @Override
    @Transactional(readOnly = true)
    public List<DriverDTO> findWithoutUser() {
        return convertToDTO(getDao().findWithoutUser());
    }

    @Override
    @Transactional(readOnly = true)
    public DriverStatsDTO getStatistics() {
        DriverStatsDTO driverStatsDTO = new DriverStatsDTO();

        driverStatsDTO.setAvailable(getDao().countAvailable());
        driverStatsDTO.setUnavailable(getDao().countUnavailable());

        return driverStatsDTO;
    }

    @Override
    @Transactional
    @CrudAnnotation(code = "driver")
    public DriverDTO delete(DriverDTO driverDTO) {

        if(driverDTO.getOrder() != null) {
            // Set order as null in dependencies
            driverDTO.getOrder().getDrivers().remove(driverDTO);

            if(driverDTO.getOrder().getDrivers().size() == 0) {
                OrderDTO orderDTO = orderService.findById(driverDTO.getOrder().getId());

                orderService.delete(orderDTO);
            }
        }

        DriverDTO refreshedDriverDTO = update(driverDTO);

        return super.delete(refreshedDriverDTO);
    }

    @Override
    @CrudAnnotation(code = "update")
    @Transactional
    public DriverDTO deleteById(Long entityId) {

        DriverDTO driverDTO = findById(entityId);

        return delete(driverDTO);
    }
}
