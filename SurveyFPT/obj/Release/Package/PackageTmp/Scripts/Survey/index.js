function check(studentForm) {
    var formElement = document.querySelector(studentForm);
    var compel = formElement.querySelectorAll(".check-requied");

    var surveyRadio = formElement.querySelectorAll('.survey-answer.answer-radio');

    var surveyCheckbox = formElement.querySelectorAll('.survey-answer.answer-checkbox');

    var surveyText = formElement.querySelectorAll('.survey-answer.answer-text');

    var surveyLevel = formElement.querySelectorAll('.survey-answer.answer-linear');



    let arrayText = []
    let arrayTextNon = [];
    arrayText = checkCompelText(surveyText);



    let countText = 0;
    let countTextNon = 0;
    countText = checkText(arrayText, countText);
    countTextNon = checkTextNon(arrayTextNon, countTextNon);



    // 
    let countNumberUnChecked = 0;

    // 
    let arrayCheckbox = [];
    let arrayCheckboxNon = [];
    arrayCheckbox = checkCompelCheckbox(surveyCheckbox);


    let countCheckbox = 0;
    let countCheckboxNon = 0;
    countCheckbox = checkCheckBox(arrayCheckbox, countCheckbox);
    countCheckboxNon = checkCheckBoxNon(arrayCheckboxNon, countCheckboxNon);


    // 
    let arrayRadio = [];
    let arrayRadioNon = [];
    arrayRadio = checkCompelRadio(surveyRadio);


    let countRadio = 0;
    let countRadioNon = 0;
    countRadio = checkRadio(arrayRadio, countRadio);
    countRadioNon = checkRadioNon(arrayRadioNon, countRadioNon);


    countNumberUnChecked = countNonCheckbox(arrayCheckboxNon, countNumberUnChecked);
    countNumberUnChecked = countNon(arrayRadioNon, countNumberUnChecked);



    // 
    let arrayLevel = []
    arrayLevel = checkCompelLevel(surveyLevel);


    let countLevel = 0;
    countLevel = checkLevel(arrayLevel, countLevel);




    var valid = false;
    var compelNumber = compel.length;

    if (compelNumber == 0) {
        valid = systemValidRq(countNumberUnChecked, countCheckboxNon, countRadioNon, countTextNon);
    } else {
        valid = systemValid(countCheckbox, countRadio, countText, countLevel, compelNumber, countCheckboxNon, countRadioNon, countTextNon, countNumberUnChecked);
    }



    // // function check compel

    function checkCompelText(surveyType) {

        for (var i = 0; i < surveyType.length; i++) {
            if (surveyType[i].querySelector(".check-requied")) {
                arrayText.push(surveyType[i]);


            } else {
                arrayTextNon.push(surveyType[i]);

            }
        }
        return arrayText;

    }



    function checkCompelCheckbox(surveyType) {

        for (var i = 0; i < surveyType.length; i++) {
            if (surveyType[i].querySelector(".check-requied")) {
                arrayCheckbox.push(surveyType[i]);

            } else {
                arrayCheckboxNon.push(surveyType[i]);
            }
        }
        return arrayCheckbox;

    }

    function checkCompelRadio(surveyType) {

        for (var i = 0; i < surveyType.length; i++) {
            if (surveyType[i].querySelector(".check-requied")) {
                arrayRadio.push(surveyType[i]);

            } else {
                arrayRadioNon.push(surveyType[i]);
            }
        }
        return arrayRadio;

    }

    function checkCompelLevel(surveyType) {
        for (var i = 0; i < surveyType.length; i++) {
            if (surveyType[i].querySelector(".check-requied")) {
                arrayLevel.push(surveyType[i]);

            }
        }
        return arrayLevel;
    }

    // // function validate Text
    function checkText(arrayTextCompel, a) {
        for (var i = 0; i < arrayTextCompel.length; i++) {

            var inputCheck = arrayTextCompel[i].querySelectorAll(".survey-input-element.option-text.text-box.single-line");

            for (var j = 0; j < inputCheck.length; j++) {
                if (inputCheck[j].value.trim() == "") {
                    arrayTextCompel[i].querySelector(".error").innerHTML = "Please enter your answer";
                } else if (inputCheck[j].value.length > 500) {
                    arrayTextCompel[i].querySelector(".error").innerHTML = "You cannot enter more than 500 characters";
                }
                else {
                    arrayTextCompel[i].querySelector(".error").innerHTML = "";
                    a++;
                    break;
                }
            }
        }

        return a;
    }

    function checkTextNon(arrayTextNon, f) {
        for (var i = 0; i < arrayTextNon.length; i++) {

            var inputCheck = arrayTextNon[i].querySelectorAll(".survey-input-element.option-text.text-box.single-line");


            for (var j = 0; j < inputCheck.length; j++) {
                if (inputCheck[j].value.length > 500) {
                    arrayTextNon[i].querySelector(".error").innerHTML = "You cannot enter more than 500 characters";
                    f--;
                    break;
                }
                else {
                    arrayTextNon[i].querySelector(".error").innerHTML = "";
                }
            }
        }
        return f;
    }

    // function validate Checkbox
    function checkCheckBox(arrayCheckboxCompel, b) {
        for (var i = 0; i < arrayCheckboxCompel.length; i++) {

            var inputCheck = arrayCheckboxCompel[i].querySelectorAll(".button-radio.option-checkbox");

            var inputCheckOption = arrayCheckboxCompel[i].querySelector(".button-radio.option-checkbox-others");
            var inputCheckOptionText = arrayCheckboxCompel[i].querySelector(".answer-other.option-checkbox.text-box.single-line");

            var inputText = arrayCheckboxCompel[i].querySelector(".survey-input-element.option-text.text-box.single-line");
            // check co text mo rong
            if (inputText != null) {
                if (inputCheckOption != null && inputCheckOptionText != null) {
                    for (var j = 0; j < inputCheck.length; j++) {
                        if (inputCheck[j].checked == true) {
                            if (inputText.value.trim() == '') {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You must enter text expand";
                                break;
                            } else if (inputText.value.length > 500) {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "";
                                b++;
                                break;
                            }
                        }
                        if (inputCheck[j].checked == false) {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "Please choose your answer";
                        }

                        if (inputCheckOption.checked == true && inputCheckOptionText.value.trim() == "") {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "Please enter your answer of option";
                            break;
                        }

                        else if (inputCheckOption.checked == true && inputCheckOptionText.value.length >= 1) {
                            if (inputCheckOptionText.value.length > 500) {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else if (inputText.value.trim() == '') {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You must enter text expand";
                                break;
                            }
                            else if (inputText.value.length > 500) {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "";
                                b++;
                                break;
                            }
                        }
                        else if (inputCheckOption.checked == false && inputCheckOptionText.value.length >= 1) {
                            inputCheckOptionText.value = "";
                        }


                    }

                } else {
                    for (var j = 0; j < inputCheck.length; j++) {

                        if (inputCheck[j].checked == false) {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "Please choose your answer";

                        }


                        else if (inputCheck[j].checked == true) {
                            if (inputText.value.trim() == '') {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You must enter text expand";
                                break;
                            }
                            else if (inputText.value.length > 500) {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            } else {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "";
                                b++;
                                break;
                            }

                        }

                    }

                }



            }
            // check ko co text mowr roongj
            if (inputText == null) {
                if (inputCheckOption != null && inputCheckOptionText != null) {
                    for (var j = 0; j < inputCheck.length; j++) {

                        if (inputCheck[j].checked == false) {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "Please choose your answer";
                        }

                        if (inputCheckOption.checked == true && inputCheckOptionText.value.trim() == "") {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "Please enter your answer of option";
                            break;
                        }

                        else if (inputCheckOption.checked == true && inputCheckOptionText.value.length >= 1) {
                            if (inputCheckOptionText.value.length > 500) {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else {
                                arrayCheckboxCompel[i].querySelector(".error").innerHTML = "";
                                b++;
                                break;
                            }
                        } else if (inputCheckOption.checked == false && inputCheckOptionText.value.length >= 1) {
                            inputCheckOptionText.value = "";
                        }
                        if (inputCheck[j].checked == true) {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "";
                            b++;
                            break;
                        }
                    }

                } else {
                    for (var j = 0; j < inputCheck.length; j++) {

                        if (inputCheck[j].checked == false) {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "Please choose your answer";
                        }
                        else {
                            arrayCheckboxCompel[i].querySelector(".error").innerHTML = "";
                            b++;
                            break;
                        }

                    }
                }
            }
        }

        return b;

    }

    // function checkTextInput(){

    // }

    function checkCheckBoxNon(arrayCheckboxNon, countCheckboxNon) {
        for (var i = 0; i < arrayCheckboxNon.length; i++) {

            var inputCheck = arrayCheckboxNon[i].querySelectorAll(".button-radio.option-checkbox");

            var inputCheckOption = arrayCheckboxNon[i].querySelector(".button-radio.option-checkbox-others");
            var inputCheckOptionText = arrayCheckboxNon[i].querySelector(".answer-other.option-checkbox.text-box.single-line");

            var inputText = arrayCheckboxNon[i].querySelector(".survey-input-element.option-text.text-box.single-line");
            for (var j = 0; j < inputCheck.length; j++) {
                if (inputText != null && inputText.value.length >= 1) {
                    if (inputText.value.length > 500) {
                        arrayCheckboxNon[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                        countCheckboxNon--;
                        break;

                    } else {
                        arrayCheckboxNon[i].querySelector(".error").innerHTML = "";

                    }
                }
                if (inputText != null && inputText.value.length == 0) {
                    arrayCheckboxNon[i].querySelector(".error").innerHTML = "";
                }

                if (inputCheckOption != null && inputCheckOptionText != null) {
                    if (inputCheckOption.checked == true && inputCheckOptionText.value.trim() == "") {
                        arrayCheckboxNon[i].querySelector(".error").innerHTML = "Please enter your answer";
                    }
                    else if (inputCheckOption.checked == true && inputCheckOptionText.value.length >= 1) {
                        if (inputCheckOptionText.value.length > 500) {
                            arrayCheckboxNon[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                        } else {
                            arrayCheckboxNon[i].querySelector(".error").innerHTML = "";
                            countCheckboxNon++;
                            break;
                        }
                    }
                    else if (inputCheckOption.checked == true && !inputCheckOptionText.value.trim() == "") {
                        arrayCheckboxNon[i].querySelector(".error").innerHTML = "";
                        countCheckboxNon++;
                        break;

                    }
                    else if (inputCheckOption.checked == false && inputCheckOptionText.value.length >= 1) {
                        inputCheckOptionText.value = "";
                    }
                }

            }


        }

        return countCheckboxNon;
    }

    //  countNon
    function countNonCheckbox(arrayCheckboxNon, countA) {

        for (var i = 0; i < arrayCheckboxNon.length; i++) {
            var inputCheck = arrayCheckboxNon[i].querySelectorAll(".button-radio.option-checkbox");

            var inputCheckOption = arrayCheckboxNon[i].querySelector(".button-radio.option-checkbox-others");
            var inputCheckOptionText = arrayCheckboxNon[i].querySelector(".answer-other.option-checkbox.text-box.single-line");

            for (var j = 0; j < inputCheck.length; j++) {


                if (inputCheckOption != null && inputCheckOptionText != null) {
                    if (inputCheckOption.checked == true) {
                        countA++;
                        break;
                    }
                }

            }


        }

        return countA;
    }
    function countNon(arrayRadioNon, countA) {

        for (var i = 0; i < arrayRadioNon.length; i++) {
            var inputCheck = arrayRadioNon[i].querySelectorAll(".button-radio.option");

            var inputCheckText = arrayRadioNon[i].querySelector(".answer-other.option.text-box.single-line");
            var inputCheckOption = arrayRadioNon[i].querySelector(".button-radio.option-others");

            for (var j = 0; j < inputCheck.length; j++) {

                if (inputCheckOption != null && inputCheckText != null) {
                    if (inputCheckOption.checked == true) {
                        countA++;
                        break;
                    }

                }

            }



        }
        return countA;
    }


    // function countNonText(arrayTextNon, a) {

    //     for (var i = 0; i < arrayTextNon.length; i++) {
    //         var inputCheck = arrayTextNon[i].querySelectorAll(".survey-input-element.option-text.text-box.single-line");

    //         for (var j = 0; j < inputCheck.length; j++) {

    //             if (inputCheck[j].value.length > 1) {
    //                 a++;
    //                 break;
    //             }



    //         }



    //     }
    //     return a;
    // }


    // function validate Radio
    function checkRadio(arrayRadioCompel, c) {
        for (var i = 0; i < arrayRadioCompel.length; i++) {
            var inputCheck = arrayRadioCompel[i].querySelectorAll(".button-radio.option");



            var inputCheckOptionText = arrayRadioCompel[i].querySelector(".answer-other.option.text-box.single-line");
            var inputCheckOption = arrayRadioCompel[i].querySelector(".button-radio.option-others");



            var inputText = arrayRadioCompel[i].querySelector(".survey-input-element.option-text.text-box.single-line");



            // check co text mo rong
            if (inputText != null) {
                if (inputCheckOption != null && inputCheckOptionText != null) {
                    for (var j = 0; j < inputCheck.length; j++) {


                        if (inputCheck[j].checked == false) {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "Please choose your answer";
                        }

                        if (inputCheckOption.checked == true && inputCheckOptionText.value.trim() == "") {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "Please enter your answer of option";
                            break;
                        }

                        else if (inputCheckOption.checked == true && inputCheckOptionText.value.length >= 1) {
                            if (inputCheckOptionText.value.length > 500) {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else if (inputText.value.trim() == '') {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You must enter text";
                                break;
                            }
                            else if (inputText.value.length > 500) {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "";
                                c++;
                                break;
                            }
                        }
                        else if (inputCheckOption.checked == false && inputCheckOptionText.value.length >= 1) {
                            inputCheckOptionText.value = "";
                        }
                        if (inputCheck[j].checked == true) {
                            if (inputText.value.trim() == '') {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You must enter text expand";
                                break;
                            } else if (inputText.value.length > 500) {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "";
                                c++;
                                break;
                            }
                        }
                    }

                } else {
                    for (var j = 0; j < inputCheck.length; j++) {

                        if (inputCheck[j].checked == false) {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "Please choose your answer";

                        }


                        else if (inputCheck[j].checked == true) {
                            if (inputText.value.trim() == '') {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You must enter text";
                                break;
                            }
                            else if (inputText.value.length > 500) {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            } else {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "";
                                c++;
                                break;
                            }

                        }

                    }

                }



            }
            // check ko co text mowr roongj
            if (inputText == null) {
                if (inputCheckOption != null && inputCheckOptionText != null) {
                    for (var j = 0; j < inputCheck.length; j++) {


                        if (inputCheck[j].checked == false) {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "Please choose your answer";
                        }

                        if (inputCheckOption.checked == true && inputCheckOptionText.value.trim() == "") {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "Please enter your answer of option";
                            break;
                        }

                        else if (inputCheckOption.checked == true && inputCheckOptionText.value.length >= 1) {
                            if (inputCheckOptionText.value.length > 500) {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                                break;
                            }
                            else {
                                arrayRadioCompel[i].querySelector(".error").innerHTML = "";
                                c++;
                                break;
                            }
                        }
                        else if (inputCheckOption.checked == false && inputCheckOptionText.value.length >= 1) {
                            inputCheckOptionText.value = "";
                        }

                        if (inputCheck[j].checked == true) {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "";
                            c++;
                            break;
                        }
                    }

                } else {
                    for (var j = 0; j < inputCheck.length; j++) {

                        if (inputCheck[j].checked == false) {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "Please choose your answer";
                        }
                        else {
                            arrayRadioCompel[i].querySelector(".error").innerHTML = "";
                            c++;
                            break;
                        }

                    }
                }
            }



        }
        return c;
    }

    function checkRadioNon(arrayRadioNon, c) {
        for (var i = 0; i < arrayRadioNon.length; i++) {
            var inputCheck = arrayRadioNon[i].querySelectorAll(".button-radio.option");


            var inputCheckText = arrayRadioNon[i].querySelector(".answer-other.option.text-box.single-line");
            var inputCheckOption = arrayRadioNon[i].querySelector(".button-radio.option-others");


            var inputText = arrayRadioNon[i].querySelector(".survey-input-element.option-text.text-box.single-line");



            for (var j = 0; j < inputCheck.length; j++) {

                if (inputText != null && inputText.value.length >= 1) {
                    if (inputText.value.length > 500) {
                        arrayRadioNon[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                        c--;
                        break;

                    } else {
                        arrayRadioNon[i].querySelector(".error").innerHTML = "";

                    }
                }
                if (inputText != null && inputText.value.length == 0) {
                    arrayRadioNon[i].querySelector(".error").innerHTML = "";
                }

                if (inputCheckOption != null && inputCheckText != null) {
                    if (inputCheckOption.checked == true && inputCheckText.value.trim() == "") {
                        arrayRadioNon[i].querySelector(".error").innerHTML = "Please enter your answer";
                    }
                    else if (inputCheckOption.checked == true && inputCheckText.value.length >= 1) {
                        if (inputCheckText.value.length > 500) {
                            arrayRadioNon[i].querySelector(".error").innerHTML = "You cann't enter more than 500 characters";
                        } else {
                            arrayRadioNon[i].querySelector(".error").innerHTML = "";
                            c++;
                            break;
                        }
                    }
                    else if (inputCheckOption.checked == true && !inputCheckText.value.trim() == "") {
                        arrayRadioNon[i].querySelector(".error").innerHTML = "";
                        c++;
                        break;
                    }
                    else if (inputCheckOption.checked == false && inputCheckText.value.length >= 1) {
                        inputCheckText.value = "";
                    }
                }

            }



        }
        return c;
    }


    // Function check level
    function checkLevel(arrayLevel, d) {
        for (var i = 0; i < arrayLevel.length; i++) {
            var inputCheck = arrayLevel[i].querySelectorAll("input");

            for (var j = 0; j < inputCheck.length; j++) {
                if (inputCheck[j].checked == false) {
                    arrayLevel[i].querySelector(".error").innerHTML = "You must choose an answer";
                }
                else {
                    arrayLevel[i].querySelector(".error").innerHTML = "";
                    d++;
                    break;
                }
            }



        }

        return d;
    }



    //function system Valid
    function systemValid(numberCheckbox, numberRadio, numberText, numberLevel, numberCompel, numberCheckboxNon, numberRadioNon, numberTextNon, NumberUnChecked) {

        let sum = 0;
        sum = numberCheckbox + numberRadio + numberText + numberLevel + numberCheckboxNon + numberRadioNon + numberTextNon;
        let sumCompel = 0;
        sumCompel = numberCompel + NumberUnChecked;

        if (sum == sumCompel) {
            return true;
        } else {
            return false;
        }

    }

    function systemValidRq(NumberUnChecked, numberCheckboxNon, numberRadioNon, numberTextNon) {

        let sum = 0;
        sum = numberCheckboxNon + numberRadioNon + numberTextNon;

        if (sum == NumberUnChecked) {
            return true;
        } else {
            return false
        }
    }

    if (valid) {

        $("#myModal").modal();
    }
    return valid;
}

const myText = document.querySelector('.survey-header-description');
myText.style.cssText = `height: ${myText.scrollHeight}px; overflow-y:hidden`;
myText.addEventListener("input", function () {
    this.style.height = "auto";
    this.style.height = `${this.scrollHeight}px`;
});

