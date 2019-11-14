        "$procmux$2": {
          "hide_name": 1,
          "type": "$pmux",
          "parameters": {
            "S_WIDTH": 8,
            "WIDTH": 1
          },
          "attributes": {
            "full_case": 1,
            "src": "../../common/mux.v:20|../../common/mux.v:12"
          },
          "port_directions": {
            "A": "input",
            "B": "input",
            "S": "input",
            "Y": "output"
          },
          "connections": {
            "A": \[ "x" \],
            "B": \[ 12, 11, 10, 9, 8, 7, 6, 5 \],
            "S": \[ 15, 16, 17, 18, 19, 20, 21, 14 \],
            "Y": \[ 13 \]
          }
        },
