$(function () {
    function display(bool) {
        if (bool) {
                $("#container").show();

        } else {
                $("#container").hide();
        }
    }

    display(false)
    const GetCurrentResourceName = "jhn_policemenu"
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`ttp://${GetCurrentResourceName}/exit`, JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post(`http://${GetCurrentResourceName}/exit`, JSON.stringify({}));
        return
    })
    $("#submit").click(function () {
        let inputValue = $("#input").val()
        if (inputValue.length >= 100) {
            $.post(`http://${GetCurrentResourceName}/error`, JSON.stringify({
                error: "Tekst nie moze byc dluzszy niz 100 znakow"
            }))
            return
        } else if (!inputValue) {
            $.post(`http://${GetCurrentResourceName}/error`, JSON.stringify({
                error: "Nic nie ma"
            }))
            return
        }
        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there
        $.post(`http://${GetCurrentResourceName}/main`, JSON.stringify({
            text: inputValue,
        }));
        return;
    })
    //when the user clicks on the submit button, it will run
    $("#zielony").click(function () {
        $.post(`http://${GetCurrentResourceName}/kody`, JSON.stringify({
            kod: 'zielony'
        }));
        return
    })
    $("#pomaranczowy").click(function () {
        $.post(`http://${GetCurrentResourceName}/kody`, JSON.stringify({
            kod: 'pomaranczowy'
        }));
        return
    })
    $("#czerwony").click(function () {
        $.post(`http://${GetCurrentResourceName}/kody`, JSON.stringify({
            kod: 'czerwony'
        }));
        return
    })
    $("#czarny").click(function () {
        $.post(`http://${GetCurrentResourceName}/kody`, JSON.stringify({
            kod: 'czarny'
        }));
        return
    })
})
