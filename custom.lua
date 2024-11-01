_  = function(p) return p end
name = _('Custom MFDs - 3x MFD')
description = '1440p main screen with 3 fake screens to display on winwing mfd'

-- X and Y poses
left_mfd_x_pose = 2560
left_mfd_y_pose = 0
right_mfd_x_pose = 3328
right_mfd_y_pose = 0
middle_mfd_x_pose = 0
middle_mfd_y_pose = 0

-- MFD dimensions
mfd_width = 768
mfd_height = 1024

Viewports = {
  -- Main monitor
  Center = {
    x = 0,-- The HORIZONTAL starting location of the main display
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

function reconfigure_for_unit(unit_type)
  -- 3x MFDs
  -- Apache
  if unit_type == "AH-64D_BLK_II" then
    LEFT_MFCD = { x = left_mfd_x_pose, y = left_mfd_y_pose, width = mfd_width, height =  mfd_height}
    RIGHT_MFCD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}
    TEDAC = { x = middle_mfd_x_pose, y = middle_mfd_y_pose, width = mfd_width, height = mfd_height}

  -- F-16
  else if unit_type == "F-16C_50" then
    LEFT_MFCD = { x = left_mfd_x_pose, y = left_mfd_y_pose, width = mfd_width, height =  mfd_height}
    RIGHT_MFCD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}
    EHSI = { x = middle_mfd_x_pose, y = middle_mfd_y_pose, width = mfd_width, height = mfd_height}
  
  -- Tomcat
  else if unit_type == "F-14B" or unit_type == "F-14A-135-GR" then
    F14_VDI = { x = left_mfd_x_pose, y = left_mfd_y_pose, width = mfd_width, height =  mfd_height}
    F14_HSD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}
    F14_TID = { x = middle_mfd_x_pose, y = middle_mfd_y_pose, width = mfd_width, height = mfd_height}

  -- F-15E or F-18 (theyre the same exports)
  else if unit_type == "F-15ESE" or unit_type == "FA-18C_hornet" then
    LEFT_MFCD = { x = left_mfd_x_pose, y = left_mfd_y_pose, width = mfd_width, height =  mfd_height}
    RIGHT_MFCD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}
    CENTER_MFCD = { x = middle_mfd_x_pose, y = middle_mfd_y_pose, width = mfd_width, height = mfd_height}
  
  -- JF-17
  else if unit_type == "JF-17" then
    JF17_LEFT_MFCD = { x = left_mfd_x_pose, y = left_mfd_y_pose, width = mfd_width, height =  mfd_height}
    JF17_RIGHT_MFCD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}
    JF17_CENTER_MFCD = { x = middle_mfd_x_pose, y = middle_mfd_y_pose, width = mfd_width, height = mfd_height}

  -- 1x MFDs
  -- Chinook
  else if unit_type == "CH-47Fbl1" then
    RIGHT_MFCD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}

  -- F-5
  else if unit_type == "F5" then
    RIGHT_MFCD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}

  -- Mirage
  else if unit_type == "M-2000C" then
    VTB = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}
  
  -- MIG-21
  else if unit_type == "MiG-21Bis" then
    RP22 = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}

  -- Anything with 2 MFDs or what I missed, includes FC3
  else
    LEFT_MFCD = { x = left_mfd_x_pose, y = left_mfd_y_pose, width = mfd_width, height =  mfd_height}
    RIGHT_MFCD = { x = right_mfd_x_pose, y = right_mfd_y_pose, width = mfd_width, height = mfd_height}

  end
end