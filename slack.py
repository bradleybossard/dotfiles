import pyperclip

translations = {}
words = []

f = open('slack_emoji.txt')
for line in f:
  words.append(line.strip())
f.close()

f = open('slack_translate.txt')
for line in f:
  (src, target) = line.strip().split('-')
  translations[src] = target
  print(translations[src])
f.close()

while (True):
  input_text = raw_input("Type your slack: ")

  input_text += ' '

  for key in translations.keys():
    input_text = input_text.replace(' ' + key + ' ', ' :' + translations[key] + ': ')

  for word in words:
    input_text = input_text.replace(' ' + word + ' ', ' :' + word + ': ')

  print input_text
  pyperclip.copy(input_text)
  spam = pyperclip.paste()
