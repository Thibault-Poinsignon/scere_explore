import sys
sys.path.insert(0, './python/')

import tools
import visualization_2D as vis2D
import visualization_3D as vis3D
import pandas as pd
import numpy as np
import plotly.express as px
import plotly.graph_objects as go
import plotly.offline as pyo
import math
import random

import networkx as nx
import matplotlib.pyplot as plt
import ipycytoscape
import matplotlib.pyplot as plt
import ipywidgets as widgets

import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_bootstrap_components as dbc
from dash.dependencies import Input, Output, State

name = "Scere explore dashboard"
fontawesome = 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'


app = dash.Dash(name=name, assets_folder="./assets", external_stylesheets=[dbc.themes.LUX, fontawesome])
app.title = name


header = html.Div(
        [   dbc.Row(
            [
                html.Img(src="./static/yeast_icon.png", height="40px"),
                html.H1("Scere explore dashboard", style = {'padding-left' : '2%'})
            ])
        ],
        style = {'padding-down' : '4%', 'padding-top' : '2%'})

imput = html.Div(
        [   dbc.Row(
            [
                dbc.Col(
                [
                    html.H4("Go Terms"),
                    dcc.Dropdown(
                        id='GoTerm-dropdown',
                        options=[]),
                ]),
                dbc.Col(
                [
                    html.H4("Color"),
                    dcc.Dropdown(
                        id='color-dropdown',
                        options=[
                            {'label': 'Blue', 'value': 'Green'},
                            {'label': 'Red', 'value': 'Green'},
                            {'label': 'Green', 'value': 'Green'}]),
                ]),
            ]),
            dbc.Row(style = {'height' : 25}),
            dbc.Row(
            [
                dbc.Button("Submit", id = 'Submit' outline=True, color="primary", className="mr-1", style={"vertical-align": "middle"})
            ],
            justify = 'end'
            )
        ],
        className = 'shadow p-3 mb-5 bg-body rounded', style = {'padding-top' : '1%'})


visualization = html.Div(
        [   dbc.Row(
            [
                dbc.Col(
                [
                    html.H3('2D Visualization'),
                    dcc.Graph(id = '2D-representation'),
                ]),
                dbc.Col(
                [
                    html.H3('3D Visualization'),
                    dcc.Graph(),
                ])
            ])
        ],
        className = 'shadow p-3 mb-5 bg-body rounded', style = {'padding-top' : '1%'})


app.layout = dbc.Container(
      [
        header,
        dbc.Row(style = {'height' : 45}),
        imput,
        visualization
      ])

@app.callback(Output('2D-representation', 'figure'),
              Input('Submit', 'n_clicks'),
              State('GoTerm-dropdown', 'value'),
              State('color-dropdown', 'value'))
def update_graph(n_clicks, input1, input2):
    
    sql_query = \
"""SELECT Primary_SGDID, count(SGDID), Start_coordinate, Stop_coordinate, Chromosome, Strand, GO_slim_term
FROM SGD_features, go_slim_mapping
WHERE SGDID == Primary_SGDID 
AND (GO_slim_term == """ + str(input1) + """)
GROUP BY SGDID
ORDER BY Start_coordinate
"""

    chrom = tools.get_locus_info("./static/SCERE.db", sql-query)
    chrom = vis2D.format_coordinates(chrom, 6)
    return vis2D.genome_drawing(chrom, "discreet", "GO_slim_term", [str(input1)], [str(input2)])


if __name__ == '__main__':
    app.run_server(debug=True)
