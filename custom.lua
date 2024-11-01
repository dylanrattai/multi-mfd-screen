_  = function(p) return p end
name = _('Winwing 3 in 1 MFDs by Dylan')
description = '1440p main screen with 2 fake screens to display on winwing mfd'

LEFT_MFCD = { x = 2560, y = 256, width = 768, height =  768}
RIGHT_MFCD = { x = 3328, y = 256, width = 768, height = 768}

Viewports = {
  -- Main monitor
  Center = {
    x = 0,-- The HORIZONTAL starting location of the main display
    y = 0,-- The starting VERTICAL position of the main display
    width = 2560,-- The HORIZONTAL size of the main display
    height = 1440,-- The VERTICAL size of the main display
    aspect = 1.77777777778,-- The aspect ratio of the main display
    dx = 0,
    dy = 0
  }
}
UIMainView = Viewports.Center
GU_MAIN_VIEWPORT = Viewports.Center
