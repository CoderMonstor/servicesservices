package com.lmy.services.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {

    @Value("${image_resource.windows_load}")
    private String winPath;

    @Value("${image_resource.linux_load}")
    private String linuxPath;
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if(System.getProperty("os.name").toLowerCase().startsWith("win")){
            registry.addResourceHandler("/images/**")
                    .addResourceLocations(winPath);
        }else {
            registry.addResourceHandler("/images/**")
                    .addResourceLocations(linuxPath);
        }
    }
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("http://localhost:8080")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .exposedHeaders("Authorization")
                .maxAge(3600);
    }

}
