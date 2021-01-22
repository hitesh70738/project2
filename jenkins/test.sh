cd service_1
pip3 install -r requirements.txt
pip3 install pytest pytest-cov requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
cd ..

cd service_2
pip3 install -r requirements.txt
pip3 install pytest pytest-cov requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
cd ..

cd service_3
pip3 install -r requirements.txt
pip3 install pytest pytest-cov requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
cd ..

cd service_4
pip3 install -r requirements.txt
pip3 install pytest pytest-cov requests_mock
python3 -m pytest --cov=application --cov-report xml --cov-report term-missing --junitxml junit.xml
cd ..