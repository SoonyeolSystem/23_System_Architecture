from fastapi import FastAPI
app = FastAPI()

@app.get("/")
def root():
    return {"message": "Hello World"}

## 비동기 예시

@app.get("/async")
async def async_root():
    result = await some_long_running_function()
    return {"message": result}

import time
def some_long_running_function():
    time.sleep(3)
    return "some result"
 