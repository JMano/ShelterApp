$(document).on "ready", ->
  if $("#global_chart").length > 0
    chart_data = undefined
    $.ajax
      type: 'GET'
      url: '/global_stats'
      success: (response) ->
        chart_data = response
        #Bar chart
        new (Chartist.Bar)('#global_chart', {
          labels: response.labels
          series: [
            {
              className: 'adoptions'
              name: '# of adoptions'
              data: response.adoptions
            }
            {
              className: 'donations'
              name: '# of donations'
              data: response.donations
            }
            {
              className: 'arrivals'
              name: '# of arrivals'
              data: response.arrivals
            }
            {
              className: 'volunteers'
              name: '# of volunteers'
              data: response.volunteers
            }
          ]
        }, {
          stackBars: false
          axisY:
            onlyInteger: true
          }, [
          [
            'screen and (min-width: 400px)'
            {
              axisX: labelInterpolationFnc: Chartist.noop
              axisY: offset: 10
              stackBars: false
              seriesBarDistance: 10
            }
          ]
          [
            'screen and (min-width: 800px)'
            {
              chartPadding: {
                top: 0
                right: 25
                bottom: 0
                left: 0
              }
              stackBars: false
              seriesBarDistance: 10
              axisY: offset: 20
            }
          ]
          [
            'screen and (min-width: 1000px)'
            {
              seriesBarDistance: 15
              axisY: offset: 40
            }
          ]
        ])
        return
  if $("#donut_chart").length > 0
    chart_data = undefined
    $.ajax
      type: 'GET'
      url: '/donations_stats'
      success: (response) ->
        chart_data = response
        #Donut chart
        new (Chartist.Pie)('#donut_chart', {
          labels: response.labels
          series: response.series
        }, {
          showLabel: false
        })
        return
