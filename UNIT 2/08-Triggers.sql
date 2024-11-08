 Triggers
A trigger is a set of SQL instructions that automatically runs, or “fires,” in response to specific events on a table, like when you INSERT, UPDATE, or DELETE data. Triggers help automate certain actions or enforce rules in the database.

Example of a Trigger
Imagine a bank database with a transactions table and an accounts table. When money is withdrawn from an account, you want to automatically update the balance in the accounts table.

You could create a trigger to do this:

CREATE TRIGGER update_balance
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
   UPDATE accounts
   SET balance = balance - NEW.amount
   WHERE account_id = NEW.account_id;
END;

When it triggers: This runs after a new row is inserted into the transactions table.
Action: It updates the account’s balance based on the withdrawal amount (NEW.amount refers to the inserted transaction’s amount).