import pyperclip

words = []

f = open('slack_emoji.txt')
for line in f:
  words.append(line.strip())

input_text = raw_input("Type your slack: ")

input_text += ' '

for word in words:
  input_text = input_text.replace(' ' + word + ' ', ' :' + word + ': ')

print input_text
pyperclip.copy(input_text)
spam = pyperclip.paste()
