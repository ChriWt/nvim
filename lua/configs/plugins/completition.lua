local function goNext(fallback)
  local cmp = require("cmp")
  if cmp.visible() then
    -- If only one option is present choose that one
    if #cmp.get_entries() == 1 then
      cmp.confirm({ select = true })
    else
      cmp.select_next_item()
    end
  else
    fallback()
  end
end

local function goPrevious(fallback)
  local cmp = require("cmp")
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end

return function()
  local cmp = require("cmp")
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(goNext, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(goPrevious, { "i", "s" }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    }),
  })
end
