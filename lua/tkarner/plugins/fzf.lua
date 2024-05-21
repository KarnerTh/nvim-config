return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { { "junegunn/fzf", build = "./install --bin" } },
  opts = {
    winopts = {
      height = 0.92,
      preview = {
        vertical = 'down:65%', -- up|down:size
        layout   = 'vertical', -- horizontal|vertical|flex
      },
    }
  }
}
