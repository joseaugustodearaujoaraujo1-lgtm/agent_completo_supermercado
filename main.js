import "dotenv/config"
import express from "express"
import pool from "./connect/database.js"
import rotasConversa from "./routes/conversa.js"

const porta = process.env.PORTA_SERVER
const app = express()

app.use(express.json())
app.use("/api/v1" , rotasConversa)

async function VerificarConexao(){
    try {
        const pegarConexao = await pool.getConnection()
        console.log("banco conectado!")
        pegarConexao.release()
    } catch (error) {
        console.log(error.message)
    }
}
VerificarConexao()

app.use((req , res , next) => {res.status(404).json({Resposta: "Rota não encontrada!"})})
app.use((err , req , res , next) => {res.status(err.status || 500).json({Resposta: err.message || "Erro interno no servidor!"})})

app.listen(porta , () => {
    console.log("http://localhost:" + porta)
})