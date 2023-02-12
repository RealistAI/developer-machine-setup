local action_state = require('telescope.actions.state')
require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      -- Insert Mappings
      i = { 
        ["<c-a>"] = function()
          print(vim.inspect(action_state.get_selected_entry()))
        end
      }
    }
  }
}

require('telescope').load_extension('fzf')

local mappings = {
    
}

mappings.current_buff = function()
  require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending"})
end

mappings.find_files = function()
  require('telescope.builtin').find_files({sorting_strategy="ascending"})
end

return mappings
