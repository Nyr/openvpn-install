# coding: utf-8

import uvicorn

from openvpn_ui.apis.client_api import router as client_api
from openvpn_ui.apis.openvpn_api import router as vpn_api
from openvpn_ui.app import app

app.include_router(client_api)
app.include_router(vpn_api)

if __name__ == "__main__":
    uvicorn.run("main:app", host='0.0.0.0', port=8080, reload=True)
