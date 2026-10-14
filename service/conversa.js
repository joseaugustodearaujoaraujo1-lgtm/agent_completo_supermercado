import pool from "../connect/database.js";

export function ServiceConversa (pergunta){
    try {

        if(!pergunta){
            const erro = Error("Não tem pergunta")
            erro.status = 400
            throw erro
        }
        
        return {resposta : "OK"}
    } catch (error) {
        throw error
    }
}