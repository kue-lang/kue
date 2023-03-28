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

build_dependencies = {
    "lua == 5.1",
    "cyan",
    "luastatic"
}

build = {
   type = "builtin",
   modules = {}
}
