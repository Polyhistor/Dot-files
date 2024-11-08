require "nvchad.options"
 
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("PDFOpener", { clear = true })

-- Create a table to track which PDFs have been opened
local opened_pdfs = {}

autocmd({"BufEnter", "BufAdd"}, {
  group = augroup,
  pattern = "*.pdf",
  callback = function()
    local filename = vim.fn.expand("<afile>:p")
    if vim.fn.filereadable(filename) == 1 and not opened_pdfs[filename] then
      opened_pdfs[filename] = true
      
      -- Get screen dimensions
      local screen_width = tonumber(vim.fn.system("xdotool getdisplaygeometry | awk '{print $1}'"))
      local screen_height = tonumber(vim.fn.system("xdotool getdisplaygeometry | awk '{print $2}'"))
      
      -- Calculate desired window position and size
      local window_width = math.floor(screen_width / 2)
      local x_position = screen_width - window_width
      
      -- Launch Zathura and position the window
      vim.fn.jobstart(string.format(
        "zathura '%s' & sleep 0.5 && " ..
        "WID=$(xdotool search --name 'zathura' | tail -n1) && " ..
        "xdotool windowsize $WID %d %d && " ..
        "xdotool windowmove $WID %d 0",
        filename, window_width, screen_height, x_position
      ), {detach = true})
      
      vim.defer_fn(function()
        vim.cmd("silent! bdelete " .. vim.fn.expand("<abuf>"))
        -- Remove the file from our tracking after a delay
        vim.defer_fn(function()
          opened_pdfs[filename] = nil
        end, 1000)
      end, 100)
    end
  end,
})
