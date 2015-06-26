$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rd_insightly'
require 'coveralls'
Coveralls.wear!

TOKEN_WRONG = '123'
TOKEN = '24c00c9d-59ee-4a9a-9877-8b5f4ca874e9'

LEAD_JSON_STRING = '[{"LAST_NAME": "Petronilio", "FIRST_NAME": "Douglas", "EMAIL_ADDRESS": "teste@teste.com", "ORGANIZATION_NAME": "TESTE", "TITLE": "ENGINEER", "PHONE_NUMBER": "12345678", "WEBSITE_URL": "www.teste.com"}]'
LEAD_RESULT = JSON.parse(LEAD_JSON_STRING).first
LEAD_LIST = JSON.parse(LEAD_JSON_STRING)
