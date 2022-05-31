package com.teampj.physicheck.es.service;

import java.util.List;

import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teampj.physicheck.es.document.Sales;
import com.teampj.physicheck.es.repository.ElasticRepository;
import com.teampj.physicheck.es.repository.SalesRepository;
import com.teampj.physicheck.es.vo.SalesVO;

@Service
public class ElasticService {
	
	// 스레드 실행 여부
	public static boolean SAVE_RUNNING = false;
	
	@Autowired
	RestHighLevelClient elasticsearchClient;
	
	@Autowired
	ElasticRepository repository;
	
	@Autowired
	SalesRepository repository2;
	
	@Autowired
	
	// 결산 데이터 엘라스틱에 저장
	public void salesSave() {
		try {
			
			System.out.println("================================");
			long oracleCount = repository2.getSalesCount();
			System.out.println("oracle 데이터 개수 : " + oracleCount);

			// 인덱스 존재여부 확인
			GetIndexRequest getRequest = new GetIndexRequest("sales");
			boolean exists = elasticsearchClient.indices().exists(getRequest, RequestOptions.DEFAULT);
			
			System.out.println("exists : " + exists);
			
			// 인덱스가 없는 경우
			if (!exists) {
				
				// 인덱스 생성용 요청객체 생성
				CreateIndexRequest createRequest = new CreateIndexRequest("sales");
				
				// 인덱스 샤드 및 레플리카 세팅
				createRequest.settings(Settings.builder() 
					    .put("index.number_of_shards", 1)
					    .put("index.number_of_replicas", 1)
					);
				
				// 인덱스 매핑
				XContentBuilder builder = XContentFactory.jsonBuilder();
				builder.startObject();
				{
				    builder.startObject("properties");
				    {
				    	builder.startObject("id");
				        {
				            builder.field("type", "long");
				        }
				        builder.endObject();
				    	
				    	builder.startObject("salesDate");
				        {
				            builder.field("type", "date");
				        }
				        builder.endObject();
				        
				        builder.startObject("paymentWay");
				        {
				            builder.field("type", "keyword");
				        }
				        builder.endObject();
				        
				        builder.startObject("total");
				        {
				            builder.field("type", "integer");
				        }
				        builder.endObject();
				    }
				    builder.endObject();
				}
				builder.endObject();
				createRequest.mapping(builder);
				
				// 인덱스 생성
				CreateIndexResponse createIndexResponse = elasticsearchClient.indices().create(createRequest, RequestOptions.DEFAULT);
				boolean acknowledged = createIndexResponse.isAcknowledged(); // 생성 여부 확인
				
				if (acknowledged) {
					System.out.println("인덱스 생성됨");
				} else {
					System.out.println("인덱스 생성 실패");
				}
			}
			
			long elasticCount = repository.count();
			System.out.println("elastic 데이터 개수 : " + elasticCount);
			System.out.println("================================");
			
			// 작업이 실행중인경우
			if (SAVE_RUNNING) {
				System.out.println("현재 Elastic에 결산 데이터를 저장하는 작업이 실행중입니다.");
				System.out.println();
			// 데이터가 변경되지 않은 경우
			} else if (oracleCount == elasticCount) {
				System.out.println("데이터 변경이 없어, 작업을 수행하지 않습니다.");
				System.out.println();
			} else {
				SAVE_RUNNING = true;
				List<SalesVO> list = repository2.findAll();
				ElasticThread elasticThread = new ElasticThread();
				elasticThread.setList(list);
				
				Thread thread = new Thread(elasticThread, "es-thread");
				
				thread.start();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// elasticsearch 저장용 스레드
	public class ElasticThread implements Runnable {

		List<SalesVO> list = null;
		
		public void setList(List<SalesVO> list) {
			this.list = list;
		}
			
		@Override
		public void run() {
			System.out.println("Elasticsearch Thread 작업 시작");
			long startTime = System.currentTimeMillis(); // 시작 시간
			// 지불 수단이 null이 아닌 경우만 저장
			for (int i=0; i<list.size(); i++) {
				if (list.get(i).getPaymentway() != null) {

					Sales sales = new Sales();
					sales.setId(list.get(i).getRn());
					sales.setSalesDate(list.get(i).getSalesdate());
					
					sales.setPaymentWay(list.get(i).getPaymentway());
					sales.setTotal(list.get(i).getTotal());

					repository.save(sales);	
				}
				
				// 마지막 데이터를 저장 완료한 경우
				if (i == list.size() - 1) {
					SAVE_RUNNING = false;
					long endTime = System.currentTimeMillis(); // 끝난 시간
					long workTime = (endTime - startTime)/1000; // 소요 시간
					System.out.println("================================");
					System.out.println("Elasticsearch Thread 작업 완료 : " + workTime + "초");
					System.out.println("================================");
				}
			}
			
		}
	}
}