package edu.learn.rest_demo.repos;

import edu.learn.rest_demo.entities.User;
import org.springframework.data.repository.ListCrudRepository;

import java.util.UUID;

public interface UserRepo extends ListCrudRepository<User, UUID> {

    User findByUsername(String username);
}
