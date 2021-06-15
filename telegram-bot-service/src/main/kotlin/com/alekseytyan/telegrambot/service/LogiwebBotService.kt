package com.alekseytyan.telegrambot.service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.telegram.telegrambots.bots.TelegramLongPollingBot
import org.telegram.telegrambots.meta.api.methods.send.SendMessage
import org.telegram.telegrambots.meta.api.objects.Update
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup
import org.telegram.telegrambots.meta.api.objects.replykeyboard.ReplyKeyboardMarkup
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.KeyboardRow

@Service
class LogiwebBotService : TelegramLongPollingBot() {

    @Value("\${telegram.botName}")
    private val botName: String = ""

    @Value("\${telegram.token}")
    private val token: String = ""

    @Value("\${logiweb.url}")
    private val logiwebUrl: String = ""

    @Autowired
    private val clientService: ClientLoadService? = null

    override fun getBotUsername(): String = botName

    override fun getBotToken(): String = token

    override fun onUpdateReceived(update: Update) {
        if (update.hasMessage()) {
            val message = update.message
            val chatId = message.chatId

            if (message.hasText()) {
                when (message.text) {
                    "/start" -> sendNotification(chatId,"Welcome to Logiweb Client Service!")
                    "Go to website" -> {
                        execute(SendMessage()
                            .setChatId(message.chatId)
                            .setText("Go to")
                            .setReplyMarkup(InlineKeyboardMarkup().apply {
                                keyboard = listOf(
                                    listOf(InlineKeyboardButton("Our website").apply {
                                        url = logiwebUrl
                                    })
                                )
                            })
                        )
                    }
                    "Check order status" -> sendNotification(chatId,"Please, enter /check <YOUR-TOKEN>")
                    "Make new order" -> sendNotification(chatId,"Adding new order logic")
                    "About us" -> sendNotification(chatId,"Info")
                    else -> sendNotification(chatId,"Invalid command")
                }
            } else if(message.text.startsWith("/check") && message.hasText()) {
                sendNotification(chatId, clientService?.findOrder(message.text.split(" ").get(1)).toString())
            } else {
                sendNotification(chatId,"Sorry, I can't understand you!")
            }
        }
    }

    private fun sendNotification(chatId: Long, responseText: String) {
        val responseMessage = SendMessage(chatId, responseText)
        responseMessage.setParseMode("Markdown")
        responseMessage.replyMarkup = getReplyMarkup(
                listOf(
                        listOf("Check order status"),
                        listOf("Go to website", "About us")
                )
        )
        execute(responseMessage)
    }

    private fun getReplyMarkup(allButtons: List<List<String>>): ReplyKeyboardMarkup {
        val markup = ReplyKeyboardMarkup()
        markup.keyboard = allButtons.map { rowButtons ->
            val row = KeyboardRow()
            rowButtons.forEach { rowButton -> row.add(rowButton) }
            row
        }
        return markup
    }
}