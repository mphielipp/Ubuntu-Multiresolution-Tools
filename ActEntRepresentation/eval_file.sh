#!/bin/bash
awk -F "\t" '{print $1}' $1 > $1_First.txt
python append_end_of_utterance_token.py $1_First.txt $1_First_Fixed.txt
sed -i 's/__eot__//g' $1_First_Fixed.txt
python evaluate_actents.py GroundTruth/actent_test_responses.txt $1_First_Fixed.txt --skip_dialogues_without_activities > $2.txt
