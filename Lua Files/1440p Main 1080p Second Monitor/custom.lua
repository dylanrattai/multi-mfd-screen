displays = 
{
  [1] = 
  {
    x = 0,           -- Second Monitor, 1080p
    y = 0,
    width  = 2560,
    height = 1440
  },

  [2] = 
  {
    x = 1080,           -- Main Display, 1440p
    y = 0,
    width  = 2560,
    height = 1440
  },
    
  [3] = 
  {
    x = 3640,       -- Fake monitor 1
    y = 0,
    width  = 768,
    height = 1024
  },
    
  [4] = 
  {
    x = 5176,       -- Fake monitor 2
    y = 0,
    width  = 768,
    height = 1024
  },
    
  [5] = 
  {
    x = 5944,       -- Winwing MFD
    y = 0,
    width  = 768,
    height = 1024
  },
} 
_  = function(p) return p end
name = _('Custom MFDs')
description = '1440p main screen with 2 fake screens to display on winwing mfd, 1080p second monitor to the left'

-- Screen 3 3328
LEFT_MFCD = { x = 3640, y = 0, width = 768, height =  1024}

-- Screen 4
RIGHT_MFCD = { x = 5176, y = 0, width = 768, height = 1024}

Viewports = {
  -- Main monitor
  Center = {
    x = 1920,-- The HORIZONTAL starting location of the main display
    y = 0,-- The starting VERTICAL position of the main display
    width = 2560,-- The HORIZONTAL size of the main display
    height = 1440,-- The VERTICAL size of the main display
    aspect = width/height,-- The aspect ratio of the main display
    dx = 0,
    dy = 0
  }
}
UIMainView = Viewports.Center
GU_MAIN_VIEWPORT = Viewports.Center
