package com.teampj.physicheck.es.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import com.teampj.physicheck.es.document.Sales;

@Repository
public interface ElasticRepository extends ElasticsearchRepository<Sales, String>{}