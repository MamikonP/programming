import telebot
import random
from telebot import types
import requests
import os

import config

bot = telebot.TeleBot(config.TOKEN)

def reply_keyboard():
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    item1 = types.KeyboardButton("Случайное число")
    item2 = types.KeyboardButton("Как ты?")
    markup.add(item1, item2)
    return markup

def inline_keyboard():
    markup = types.InlineKeyboardMarkup(row_width=2)
    item1 = types.InlineKeyboardButton("Хорошо", callback_data='good')
    item2 = types.InlineKeyboardButton("Плохо", callback_data='bad')
    markup.add(item1, item2)
    return markup

@bot.message_handler(commands=['start'])
def welcome(message):
    sti = open('static/hi.jpeg', 'rb')
    chat_id = message.chat.id
    bot.send_sticker(chat_id, sti)
    bot.send_message(chat_id, "Добро пожаловать, {0.first_name}!\nЯ " \
        "<b>{1.first_name}</b> создан для теста. Я отвечу только 3 " \
        "вопроса. Пиши имя города и я скажу температура."
            .format(message.from_user, bot.get_me()), \
        parse_mode='html', reply_markup=reply_keyboard())

@bot.message_handler(content_types=['text'])
def message(message):
    if 'private' == message.chat.type:
        if "Случайное число" == message.text:
            bot.send_message(message.chat.id, str(random.randint(1, 100)))
        elif "Как ты?" == message.text:
            bot.send_message(message.chat.id, "Нормально, а ты? :)", \
                             reply_markup=inline_keyboard())
        else:
            value = get_yandex_wheather(message.text)
            if value is None:
                bot.send_message(message.chat.id, message.text)
            else:    
                callback_message = "В {} сейчас {} целсиус." \
                                   .format(message.text, value)
                if "YANDEX_API_KEY" == value or "OPEN_WHEATER_API_KEY" == value:
                    callback_message = f"Неправильный {value} token или пустой"
                elif "No info wheather" == value:
                    callback_message = "Нет информации о погоде"
                elif "Error" in value:
                    callback_message = value              
                bot.send_message(message.chat.id, callback_message)
            

@bot.callback_query_handler(func=lambda call: True)
def callback_inline(call):
    try:
        if call.message:
            chat_id = call.message.chat.id
            if call.data == 'good':
                # bot.send_message(chat_id, "")
                bot.edit_message_text(chat_id=chat_id, \
                    message_id=call.message.message_id, text="Это круто :)", \
                    reply_markup=None)
            elif call.data == 'bad':
                bot.edit_message_text(chat_id=chat_id, \
                    message_id=call.message.message_id, text="Бывает :(", \
                    reply_markup=None)
                # bot.send_message(chat_id, "Бывает :(")
            bot.answer_callback_query(chat_id=chat_id, show_alert=True, \
                                      text="This is test notification")
    except Exception as e:
        print(repr(e))

def get_environment_variables():
    yandex_token = os.environ.get("YANDEX_API_KEY", None)
    openwheater_token = os.environ.get("OPEN_WHEATER_API_KEY", None)
    # Gyumri latitude and longitude
    latitude = os.environ.get("LATITUDE", 40.7942)
    longitude = os.environ.get("LONGITUDE", 43.84528)
    return yandex_token, openwheater_token, latitude, longitude

def get_yandex_api_params(token):
    url = "https://api.weather.yandex.ru/v2/informers"
    headers = {"Content-Type": "application/json", \
        "Accept": "application/json", "X-Yandex-API-Key": token}
    return url, headers

def get_city_geodata(city, token):
    url = "http://api.openweathermap.org/geo/1.0/" + \
          f"direct?q={city}&appid={token}"
    response = requests.get(url)
    geodata = response.json()[0] if [] != response.json() else {}
    return geodata.get("lat", None), geodata.get("lon", None)

def get_yandex_wheather(city: str = None):
    yandex_token, openwheater_token, latitude, longitude = \
                                get_environment_variables()
    if not city is None:
        if openwheater_token is None:
            return "OPEN_WHEATER_API_KEY"
        latitude, longitude = get_city_geodata(city, openwheater_token)
        if latitude is None or longitude is None:
            return None
    if yandex_token:
        url, headers = get_yandex_api_params(yandex_token)
        response = requests.get(f"{url}?lat={latitude}&lon={longitude}", \
                                headers=headers)
        if response:
            wheather_info = response.json()
            fact = wheather_info.get("fact", None)
            if fact:
                return str(fact['temp'])
            return "No info wheather"
        return "Error: " + response.text
    return "YANDEX_API_KEY"

bot.polling(none_stop=True)
