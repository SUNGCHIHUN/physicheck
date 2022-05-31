package com.teampj.physicheck.es.config;

import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.RestClients;
import org.springframework.data.elasticsearch.config.AbstractElasticsearchConfiguration;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

@Configuration
@EnableElasticsearchRepositories(basePackages = "com.teampj.physicheck.es.repository")
@ComponentScan(basePackages = { "com.teampj.physicheck.es.service"})
public class ElasticConfig extends AbstractElasticsearchConfiguration {

    @Bean
    @Override
    public RestHighLevelClient elasticsearchClient() {

        ClientConfiguration clientConfiguration
            = ClientConfiguration.builder()
                .connectedTo("34.64.208.5:9200")
                .build();

        return RestClients.create(clientConfiguration).rest();                         
    }
    
    @Bean
    public ElasticsearchOperations elasticsearchTemplate() {
    	return new ElasticsearchRestTemplate(elasticsearchClient());
    }
    
}