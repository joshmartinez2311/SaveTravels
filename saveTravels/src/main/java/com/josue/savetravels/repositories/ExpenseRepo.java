package com.josue.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.josue.savetravels.models.Expense;

@Repository
public interface ExpenseRepo extends CrudRepository<Expense, Long>{
	// this method will get a list of all the expenses in the database
	List<Expense> findAll();
	
	//this method will delete an expense by the id
	void deleteById(Long id);
}
