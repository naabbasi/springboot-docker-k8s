package edu.learn.rest_demo;

import edu.learn.rest_demo.entities.User;
import edu.learn.rest_demo.repos.UserRepo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringBootDockerMicroK8s {
    private final Logger log = LogManager.getLogger(SpringBootDockerMicroK8s.class);

    @Bean
    public ApplicationRunner execute(UserRepo userRepo) {
        return args -> {
            userRepo.save(new User("nabbasi", "x"));
            userRepo.save(new User("fabbasi", "x"));
            userRepo.save(new User("aabbasi", "x"));
            log.info("User count ... {}", userRepo.count());
        };
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringBootDockerMicroK8s.class, args);
    }

}
