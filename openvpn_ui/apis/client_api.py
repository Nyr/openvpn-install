# coding: utf-8
import os
from typing import Dict, List, Any  # noqa: F401

from fastapi import (  # noqa: F401
    APIRouter,
    Body,
    Cookie,
    Depends,
    Form,
    Header,
    Path,
    Query,
    Response,
    Security,
    status,
)
from starlette.responses import FileResponse

from models.extra_models import TokenModel  # noqa: F401

from openvpn_ui.apis import command
from openvpn_ui.models.post_client_request import PostClientRequest

router = APIRouter()


@router.get(
    "/clients",
    responses={
        200: {"description": "OK"},
    },
    tags=["client"],
    summary="List all clients",
    response_model_by_alias=True,
)
async def get_client(
        client_name: str = Query(None, description="VPN client name"),
) -> Any:
    try:
        file_path = command.install_dir
        if client_name:
            client_name = f"{client_name.strip('.ovpn')}.ovpn"
            file_location = file_path + client_name
            return FileResponse(file_location, filename=client_name,
                                media_type="application/octet-stream")
        else:
            exists = []
            for root, dirs, files in os.walk(file_path):
                if root == file_path:
                    for f in files:
                        if f.endswith("ovpn"):
                            exists.append(f)
            return {"existing client": exists}
    except FileNotFoundError:
        return {"error": "File not found"}


@router.post(
    "/clients",
    responses={
        200: {"description": "OK"},
    },
    tags=["client"],
    summary="Add a new client",
    response_model_by_alias=True,
)
async def post_client(
        post_client_request: PostClientRequest = Body(None, description=""),
) -> str:
    return command.create_client(post_client_request.name)
