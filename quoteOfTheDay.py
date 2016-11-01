#!/usr/bin/python

import random as rn

scottQuotes = [
    'You miss 100% of the shots you don\'t take. -Wayne Gretzky',
    'Sometimes I\'ll start a sentence and I don\'t even know where it\'s going. I just hope I find it along the way.',
    'I\'m not superstitious but I am a little stitious.',
    'Would I rather be feared or loved? Easy. Both. I want people to be afraid of how much they love me.',
    'I am Beyonce, always',
    'Am I a hero? I really can\'t say, but yes.'
    ]
images = [
    'https://upload.wikimedia.org/wikipedia/en/d/dc/MichaelScott.png',
    'https://s-media-cache-ak0.pinimg.com/originals/ec/ea/2a/ecea2a4d6aed1b243159c3ce9356083e.jpg',
    'https://i.ytimg.com/vi/Rck_WjHgWJQ/maxresdefault.jpg',
    'http://cdn.wegotthiscovered.com/wp-content/uploads/MichaelScott1.jpg',
    'http://az616578.vo.msecnd.net/files/2016/04/14/6359624149989996021419065117_returnofkings.com.jpg'
    ]
print 'Content-type: text/html\n'

quoteIndex = rn.choice(range(5))
imageIndex = rn.choice(range(5))

print '<img width=\"420px\" height=\"300px\" src={}><br/><h3>{}</h3>'.format(images[imageIndex], scottQuotes[quoteIndex])
