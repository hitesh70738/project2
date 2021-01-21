cd service_1
source venv/bin/activate
pip3 install -r requirements.txt
pip3 install pytest pytest-cov application requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
deactivate
cd ..

cd service_2
source venv/bin/activate
pip3 install -r requirements.txt
pip3 install pytest pytest-cov application requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
deactivate
cd ..

cd service_3
source venv/bin/activate
pip3 install -r requirements.txt
pip3 install pytest pytest-cov application requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
deactivate
cd ..

cd service_4
source venv/bin/activate
pip3 install -r requirements.txt
pip3 install pytest pytest-cov application requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
deactivate
cd ..