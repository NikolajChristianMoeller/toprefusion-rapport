import sqlite3 from 'sqlite3';
import { open } from 'sqlite';

async function main() {
  const db = await open({
    filename: './reimbursements.db',
    driver: sqlite3.Database,
  });

  const employees = await db.all('SELECT id, name FROM employee');

  console.log('Medarbejdere:');
  console.log(employees);

  await db.close();
}

main();
