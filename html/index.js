$(function () {
    function display(bool) {
        if (bool) {
            var x = document.getElementById("teslaui");
            x.style.display = 'block';
        } else {
            var x = document.getElementById("teslaui");
            x.style.display = 'none';
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
        if (item.type === "updatekmh") {
                document.getElementById("teslatext").innerHTML = item.speed
                document.getElementById("updatesetting").innerHTML = "KM/H"
        }
        if (item.type === "updatemph") {
            document.getElementById("teslatext").innerHTML = item.speed
            document.getElementById("updatesetting").innerHTML = "MP/H"
        }
        if (item.type === "updatefuelpercentage") {
                document.getElementById("updatefuelpercentage1").innerHTML = item.fuel
        }
    })
})
