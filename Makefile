install:
	python3 -m pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
		python3 -m pip install pyinotify pytest pytest-cov virtualenv flake8 locust &&\
		virtualenv ~/.mypy3env &&\
		source ~/.mypy3env/bin/activate &&\
		which python3

test:
	python3 -m pytest -vv --cov=myrepolib tests/*.py &&\
	python3 -m pytest --nbval notebook.ipynb
	python3 -m pytest tests --doctest-modules --junitxml=/test-results.xml --cov=.

lint:
	python3 -m pylint --disable=R,C app.py
	python3 -m flake8 . 

all: install lint test
