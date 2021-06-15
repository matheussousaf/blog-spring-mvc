package br.com.unipe.sirius.blog.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan("br.com.unipe.sirius.blog")
@EnableWebMvc
public class RootConfig {

}
