package com.example.bdlugosz.airport;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.support.ErrorPageFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import java.util.Locale;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");
	}

	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver slr = new SessionLocaleResolver();
		slr.setDefaultLocale(Locale.US); // Set default Locale as US
		return slr;
	}

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource source = new ReloadableResourceBundleMessageSource();
		source.setBasenames("i18n/messages");  // name of the resource bundle
		source.setUseCodeAsDefaultMessage(true);
		return source;
	}

	/**
	 * Add interceptor to allow pizza app to change language
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
	}

	/**
	 * set custom param of pizzas app to change locale with value "lang"
	 * @return localchangeinterceptor of pizzas app
	 */
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		lci.setParamName("lang");
		return lci;
	}

	/**
	 * Introduce a Tiles view resolver, this is a convenience implementation that extends URLBasedViewResolver.
	 *
	 * @return tiles view resolver
	 */
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver resolver = new TilesViewResolver();
		resolver.setViewClass(TilesView.class);
		return resolver;
	}


	/**
	 * Initialise Tiles on application startup and identify the location of the tiles configuration file, tiles.xml.
	 *
	 * @return tiles configurer
	 */
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] { "/WEB-INF/tiles/tiles.xml" });
		configurer.setCheckRefresh(true);
		return configurer;
	}

	@Bean
	public ErrorPageFilter errorPageFilter() {
		return new ErrorPageFilter();
	}

	@Bean
	public FilterRegistrationBean disableSpringBootErrorFilter(ErrorPageFilter filter) {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
		filterRegistrationBean.setFilter(filter);
		filterRegistrationBean.setEnabled(false);
		return filterRegistrationBean;
	}

//	/**
//	 * Set custom error pages
//	 * @return EmbeddedServletContainerCustomizer
//	 */
//	@Bean
//	public EmbeddedServletContainerCustomizer containerCustomizer() {
//
//		return (container -> {
//
//			ErrorPage error400Page = new ErrorPage(HttpStatus.BAD_REQUEST, "/400.html");
//			ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/401.html");
//			ErrorPage error403Page = new ErrorPage(HttpStatus.FORBIDDEN, "/403.html");
//			ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404.html");
//			ErrorPage error405Page = new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED, "/405.html");
//			ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");
//
//			container.addErrorPages(error401Page, error403Page, error404Page, error405Page, error500Page,error400Page);
//		});
//	}
}
