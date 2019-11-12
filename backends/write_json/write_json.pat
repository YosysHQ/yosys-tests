      "cells": {
        "$add$../top.v:17$2": {
          "hide_name": 1,
          "type": "$add",
          "parameters": {
            "A_SIGNED": 0,
            "A_WIDTH": 1,
            "B_SIGNED": 0,
            "B_WIDTH": 1,
            "Y_WIDTH": 1
          },
          "attributes": {
            "src": "../top.v:17"
          },
          "port_directions": {
            "A": "input",
            "B": "input",
            "Y": "output"
          },
          "connections": {
            "A": [ 3 ],
            "B": [ 4 ],
            "Y": [ 7 ]
          }
        },
        "$add$../top.v:20$4": {
          "hide_name": 1,
          "type": "$add",
          "parameters": {
            "A_SIGNED": 0,
            "A_WIDTH": 1,
            "B_SIGNED": 0,
            "B_WIDTH": 1,
            "Y_WIDTH": 1
          },
          "attributes": {
            "src": "../top.v:20"
          },
          "port_directions": {
            "A": "input",
            "B": "input",
            "Y": "output"
          },
          "connections": {
            "A": [ 3 ],
            "B": [ 5 ],
            "Y": [ 8 ]
          }
        },
        "$procdff$6": {
          "hide_name": 1,
          "type": "$dff",
          "parameters": {
            "CLK_POLARITY": "0",
            "WIDTH": 1
          },
          "attributes": {
            "src": "../top.v:19"
          },
          "port_directions": {
            "CLK": "input",
            "D": "input",
            "Q": "output"
          },
          "connections": {
            "CLK": [ 2 ],
            "D": [ 8 ],
            "Q": [ 6 ]
          }
        },
        "$procdff$7": {
          "hide_name": 1,
          "type": "$dff",
          "parameters": {
            "CLK_POLARITY": "1",
            "WIDTH": 1
          },
          "attributes": {
            "src": "../top.v:16"
          },
          "port_directions": {
            "CLK": "input",
            "D": "input",
            "Q": "output"
          },
          "connections": {
            "CLK": [ 2 ],
            "D": [ 7 ],
            "Q": [ 5 ]
          }
        }
      },
