const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'gpp-software-database.cfm2e6s6mcqr.us-east-2.rds.amazonaws.com',
  database: 'BD_MOD2_GPP-SOFTWARE',
  password: 'ADS2024ess*',
  port: 5432,
  ssl: {
    rejectUnauthorized: false
  }
});

const initDB = async () => {
    try {
      const client = await pool.connect();
      console.log('Conexión correcta a PostgreSQL');
  
      const query = 'SELECT * FROM Sede';
      console.log('Ejecutando consulta:', query);
  
      const res = await client.query(query);
      console.log('Resultados de la consulta:', res.rows);
  
      await client.release();
    } catch (error) {
      console.error('Error:', error);
    }
  };

module.exports = {
  initDB,
};