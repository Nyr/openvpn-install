import os
import shutil
import subprocess
from functools import cached_property
from typing import Union


class VpnCommand:
    @cached_property
    def install_dir(self) -> str:
        return os.path.dirname(__file__).replace("openvpn-ui/http_server/vpn", "").replace(
            r"openvpn-ui\\http_server\\vpn", "")

    @cached_property
    def install_file(self) -> str:
        return self.install_dir + "/bin/openvpn-install.sh"

    def get_vpn_status(self, file_path="/etc/openvpn/server/server.conf") -> str:
        if os.path.exists(file_path):
            return "OpenVPN has been installed"
        return f"Please install OpenVPN: {self.install_file}"

    def install_vpn(self) -> str:
        return self.create_client("default")

    def create_client(self, name) -> str:
        result = self.install_cmd(name, "1")
        if isinstance(result, str):
            return result
        if result:
            new_client = f"~/{name.strip('.ovpn')}.ovpn"
            # move vpn file
            if os.path.exists(new_client):
                shutil.copy(new_client, self.install_dir)
            return name + " has been created"
        return name + " failed to create"

    def revoke_client(self, name) -> str:
        result = self.install_cmd(name, "2")
        if isinstance(result, str):
            return result
        if result:
            new_client = f"{name.strip('.ovpn')}.ovpn"
            # move vpn file
            if os.path.exists(new_client):
                shutil.rmtree(self.install_dir + new_client)
            return name + " has been revoked"
        return name + " failed to revoke"

    def install_cmd(self, name: str, option: str,
                    file_path="/etc/openvpn/server/server.conf") -> Union[bool, str]:
        if self.get_vpn_status(file_path) != "OpenVPN has been installed":
            return "Please install OpenVPN"

        name = name.strip('.ovpn')
        new_client = f"~/{name}.ovpn"
        # 创建一个Popen对象，指定shell脚本路径，并设置stdin参数为subprocess.PIPE
        # 这样我们就可以通过stdin管道向脚本发送输入
        process = subprocess.Popen(
            ['bash', self.install_file], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
            stderr=subprocess.PIPE, text=True)
        # 示例交互式输入列表
        input_line = f"{option}\n{name}\n"
        process.stdin.write(input_line)
        process.stdin.flush()  # 刷新缓冲区，确保输入立即发送到子进程
        print(input_line, self.install_file, new_client)
        # 等待脚本执行完成并获取stdout/stderr输出
        try:
            stdout_data, stderr_data = process.communicate(timeout=5)
            print(stdout_data, stderr_data)
        except Exception as e:
            with open('a.txt', "w") as f:
                f.write(str(vars(process)))
                f.write(str(vars(e)))
            return False
        # 输出脚本执行结果和状态
        print("shell output: ", new_client, stdout_data, stderr_data,
              process.returncode, process.stderr)
        return True
