return {
  "sqwxl/playdate.nvim",
  enabled = false,
  opts = {
    playdate_sdk_path = nil, -- or set PLAYDATE_SDK_PATH
    playdate_luacats_path = "../playdate-luacats", -- or set PLAYDATE_LUACATS_PATH (optional)
    build = {
      source_dir = "src",
      output_dir = "build.pdx",
    },
    server_settings = {
      -- Server settings placed here will be merged into the defaults shown below.
    },
  },
}
