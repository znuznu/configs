local neotest = require('neotest')

local map = require('znu.utils').map
local is_npm_package_installed = require('znu.utils').is_npm_package_installed

local adapters = {}
if is_npm_package_installed('jest') then
  table.insert(
    adapters,
    require('neotest-jest')({
      jestCommand = 'npm test --',
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    })
  )
end

if is_npm_package_installed('vitest') then
  table.insert(
    adapters,
    require('neotest-vitest')({
      vitestCommand = 'npm test --',
      env = { CI = true },
    })
  )
end

neotest.setup({
  consumers = {
    statusline = require('znu.plugins.neotest_consumer_statusline'),
  },

  adapters = adapters,

  output = {
    enabled = true,
    open_on_run = true,
  },
})

map('n', '<leader>tn', function()
  neotest.run.run()
end)
map('n', '<leader>tf', function()
  neotest.run.run(vim.fn.expand('%'))
end)
map('n', '<leader>ta', function()
  neotest.run.run('src')
end)
map('n', '<leader>tl', function()
  neotest.run.run_last()
end)
map('n', '<leader>ts', function()
  neotest.summary.toggle()
end)
