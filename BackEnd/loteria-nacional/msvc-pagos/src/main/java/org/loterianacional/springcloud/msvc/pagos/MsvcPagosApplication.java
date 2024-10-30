package org.loterianacional.springcloud.msvc.pagos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class MsvcPagosApplication {

	public static void main(String[] args) {
		SpringApplication.run(MsvcPagosApplication.class, args);
	}

}
