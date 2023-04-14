package com.josue.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.josue.savetravels.models.Expense;
import com.josue.savetravels.repositories.ExpenseRepo;

@Service
public class ExpenseService {
	private final ExpenseRepo expenseRepo;
	
	public ExpenseService(ExpenseRepo expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	// returns a list of all expenses
	public List<Expense> allExpenses(){
		return expenseRepo.findAll();
	}
	
	//create an expense.
	public Expense createExpense(Expense expense) {
		return expenseRepo.save(expense);
	}
	//retrieve/find an expense.
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepo.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}

	//update an expense by id.
	public Expense updateExpense(Expense expense) {
		return expenseRepo.save(expense);
	}
	
	// delete an expense by id
	public void deleteExpense(Long id) {
		Optional<Expense> optionalExpense  = expenseRepo.findById(id);
		if(optionalExpense.isPresent()) {
			expenseRepo.deleteById(id);
		}
		
	}

}	
