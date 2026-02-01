import sqlite3 from 'sqlite3';
import { open } from 'sqlite';

type Employee = { id: number; name: string };
type Count = { id: number; total_count: number };
type Amount = { id: number; total_amount: number };
type ApprovedPaid = {
  id: number;
  approved_amount: number;
  paid_amount: number;
};

async function main() {
  const db = await open({
    filename: './reimbursements.db',
    driver: sqlite3.Database,
  });
  const employees = await getEmployees(db);
  console.log(employees);
  const totalCount = await getTotalCountPerEmployee(db);
  console.log(totalCount);
  const totalAmount = await getTotalAmountPerEmployee(db);
  console.log(totalAmount);
  const totalApprovedAndPaid = await getTotalApprovedAndPaidPerEmployee(db);
  console.log(totalApprovedAndPaid);
}

async function getEmployees(db: any): Promise<Employee[]> {
  return db.all(`
    SELECT id, name
    FROM employee
  `);
}

async function getTotalCountPerEmployee(db: any): Promise<Count[]> {
  return db.all(`
    SELECT employee.id,
           COUNT(reimbursement.id) AS total_count
    FROM employee
    JOIN reimbursement ON reimbursement.submitted_by_id = employee.id
    JOIN reimbursement_status ON reimbursement.status_id = reimbursement_status.id
    WHERE reimbursement_status.status_name IN ('Godkendt', 'Udbetalt')
    GROUP BY employee.id
  `);
}

async function getTotalAmountPerEmployee(db: any): Promise<Amount[]> {
  return db.all(`
    SELECT employee.id,
           SUM(reimbursement.amount) AS total_amount
    FROM employee
    JOIN reimbursement ON reimbursement.submitted_by_id = employee.id
    JOIN reimbursement_status ON reimbursement.status_id = reimbursement_status.id
    WHERE reimbursement_status.status_name IN ('Godkendt', 'Udbetalt')
    GROUP BY employee.id
  `);
}

async function getTotalApprovedAndPaidPerEmployee(
  db: any,
): Promise<ApprovedPaid[]> {
  return db.all(`
    SELECT employee.id,
           SUM(CASE WHEN reimbursement_status.status_name = 'Godkendt'
                    THEN reimbursement.amount ELSE 0 END) AS approved_amount,
           SUM(CASE WHEN reimbursement_status.status_name = 'Udbetalt'
                    THEN reimbursement.amount ELSE 0 END) AS paid_amount
    FROM employee
    LEFT JOIN reimbursement ON reimbursement.submitted_by_id = employee.id
    LEFT JOIN reimbursement_status ON reimbursement.status_id = reimbursement_status.id
    GROUP BY employee.id
  `);
}


main();
