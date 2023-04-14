package com.josue.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.josue.savetravels.models.Expense;
import com.josue.savetravels.services.ExpenseService;

@Controller
public class ExpenseControllers {
	//this annotation will allow dependency injections from Expenseservices
	@Autowired
	ExpenseService expenseService;

	//root page of the app
	@GetMapping("/")
	public String homePage() {
		return "redirect:/expenses";
	}
	
	//this route will allow the page to render new expenses once they are created
	@GetMapping("/expenses")
	// adding Model model to render a list of all expenses and its values
	public String allExpences(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "CreateAndShowExpenses.jsp";
	
		}
	
	//post request that take the expenses info using @PostMapping from the form;form and bind it and send it to the DB.
	@PostMapping("/expenses")
	public String createExpense(@Valid @ModelAttribute("expense") Expense espense, BindingResult result, Model model) {
		//conditional statement that will redirect back to the jsp file if errors are found, if not then it will create an expense and redirect back to home
		if(result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "CreateAndShowExpenses.jsp";
		}else {
			expenseService.createExpense(espense);
			return "redirect:/expenses";
		}
	}
	// get request to edit an expense passing the expense id as a path variable and model attributes 
	@GetMapping("/expenses/edit/{id}")
	public String edit(@PathVariable("id")Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpense(id));
		return "editExpense.jsp";
	}

	// post request to update/edit an expense and redirect to the dashboard/home page
	@PostMapping("/expenses/edit/{id}")
	public String update(@PathVariable("id") Long id, Model model, @Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		// conditional statement that will check for error and redirect back to the edit page, if successful then it will edit  the expense and redirect t hoempage
		if(result.hasErrors()) {
			model.addAttribute("expense", expenseService.findExpense(id));
			return "redirect:/edit/{id}";
		}else {
			expenseService.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	 
	// a request route that will pass the id as a path variable in order to delete from DB
	@RequestMapping("/expenses/delete/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		Expense expense = expenseService.findExpense(id);
		expenseService.deleteExpense(id);
		return "redirect:/expenses";
		
	}

	//Get request passing the id as a path variable and using Model model to show the details of an expense
	@GetMapping("/expenses/{id}")
		public String expenseDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpense(id));
		return "expenseDetails.jsp";
	}





}
