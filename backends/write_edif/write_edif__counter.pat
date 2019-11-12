    (cell (rename id00001 "$add")
      (cellType GENERIC)
      (view VIEW_NETLIST
        (viewType NETLIST)
        (interface
          (port (array A 8) (direction INPUT))
          (port (array B 32) (direction INPUT))
          (port (array Y 32) (direction OUTPUT))
        )
      )
    )
    (cell (rename id00002 "$adff")
      (cellType GENERIC)
      (view VIEW_NETLIST
        (viewType NETLIST)
        (interface
          (port CLK (direction INPUT))
          (port ARST (direction INPUT))
          (port (array Q 8) (direction OUTPUT))
          (port (array D 8) (direction INPUT))
        )
      )
    )
