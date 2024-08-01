# Inventory Initialization
inventory <- list()

# Add Product Function
add_product <- function() {
  name <- readline("Enter product name: ")
  quantity <- as.integer(readline("Enter quantity: "))
  price <- as.numeric(readline("Enter price: "))
  
  product <- list(name = name, quantity = quantity, price = price)
  inventory[[length(inventory) + 1]] <- product
  print(paste("Product", name, "added to inventory."))
}

# Update Quantity Function
update_quantity <- function() {
  name <- readline("Enter product name: ")
  new_quantity <- as.integer(readline("Enter new quantity: "))
  
  for (product in inventory) {
    if (product$name == name) {
      product$quantity <- new_quantity
      print(paste("Quantity of", name, "updated to", new_quantity))
      return()
    }
  }
  print(paste("Product", name, "not found in inventory."))
}

# Delete Product Function
delete_product <- function() {
  name <- readline("Enter product name to delete: ")
  
  for (i in seq_along(inventory)) {
    if (inventory[[i]]$name == name) {
      inventory <<- inventory[-i]
      print(paste("Product", name, "deleted from inventory."))
      return()
    }
  }
  print(paste("Product", name, "not found in inventory."))
}

# Generate Report Function
generate_report <- function() {
  total_value <- 0
  cat("Inventory Report:\n")
  for (product in inventory) {
    cat("Product Name:", product$name, "\n")
    cat("Quantity:", product$quantity, "\n")
    cat("Price:", product$price, "\n")
    value <- product$quantity * product$price
    cat("Total Value:", value, "\n")
    total_value <- total_value + value
    cat("\n")
  }
  cat("Total Inventory Value:", total_value, "\n")
}

# Main Code Execution
choice <- ""
while (choice != "5") {
  cat("\nE-commerce Inventory Management\n")
  cat("1. Add Product\n")
  cat("2. Update Quantity\n")
  cat("3. Delete Product\n")
  cat("4. Generate Report\n")
  cat("5. Exit\n")
  
  choice <- readline("Enter your choice (1-5): ")
  
  if (choice == "1") {
    add_product()
  } else if (choice == "2") {
    update_quantity()
  } else if (choice == "3") {
    delete_product()
  } else if (choice == "4") {
    generate_report()
  } else if (choice == "5") {
    cat("Exiting program.\n")
  } else {
    cat("Invalid choice. Please enter a number between 1 and 5.\n")
  }
}
