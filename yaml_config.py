import typing
from pathlib import Path

import yaml


class ConfigManager:
    def __init__(self, path: Path):
        self.path: Path = path
        self.config: typing.Dict[str, typing.Any] = self.load_config(path)

    def load_config(self, path: Path) -> typing.Dict[str, typing.Any]:
        with open(path, "r") as f:
            self.config = yaml.safe_load(f)
        return self.config

    def write_config(self):
        with open(self.path, "w") as yaml_file:
            yaml.dump(self.config, yaml_file)
