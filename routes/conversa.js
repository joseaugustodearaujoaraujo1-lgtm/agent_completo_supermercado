import * as controller from "../controllers/conversa.js"
import { Router } from "express"

const route = Router()

route.post("/conversa" , controller.ControllerConversa)

export default route