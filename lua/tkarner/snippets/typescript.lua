local luasnip = require("luasnip")
local s = luasnip.snippet;
local t = luasnip.text_node;

return {
  s("snip_printToken", t("console.log(scp.get('token'));"))
}
