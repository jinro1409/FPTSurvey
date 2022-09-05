

function openOption(option) {
    var i;
    var x = document.getElementsByClassName("option-result");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    document.getElementById(option).style.display = "block";
    document.getElementById(option).focus();
};


function OpenTextRadio(text) {
    var open = document.querySelectorAll(text);
    var btnOpen = document.querySelectorAll('#open')
    var btnClose = document.querySelectorAll('#close')
    for (var i = 0; i < btnOpen.length; i++) {
        open[i].style.display = "block";
        btnClose[i].style.display = 'block'
        btnOpen[i].style.display = 'none'
    }



}

function CloseTextRadio(text) {
    var open = document.querySelectorAll(text);
    var btnOpen = document.querySelectorAll('#open')
    var btnClose = document.querySelectorAll('#close')
    for (var i = 0; i < btnOpen.length; i++) {

        open[i].style.display = "none";
        btnClose[i].style.display = 'none'
        btnOpen[i].style.display = 'block'


    }



}

function OpenTextCheckBox(text) {
    var open = document.querySelectorAll(text);

    var btnOpen = document.querySelectorAll('#open-checkbox')
    var btnClose = document.querySelectorAll('#close-checkbox')
    for (var i = 0; i < btnOpen.length; i++) {
        open[i].style.display = "block";
        btnClose[i].style.display = 'block'
        btnOpen[i].style.display = 'none'

    }

}

function CloseTextCheckBox(text) {
    var open = document.querySelectorAll(text);

    var btnOpen = document.querySelectorAll('#open-checkbox')
    var btnClose = document.querySelectorAll('#close-checkbox')

    for (var i = 0; i < btnOpen.length; i++) {

        open[i].style.display = "none";
        btnClose[i].style.display = 'none'
        btnOpen[i].style.display = 'block'

    }

}