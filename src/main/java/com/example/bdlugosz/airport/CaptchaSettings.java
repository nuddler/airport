package com.example.bdlugosz.airport;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by bdlugosz on 28.12.16.
 */
//@ConfigurationProperties
@ConfigurationProperties(prefix = "google.recaptcha.key")
@Data
@Component
public class CaptchaSettings {

    private String site="site";
    private String secret="secret";
}
