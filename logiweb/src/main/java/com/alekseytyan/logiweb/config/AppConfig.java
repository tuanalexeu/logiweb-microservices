package com.alekseytyan.logiweb.config;

import com.alekseytyan.logiweb.config.security.WebSecurityConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan("com.alekseytyan.logiweb")
@Import(value = {
        DataSourceConfig.class,
        DataMappingConfig.class,
        WebConfig.class,
        WebSecurityConfig.class,
        EmailConfig.class
})
public class AppConfig {
}