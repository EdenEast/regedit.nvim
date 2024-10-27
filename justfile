# Run docs
docs:
  #!/usr/bin/env bash
  nvim --headless --noplugin -u './scripts/mini.lua' -c 'lua require("mini.doc").generate()' -c 'qa!'

# Run tests
test:
  #!/usr/bin/env bash
  nvim --headless --noplugin -u './scripts/mini.lua' -c 'lua require("mini.test").gen_reporter.stdout()' -c 'qa!'

# Install mini.nvim dependency
deps:
  #!/usr/bin/env bash
  mkdir -p deps
  if [ ! -d deps/mini.nvim ]; then
    git clone --depth 1 --single-branch --branch v0.13.0 https://github.com/echasnovski/mini.nvim deps/mini.nvim &>/dev/null
  fi

# Format files
fmt:
  @stylua lua/ -f ./stylua.toml
