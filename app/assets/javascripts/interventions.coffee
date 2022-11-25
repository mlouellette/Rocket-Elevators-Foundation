# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  
$(document).on 'turbolinks:load', ->

    # Hides scrolldown selectors for later
    $('#step2').parent().hide()
    $('#step3').parent().hide()
    $('#step4').parent().hide()
    $('#step5').parent().hide()
    
    # Saves the data in a variable, display data and hides the data that is not related to the selector above
    building = $('#intervention_BuildingID').html()
    $('#intervention_CustomerID').change ->
        customer = $('#intervention_CustomerID :selected').text()
        escaped_customer = customer.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(building).filter("optgroup[label='#{escaped_customer}']").html()

        if options
            $('#intervention_BuildingID').html(options).val("Find a Building").prepend("<option value=" + '0' + ">" + 'Find a Building' + "</option>")
            $('#step2').parent().show()

        else
            $('#intervention_BuildingID').empty()
            $('#step2').parent().hide()
            
    # Saves the data in a variable, display data and hides the data that is not related to the selector above        
    battery = $('#intervention_BatteryID').html()
    $('#intervention_BuildingID').change ->
        customerBattery = $('#intervention_BuildingID :selected').text()
        escaped_battery = customerBattery.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        optionsBattery = $(battery).filter("optgroup[label='#{escaped_battery}']").html()

        if optionsBattery
            $('#intervention_BatteryID').html(optionsBattery).val("Find a Battery").prepend("<option value=" + '0' + ">" + 'Find a Battery' + "</option>")
            $('#step3').parent().show()
            
        else
            $('#intervention_BatteryID').empty()
            $('#step3').parent().hide()
            
    # Saves the data in a variable, display data and hides the data that is not related to the selector above
    column = $('#intervention_ColumnID').html()
    $('#intervention_BatteryID').change ->
        batteryColumn = $('#intervention_BatteryID :selected').text()
        escaped_column = batteryColumn.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        optionsColumn = $(column).filter("optgroup[label='#{escaped_column}']").html()

        if optionsColumn
            $('#intervention_ColumnID').html(optionsColumn).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#step4').parent().show()
        else
            $('#intervention_ColumnID').empty()
            $('#step4').parent().hide()

    # Saves the data in a variable, display data and hides the data that is not related to the selector above
    elevator = $('#intervention_ElevatorID').html()
    $('#intervention_ColumnID').change ->
        columnElevator = $('#intervention_ColumnID :selected').text()
        escaped_elevator = columnElevator.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        optionsElevator = $(elevator).filter("optgroup[label='#{escaped_elevator}']").html()

        if optionsElevator
            $('#intervention_ElevatorID').html(optionsElevator).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#step5').parent().show()
        else
            $('#intervention_ElevatorID').empty()
            $('#step5').parent().hide()

     
   

    
    

    