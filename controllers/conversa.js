import * as service from "../service/conversa.js"

export async function ControllerConversa (req , res , next){
    try {
        const {pergunta} = req.body

        const {resposta} = await service.ServiceConversa(pergunta)

        return res.status(200).json({Resposta : resposta})
    } catch (error) {
        return next(error)
    }
}