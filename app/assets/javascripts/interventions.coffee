# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  
jQuery ->
    $('#step2').parent().hide()
    $('#step3').parent().hide()
    $('#step4').parent().hide()

    building = $('#intervention_BuildingID').html()
    # customer = $('#intervention_customer_id').html()
    $('#intervention_customer_id').change ->
        customer = $('#intervention_customer_id :selected').text()
        escaped_customer = customer.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(building).filter("optgroup[label='#{escaped_customer}']").html()

        if options
            $('#intervention_BuildingID').html(options)
            #$('#intervention_id').parent().show()
            $('#step2').parent().show()
        else
            $('#intervention_BuildingID').empty()
            #$('#intervention_id').parent().hide()
            $('#step2').parent().hide()



    battery = $('#intervention_BatteryID').html()
    # customer = $('#intervention_customer_id').html()
    $('#intervention_BuildingID').change ->
        customerBattery = $('#intervention_BuildingID :selected').text()
        escaped_battery = customerBattery.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        optionsBattery = $(battery).filter("optgroup[label='#{escaped_battery}']").html()

        if optionsBattery
            $('#intervention_BatteryID').html(optionsBattery)
            $('#step3').parent().show()
        else
            $('#intervention_BatteryID').empty()
            $('#step3').parent().hide()


    column = $('#intervention_ColumnID').html()
    # customer = $('#intervention_customer_id').html()
    $('#intervention_BatteryID').change ->
        batteryColumn = $('#intervention_BatteryID :selected').text()
        escaped_column = batteryColumn.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        optionsColumn = $(column).filter("optgroup[label='#{escaped_column}']").html()

        if optionsColumn
            $('#intervention_ColumnID').html(optionsColumn)
            $('#step4').parent().show()
        else
            $('#intervention_ColumnID').empty()
            $('#step4').parent().hide()

    