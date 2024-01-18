from locust import HttpUser, task

class HelloWordUser(HttpUser):
  @task
  def hello_word(self):
    self.client.get("/http://127.0.0.1:5000")
    self.client.get("/http://10.0.0.72:5000")
    self.client.get("/http://*:8089")
