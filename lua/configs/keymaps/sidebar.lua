return {
  ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
  ["F"] = "focus_preview",
  ["S"] = "open_vsplit",
  ["R"] = "refresh",
  ["I"] = "show_file_details",

  -- Manipulate file
  ["y"] = "copy_to_clipboard",
  ["x"] = "cut_to_clipboard",
  ["p"] = "paste_from_clipboard",
}
