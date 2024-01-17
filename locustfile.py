from locust import HttpUser, task

class HelloWordUser(HttpUser):
  @task
  def hello_word(self):
    self.client.get("/hello")
    self.client.get("/world")
