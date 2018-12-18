- dashboard: verticatest
  title: VerticaTest
  layout: newspaper
  elements:
  - name: New_Vertica_Dashboard
    type: text
    title_text: "My New Vertica Dashboard"
    body_text: ''
    row: 0
    col: 1
    width: 22
    height: 1

  - title: Food
    name: Food
    model: vertica_data
    explore: store_orders_fact
    type: single_value
    fields:
    - store_orders_fact.unit_price
    - store_orders_fact.category_description

    sorts:
    - store_orders_fact.product_cost desc
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: FOOD
    single_value_title_size: 10
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 2
    col: 0
    width: 6
    height: 1

  - title: New Tile (copy 2)
    name: New Tile (copy 2)
    model: vertica_data
    explore: store_orders_fact
    type: single_value
    fields:
    - store_orders_fact.unit_price
    - store_orders_fact.category_description
    filters:
      store_orders_fact.category_description: Misc
    sorts:
    - store_orders_fact.product_cost desc
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#8b2289"
    show_single_value_title: true
    single_value_title: MISC
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 1

  - title: Non-food
    name: Non-food
    model: vertica_data
    explore: store_orders_fact
    type: single_value
    fields:
    - store_orders_fact.unit_price
    - store_orders_fact.category_description
    filters:
      store_orders_fact.category_description: Non-food
    sorts:
    - store_orders_fact.product_cost desc
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: NON-FOOD
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 1

  - title: Medical Insights
    name: Medical Insights
    model: vertica_data
    explore: store_orders_fact
    type: single_value
    fields:
    - store_orders_fact.unit_price
    - store_orders_fact.category_description
    filters:
      store_orders_fact.category_description: Medical
    sorts:
    - store_orders_fact.product_cost desc
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#41FF35"
    show_single_value_title: true
    single_value_title: MEDICAL
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen: {}
    row: 2
    col: 6
    width: 6
    height: 1

  - title: Order Count by Year
    name: Order Count by Year
    model: vertica_data
    explore: store_orders_fact
    type: looker_area
    fields:
    - store_orders_fact.date_ordered_month
    - store_orders_fact.count
    fill_fields:
    - store_orders_fact.date_ordered_month
    sorts:
    - store_orders_fact.date_ordered_month desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 11
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: Order CNT
      orientation: left
      series:
      - id: store_orders_fact.count
        name: Store Orders Fact Count
        axisId: store_orders_fact.count
      showLabels: true
      showValues: true

      valueFormat: ''
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: '10'
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Year
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: exponential
      series_index: 1
      show_label: true
      label_type: r2
    x_axis_label_rotation: 90
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 12
    width: 12
    height: 6
  - title: Orders by Product Category
    name: Orders by Product Category
    model: vertica_data
    explore: store_orders_fact
    type: looker_pie
    fields:
    - store_orders_fact.unit_price
    - store_orders_fact.category_description
    sorts:
    - store_orders_fact.product_cost desc
    limit: 500
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}

    note_state: collapsed
    note_display: below
    row: 4
    col: 0
    width: 12
    height: 6
