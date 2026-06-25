return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    -- 1. Initialization the plugin
    local npairs = require("nvim-autopairs")
    npairs.setup({})

    -- 2. Paste the snippet directly here 
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')

    npairs.add_rules({
      Rule("\\left(", "\\right)", 'tex'),
      Rule("\\left[", "\\right]", 'tex'),
      Rule("\\left\\{", "\\right\\}", 'tex'),
      Rule("\\left|", "\\right|", 'tex'),
      Rule("\\left<", "\\right>", 'tex'),
      Rule("$", "$", 'tex'),
    })

    local tex_brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
    for _, bracket in pairs(tex_brackets) do
      npairs.add_rules({
        Rule(bracket[1], bracket[2], 'tex')
          :with_pair(cond.not_after_regex([[%w]]))
          :with_pair(cond.before_regex([[\\left$]] .. [[\|\\bigl$]] .. [[\|\\Bigl$]]))
      })
    end
  end
}
