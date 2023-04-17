#!/usr/bin/env python3

import rospy
import random
from std_msgs.msg import String
from io import BytesIO
from gtts import gTTS
from pydub import AudioSegment
from pydub.playback import play
from std_srvs.srv import Trigger, TriggerResponse
from imrt_speech.srv import Phrase, PhraseResponse

backup_phrase = ['I have nothing to say to you!']

class TextToSpeech:
    def __init__(self):
        if rospy.has_param('~phrases'):
            self._phrases = rospy.get_param('~phrases')
        else:
            self._phrases = backup_phrase

        self._phrase_buffer = []
        rospy.Service('~say_random', Trigger, self.random_speech_callback)
        rospy.Service('~say_phrase', Phrase, self.say_phrase_callback)

    def play_back(self, phrase):
        tts = gTTS(text=phrase, lang='en', slow=False)
        mp3_audio = BytesIO()
        tts.write_to_fp(mp3_audio)
        mp3_audio.seek(0)
        play(AudioSegment.from_mp3(mp3_audio))

    def random_speech_callback(self, request):
        phrase = random.choice(self._phrases)
        self._phrase_buffer.append(phrase)
        result = TriggerResponse()
        result.success = True
        result.message = phrase
        return result
    
    def say_phrase_callback(self, request):
        self._phrase_buffer.append(request.phrase)
        result = PhraseResponse()
        result.success = True
        result.message = request.phrase
        return result
    
    def speak_once(self):
        if self._phrase_buffer:
            phrase = self._phrase_buffer.pop(0)
            rospy.loginfo('Saying: {}'.format(phrase))
            self.play_back(phrase)


def main():
    rospy.init_node('text_to_speech')
    text_2_speech = TextToSpeech()
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        text_2_speech.speak_once()
        rate.sleep()
    


if __name__ == '__main__':
    main()