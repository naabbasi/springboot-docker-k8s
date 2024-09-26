package edu.learn.rest_demo;

import edu.learn.rest_demo.entities.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import edu.learn.rest_demo.repos.UserRepo;
@EnableJpaRepositories
@ComponentScan(basePackages = {"edu.learn.rest_demo.controller", "edu.learn.rest_demo.entities"})
@SpringBootApplication
public class SpringBootDockerK3dJKube {
	private final Logger log = LogManager.getLogger(SpringBootDockerK3dJKube.class);

	@Bean
	public CommandLineRunner execute(UserRepo userRepo) {
		return args -> {
			userRepo.save(new User("nabbasi", "x"));
			userRepo.save(new User("fabbasi", "x"));
			userRepo.save(new User("aabbasi", "x"));
			log.info("User count ... {}", userRepo.count());
		};
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootDockerK3dJKube.class, args);
	}

}
