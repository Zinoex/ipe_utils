----------------------------------------------------------------------
-- Export to PNG and allow setting the DPI
----------------------------------------------------------------------

label = "Export to PNG"

about = [[
Export to PNG
]]

filter_png = { "Images (*.png)", "*.png" }

function run(model)
  local resolution = model:getDouble("Enter DPI", "Resolution", 600, 1, 10000)
  if not resolution then return end
			   
  local dir
  if model.file_name then dir = model.file_name:match(prefs.dir_pattern) end
  if not dir then dir = prefs.save_as_directory end
  
  local s, f =
    ipeui.fileDialog(model.ui:win(), "save", "Export to PNG", filter_png, dir)
  if s then
    if config.toolkit ~= "cocoa" and ipe.fileExists(s) then
      local b = ipeui.messageBox(model.ui:win(), "question",
			   "File already exists!",
			   "Do you wish to overwrite?\n\n" .. s,
			   "okcancel")
      if b ~= 1 then
		model.ui:explain("Document not exported")
		return
      end
    end
    model.ui:renderPage(model.doc, model.pno, model.vno,
       		       "png", s, resolution / 72.0,
		       true, false) -- transparent, nocrop
  end
end 

---------------------------------------------------------------------- 