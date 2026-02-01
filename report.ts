import sqlite3 from 'sqlite3';
import { open } from 'sqlite';

async function main() {
  const db = await open({
    filename: './reimbursements.db',
    driver: sqlite3.Database,
  });
  const employees = await getEmployees(db);
  console.log(employees);
}

async function getEmployees(db:any) {
  return await db.all(`SELECT id, name FROM employee`);
}

main();
