    (cell (rename id00001 "$eq")
      (cellType GENERIC)
      (view VIEW_NETLIST
        (viewType NETLIST)
        (interface
          (port (array A 3) (direction INPUT))
          (port (array B 3) (direction INPUT))
          (port Y (direction OUTPUT))
        )
      )
    )
    (cell (rename id00002 "$pmux")
      (cellType GENERIC)
      (view VIEW_NETLIST
        (viewType NETLIST)
        (interface
          (port A (direction INPUT))
          (port (array B 8) (direction INPUT))
          (port Y (direction OUTPUT))
          (port (array S 8) (direction INPUT))
        )
      )
    )
