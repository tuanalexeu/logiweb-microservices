package com.alekseytyan.dto;

import com.alekseytyan.entity.enums.LoadStatus;
import lombok.Data;

@Data
public class LoadDTO {
    private int id;

    private String name;

    private int weight;

    private OrderDTO order;

    private LoadStatus status;
}