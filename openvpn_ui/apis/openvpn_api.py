# coding: utf-8

from typing import Dict, List  # noqa: F401


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

from openvpn_ui.apis import command

router = APIRouter()


@router.get(
    "/openvpn/config",
    responses={
        200: {"description": "OK"},
    },
    tags=["openvpn"],
    summary="Get OpenVPN configuration",
    response_model_by_alias=True,
)
async def get_openvpn(
) -> str:
    return command.get_vpn_status()


@router.post(
    "/openvpn/config",
    responses={
        200: {"description": "OK"},
    },
    tags=["openvpn"],
    summary="Init OpenVPN",
    response_model_by_alias=True,
)
async def post_openvpn(
) -> str:
    return command.install_vpn()
