# Installing ParlAI Search Server from JulesGM
cd ~/Downloads
wget https://github.com/JulesGM/ParlAI_SearchEngine/archive/refs/heads/master.zip
unzip master.zip
cd ~/Downloads/ParlAI_SearchEngine/
pip install -r requirements.txt
python search_server.py serve --host 0.0.0.0:8080
echo '############### Search Server Running############'

cd ~/LSRPBot/ParlAI; pip install -r requirements.txt
cd ~/LSRPBot/ParlAI; python setup.py develop
# display examples from bAbI 10k task 1
parlai display_data --task babi:task10k:1
# train MemNN using batch size 1 and for 5 epochs
parlai train_model --task babi:task10k:1 --model-file /tmp/babi_memnn --batchsize 1 --num-epochs 5 --model memnn --no-cuda
# display predictions for model save at specified file on bAbI task 1
parlai display_model --task babi:task10k:1 --model-file /tmp/babi_memnn --eval-candidates vocab

echo '#######################PARL AI INSTALLED!######################'

cd ~/LSRPBot/LSRPBot-main/ &&
python3 parlai/chat_service/services/browser_chat/run.py --config-path parlai/chat_service/tasks/chatbot/config.yml --port 10001

python3 parlai/chat_service/services/browser_chat/client.py -port 10001

echo '######################PARL AI SERVER RUNNING!###################'
echo 'This will serve search server on port 8080 and the browser chat into *YOUR IP*:80.'
echo 'You can navigate to this by going to http://YOURIP/'
echo 'This will utilize the current version of BlenderBot3 with integreated searching. This is a 3 Billion Model File'


