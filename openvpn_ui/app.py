# coding: utf-8

import os
from fastapi import FastAPI
from fastapi.openapi.docs import get_swagger_ui_html
from starlette.middleware.cors import CORSMiddleware
from starlette.staticfiles import StaticFiles

project_dir = os.path.dirname(__file__)
app = FastAPI(
    title="OpenVPN Admin API",
    description="API for managing OpenVPN and clients",
    version="0.0.1",
    docs_url=None,
    openapi_url="/api/openapi.json"
)


# static files
app.mount('/static', StaticFiles(
    directory=f"{project_dir}/resource/static/swagger-ui"), name='static')


@app.get("/api/docs", include_in_schema=False)
async def custom_swagger_ui_html():
    return get_swagger_ui_html(
        openapi_url="/api/openapi.json",
        title="Swagger UI",
        swagger_js_url="/static/swagger-ui-bundle.js",
        swagger_css_url="/static/swagger-ui.css",
    )


app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
