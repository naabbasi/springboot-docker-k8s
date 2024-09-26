package edu.learn.user_test;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.context.annotation.ComponentScan;

import edu.learn.rest_demo.entities.User;
import edu.learn.rest_demo.repos.UserRepo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@EnableAutoConfiguration
@ComponentScan(basePackages = {"edu.learn.rest_demo"})
@SpringBootTest(classes = UserRepo.class, webEnvironment = WebEnvironment.RANDOM_PORT)
@Execution(ExecutionMode.SAME_THREAD)
@TestMethodOrder(OrderAnnotation.class)
class UserTests {

	@Autowired
	public UserRepo userRepo;

	@Test
	@Order(1)
	void count() {
		Assertions.assertEquals(0, this.userRepo.count());
	}

	@Test
	@Order(2)
	void save() {
		this.userRepo.save(new User("rabbasi", "x"));
	}

	@Test
	@Order(3)
	void findSavedUser() {
		User user = this.userRepo.findByUsername("rabbasi");
		Assertions.assertEquals("rabbasi", user.getUsername());
	}

	@Test
	@Order(4)
	void updateUser() {
		User user = this.userRepo.findByUsername("rabbasi");
		Assertions.assertEquals("rabbasi", user.getUsername());

		user.setUsername("iabbasi");

		this.userRepo.save(user);
	}

	@Test
	@Order(5)
	void findUpdatedUser() {
		User user = this.userRepo.findByUsername("iabbasi");
		Assertions.assertEquals("iabbasi", user.getUsername());
	}
}