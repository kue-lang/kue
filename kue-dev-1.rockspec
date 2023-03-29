rockspec_format = "3.0"

package = "kue"
version = "dev-1"

source = {
  url = "git+https://github.com/kue-lang/kue.git"
}

description = {
  homepage = "https://github.com/kue-lang/kue",
  license = "MIT"
}

dependencies = {
  "argparse >= 0.7.1-1",
  "lpegrex >= 0.2.2-1",
  "cffi-lua >= 0.2.3-1"
}

build_dependencies = {
  "amalg",
  "luastatic"
}

build = {
  type = "builtin",
  modules = {}
}
