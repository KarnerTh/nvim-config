local status_ok, blame = pcall(require, "blame")
if not status_ok then
  return
end

blame.setup({
  merge_consecutive = true
})
