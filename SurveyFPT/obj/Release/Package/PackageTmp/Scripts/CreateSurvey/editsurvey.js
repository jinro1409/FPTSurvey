let numberQuestion = 1;


let typeInput = 'radio';
let number = 1;
let checkOther = true;
let numberSection = 1;
let countSection = 0;
let countQuestion = 1;
checkIsOtherChoice();
function selectType(numberClick, indexSection, indexQuestion) {
    removeShortText(numberClick);
    let addOptionDiv = document.querySelector('.add-' + numberClick);
    let addChoiceDiv = document.querySelector('.answer-' + numberClick);
    let addRankDiv = document.querySelector('.rank-' + numberClick);
    let addShortDiv = document.querySelector('.short-' + numberClick);
    let addChoiceOtherDiv = document.querySelector('.other-' + numberClick);
    let select = document.getElementById('type-question-' + numberClick);
    let addOtherDiv = document.querySelector('.add-answer-other-' + numberClick);
    let addAnswerOption = document.querySelector('.add-answer-option-' + numberClick);
    let addAnswerChoice = document.querySelector('.add-answer-choice-' + numberClick);
    let addAnswerList = document.querySelector('.answer-list-' + numberClick);
    let addTextChoiceAnswer = document.querySelectorAll('.other-content-check-' + numberClick);
    let option = select.options[select.selectedIndex];
    number = option.value;
    checkTypeInput();
    if (number == 1 || number == 2) {
        addChoiceDiv.style.display = "block";
        addRankDiv.style.display = "none";
        addOptionDiv.style.display = "block";
        addAnswerOption.style.display = "block";
        if (addChoiceOtherDiv.style.display == "none") {
            addOtherDiv.style.display = "block";
        }
        if (addAnswerList == null) {
            addAnswerChoice.style.display = "block";
        }
        if (addTextChoiceAnswer != null) {
            if (addTextChoiceAnswer.length == 1) {
                if (addTextChoiceAnswer[0].querySelector('.txt-status') != null) {
                    let temp = addTextChoiceAnswer[0].getElementsByClassName("txt-status")[0].value;
                    if (temp) {
                        addTextChoiceAnswer[0].parentElement.parentElement.style.display = "block";
                        addOtherDiv.style.display = "none";
                    }
                } else {
                    addTextChoiceAnswer[0].parentElement.parentElement.style.display = "block";
                    addOtherDiv.style.display = "none";
                }
            }
            if (addTextChoiceAnswer.length > 1) {
                addTextChoiceAnswer[1].parentElement.parentElement.style.display = "block";
                addOtherDiv.style.display = "none";
            }
        }
    } else {
        addChoiceDiv.style.display = "none";
        addOptionDiv.style.display = "none";
    }
    let getType = document.querySelectorAll('.answer-list-choose_input-' + numberClick);
    changeType(getType);
    if (number == 4) {
        addOtherDiv.style.display = "none";
        addRankDiv.style.display = "block";
        addChoiceOtherDiv.style.display = "none";

        if (addChoiceOtherDiv.style.display == "none") {
            addOtherDiv.style.display = "none";
        }
    } else {
        addRankDiv.style.display = "none";
    }
    if (number == 3) {
        addChoiceOtherDiv.style.display = "none";
        addShortDiv.style.display = "block";
        addShortText(numberClick, indexSection, indexQuestion);
        if (addChoiceOtherDiv.style.display == "none") {
            addOtherDiv.style.display = "none";
        }
    } else {
        addShortDiv.style.display = "none";
    }
}
function addShortText(numberClick, indexSection, indexQuestion) {
    let addShortAnswer = document.querySelector('.short-' + numberClick);
    let answerDivText = `
    <div class="short-content short-content-${numberClick}">
       <input id="Sections_${indexSection}__Questions_${indexQuestion}__TextAnswer_ID" name="Sections[${indexSection}].Questions[${indexQuestion}].TextAnswer.ID" type="hidden" value="">
       <input class="short-content_input" id="Sections_${indexSection}__Questions_${indexQuestion}__TextAnswer_Label" name="Sections[${indexSection}].Questions[${indexQuestion}].TextAnswer.Label" placeholder="Short answer text " type="text" readonly="readonly" value="">
    </div>
    `;
    addShortAnswer.insertAdjacentHTML('beforeend', answerDivText);
}
function removeShortText(numberClick) {
    let addShortAnswer = document.querySelector('.short-content-' + numberClick);
    if (addShortAnswer != null) {
        addShortAnswer.remove();
    }
}

function addSection(element, numberIndex,numberIndexQuestion) {
    if (countSection <= numberIndex) {
        countSection = numberIndex;
    }
    if (numberSection <= numberIndex) {
        numberSection = numberIndex;
    }
    if (numberQuestion < numberIndexQuestion) {
        numberQuestion = numberIndexQuestion ;
    }
    numberSection++;
    numberQuestion++;
    let formSection = element.parentElement.parentElement.parentElement;
    let sectionDetails = `
    <div id="form-section">
    <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required." id="Sections_${countSection}__ID" name="Sections[${countSection}].ID" type="hidden" value="">
    <div class="section section-${numberSection}">
        <div class="section-title">
            <input type="text" name="Sections[${countSection}].Name" class="section-title_input element" placeholder="Untitled title">
            <br />
            <small></small>
        </div>
        <div class="section-description">
            <input type="text" name="Sections[${countSection}].Description" class="section-description_input element" placeholder="Description">
            <br />
            <small></small>
        </div>
        <div class="section-question section-question-${numberSection}">
        <div class="question question-${numberSection}">
            <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
            id="Sections_${countSection}__Questions_0__ID" name="Sections[${countSection}].Questions[0].ID" type="hidden" value="">
        <div class="question-list">
            <div class="question-list-title">
                <input class="question-list-title_input element" id="Sections_${countSection}__Questions_0__QuestionLabel" name="Sections[${countSection}].Questions[0].QuestionLabel" placeholder="Untitled question" type="text" value="">
                <div class="question-list-title_option">
                <select name="Sections[${countSection}].Questions[0].QuestionCategory.ID" class="type-question btn-select" id="type-question-${numberQuestion}" onChange="selectType(${numberQuestion},${countSection},0)">
                    <option value="1">Multiple choice</option>
                    <option value="2">Checkboxes</option>
                    <option value="3">Short answer</option>
                    <option value="4">Linear scale</option>
                </select>
                </div>
                <small class="error-question"></small>
            </div>
            
            <!-- Câu trả lời trắc nghiệm     -->
            <div class="answer answer-${numberQuestion}">
                <div class="answer-choice answer-choice-${numberQuestion}">

                </div>
                <div class="answer-other answer-other-${numberQuestion}">

                </div>
                <small class="required-answer"></small>
            </div>
            <!-- /Câu trả lời trắc nghiệm     -->
            <!-- Câu trả lời ranking -->
            <div class="rank rank-${numberQuestion}" style="display: none;">
                <div class="rank-number">
                    <select class="rank-number_first">
                        <option value="1" selected>1</option>
                    </select>
                    <span class="rank-number_txt">to</span>
                    <select name="number-rank-${numberQuestion}" class="rank-number_last" id="rank-number_last-${numberQuestion}" onChange="selectNumberLast(${numberQuestion},${countSection},0)">
                        <option value="2" selected>2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="rank-content rank-content-${numberQuestion}">
                    <div class="rank-content-number rank-content-number-${numberQuestion}">
                        <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                        id="Sections_${countSection}__Questions_0__LinearAnswers_0__ID" name="Sections[${countSection}].Questions[0].LinearAnswers[0].ID" type="hidden" value="">
                        <span class="rank-content-number_txt">1</span>
                        <input type="hidden" name="Sections[${countSection}].Questions[0].LinearAnswers[0].ScaleNumber" value="1"/>
                        <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                         id="Sections_${countSection}__Questions_0__LinearAnswers_0__ScaleLabel" name="Sections[${countSection}].Questions[0].LinearAnswers[0].ScaleLabel"
                         class="rank-content-number_input" placeholder="Label" value="">
                        <small class="error-rank"></small>
                    </div>
                    <div class="rank-content-number rank-content-number-${numberQuestion}">
                         <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                        id="Sections_${countSection}__Questions_0__LinearAnswers_1__ID" name="Sections[${countSection}].Questions[0].LinearAnswers[1].ID" type="hidden" value="">
                        <span class="rank-content-number_txt">2</span>
                        <input type="hidden" name="Sections[${countSection}].Questions[0].LinearAnswers[0].ScaleNumber" value="2"/>
                         <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                        id="Sections_${countSection}__Questions_0__LinearAnswers_1__ScaleLabel" name="Sections[${countSection}].Questions[0].LinearAnswers[1].ScaleLabel"
                        class="rank-content-number_input" placeholder="Label" value="">
                        <small class="error-rank"></small>
                    </div>
                </div>
            </div>
            <!-- /Câu trả lời ranking -->

            
            <!-- Câu trả lời ngắn -->
            <div class="short short-${numberQuestion}" style="display: none;">
              
            </div>
            
            <!-- /Câu trả lời ngắn -->

            <!-- Câu trả lời thêm -->
            <div class="other other-${numberQuestion}" style="display: none;">
                <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                 id="Sections_${countSection}__Questions_0__TextAnswer__ID" name="Sections[${countSection}].Questions[0].TextAnswer.ID" type="hidden" value="">
                <div class="other-content other-content-${numberQuestion}">
                    <input class="other-content_input" id="Sections_${countSection}__Questions_0__TextAnswer_Label" name="Sections[${countSection}].Questions[0].TextAnswer.Label" placeholder="Other:" type="text" value="">
                    <button class="btnOtherDelete fa-solid fa-trash"  type="button" onclick="removeOther(${numberQuestion})" title="Delete text expand"></button>
                </div>
                <small class="error-expand"></small>
            </div>
            <!-- /Câu trả lời thêm -->

            <div class="option-add">
                <div class="add add-${numberQuestion}">
                    <div class="add-answer">
                        <div class="add-answer-option add-answer-option-${numberQuestion}">
                            <span class="add-answer-option_choose" onclick="addAnswer(${numberQuestion},${countSection},0)">Add Option</span>
                        </div>
                        <div class="add-answer-choice add-answer-choice-${numberQuestion}">
                            <span class="add-answer-choice_other" onclick="addChoiceOther(${numberQuestion},${countSection},0)">Add "Other"</span>
                        </div>
                    </div>
                    </div> 
                <div class="add-answer-other add-answer-other-${numberQuestion}">
                    <span class="add-answer-other_choose " onclick="addOther(${numberQuestion},${countSection},0)">Text expand</span>
                </div>
            </div>

            <div class="icon-box">
                <span class="checkbox-content">Required</span>
                <div class="checkbox-a">
                    <input type="checkbox" name="Sections[${countSection}].Questions[0].IsRequire" value="true"/>
                </div>
            </div>
        </div>
        <div class="option-box">
            <div class="option-element">
                <i class="fa-solid fa-plus" onclick="addQuestion(${numberSection},${countSection},this,${numberQuestion})" title="Add question"></i>
                <i class="fa-solid fa-trash" onclick="delQuestion(this)" title="Delete question"></i>
                <i class="fa-solid fa-chevron-up ClickUP" aria-hidden="true" onclick="ChangePositionUP(this)" title="Move up question"></i>
                <i class="fa-solid fa-chevron-down ClickDOWN" aria-hidden="true" onclick="ChangePositionDOWN(this)" title="Move down question"></i>
            </div>
        </div>
    </div>
        </div>
    </div>
    <div class="option-section">
        <div class="option-element">
            <i class="fa-solid fa-plus" onclick="addSection(this,${countSection},${numberQuestion})" title="Add section"></i>
            <i class="fa-solid fa-trash" onclick="delSection(this)" title="Delete section"></i>
            <i class="fa-solid fa-chevron-up ClickUP" aria-hidden="true" onclick="ChangePositionUP(this)" title="Move up section"></i>
            <i class="fa-solid fa-chevron-down ClickDOWN" aria-hidden="true" onclick="ChangePositionDOWN(this)" title="Move down section"></i>
        </div>
    </div>
</div>
    `;
    formSection.insertAdjacentHTML("afterend", sectionDetails);
    countSection++;
}
function delSection(element) {
    let countDelSection = 0;
    let positionSection = document.querySelectorAll('#form-section');
    for (let i = 0; i < positionSection.length; i++) {
        if (positionSection[i].style.display == "") {
            countDelSection = countDelSection +1;
        }
    }
    let checkSection = element.parentElement.parentElement.parentElement.querySelector(".section-status");
    if (countDelSection > 1) {
        if (checkSection != null) {
            element.parentElement.parentElement.parentElement.style.display = "none";
            element.parentElement.parentElement.parentElement.getElementsByClassName("section-status")[0].value = false;
        } else {
            element.parentElement.parentElement.parentElement.remove();
        }
    }
}
function addQuestion(numberClick, sectionIndex, element,numberIndexQuestion) {
    typeInput = 'radio';
    if (numberQuestion < numberIndexQuestion) {
        numberQuestion = numberIndexQuestion ;
    }
    numberQuestion++;
    let formQuestion = element.parentElement.parentElement.parentElement;
    let randomNumberQuestion = getQuestionID();
    let questionDetails =
        `
    <div class="question question-${numberClick}">
              <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__ID" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].ID" type="hidden" value="">
                        <div class="question-list">
                            <div class="question-list-title">
                                <input class="question-list-title_input element" id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__QuestionLabel" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].QuestionLabel" placeholder="Untitled question" type="text" value="">
                                <div class="question-list-title_option">
                                <select name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].QuestionCategory.ID" class="type-question btn-select" id="type-question-${numberQuestion}" onChange="selectType(${numberQuestion},${sectionIndex},${randomNumberQuestion})">
                                    <option value="1">Multiple choice</option>
                                    <option value="2">Checkboxes</option>
                                    <option value="3">Short answer</option>
                                    <option value="4">Linear scale</option>
                                </select>
                                </div>
                                <small class="error-question"></small>
                            </div>
                           
                            <!-- Câu trả lời trắc nghiệm     -->
                            <div class="answer answer-${numberQuestion}">
                                <div class="answer-choice answer-choice-${numberQuestion}">

                                 </div>
                                 <div class="answer-other answer-other-${numberQuestion}">

                                 </div>
                                 <small class="required-answer"></small>
                            </div>
                            <!-- /Câu trả lời trắc nghiệm     -->
                            <!-- Câu trả lời ranking -->
                            <div class="rank rank-${numberQuestion}" style="display: none;">
                                <div class="rank-number">
                                    <select class="rank-number_first">
                                        <option value="1" selected>1</option>
                                    </select>
                                    <span class="rank-number_txt">to</span>
                                    <select name="number-rank-${numberQuestion}" class="rank-number_last" id="rank-number_last-${numberQuestion}" onChange="selectNumberLast(${numberQuestion},${sectionIndex},${randomNumberQuestion})">
                                        <option value="2" selected>2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                                <div class="rank-content rank-content-${numberQuestion}">
                                    <div class="rank-content-number rank-content-number-${numberQuestion}">
                                         <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                                         id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__LinearAnswers_0__ID" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].LinearAnswers[0].ID" type="hidden" value="">
                                         <span class="rank-content-number_txt">1</span>
                                         <input type="hidden" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].LinearAnswers[0].ScaleNumber" value="1"/>
                                         <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                                         id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__LinearAnswers_0__ID" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].LinearAnswers[0].ScaleLabel"
                                         class="rank-content-number_input" placeholder="Label" value="">
                                         <small class="error-rank"></small>
                                    </div>
                                    <div class="rank-content-number rank-content-number-${numberQuestion}">
                                         <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                                         id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__LinearAnswers_1__ID" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].LinearAnswers[1].ID" type="hidden" value="">
                                         <span class="rank-content-number_txt">2</span>
                                         <input type="hidden" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].LinearAnswers[1].ScaleNumber" value="2"/>
                                         <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                                         id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__LinearAnswers_1__ID" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].LinearAnswers[1].ScaleLabel"
                                         class="rank-content-number_input" placeholder="Label" value="">
                                         <small class="error-rank"></small>
                                    </div>
                                </div>
                            </div>
                            <!-- /Câu trả lời ranking -->

                            
                            <!-- Câu trả lời ngắn -->
                            <div class="short short-${numberQuestion}" style="display: none;">
                               
                            </div>
                            
                            <!-- /Câu trả lời ngắn -->

                            <!-- Câu trả lời thêm -->
                            <div class="other other-${numberQuestion}" style="display: none;">
                                 <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                                 id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__TextAnswer__ID" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].TextAnswer.ID" type="hidden" value="">
                                <div class="other-content other-content-${numberQuestion}">
                                   <input class="other-content_input" id="Sections_${sectionIndex}__Questions_${randomNumberQuestion}__TextAnswer_Label" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].TextAnswer.Label" placeholder="Short answer text" type="text" value="">
                                    <button class="btnOtherDelete fa-solid fa-trash"  type="button" onclick="removeOther(${numberQuestion})" title="Delete text expand"></button>
                                </div>
                                <small class="error-expand"></small>
                            </div>
                            <!-- /Câu trả lời thêm -->

                             <div class="option-add">
                                <div class="add add-${numberQuestion}">
                                    <div class="add-answer">
                                        <div class="add-answer-option add-answer-option-${numberQuestion}">
                                            <span class="add-answer-option_choose" onclick="addAnswer(${numberQuestion},${sectionIndex},${randomNumberQuestion})">Add Option</span>
                                        </div>
                                        <div class="add-answer-choice add-answer-choice-${numberQuestion}">
                                            <span class="add-answer-choice_other" onclick="addChoiceOther(${numberQuestion},${sectionIndex},${randomNumberQuestion})">Add "Other"</span>
                                        </div>
                                    </div>
                                    </div> 
                                <div class="add-answer-other add-answer-other-${numberQuestion}">
                                    <span class="add-answer-other_choose " onclick="addOther(${numberQuestion},${sectionIndex},${randomNumberQuestion})">Text expand</span>
                                </div>
                            </div>

                            <div class="icon-box">
                                <span class="checkbox-content">Required</span>
                                <div class="checkbox-a">
                                        <input type="checkbox" name="Sections[${sectionIndex}].Questions[${randomNumberQuestion}].IsRequire" value="true"/>
                                </div>
                            </div>
                        </div>
                        <div class="option-box">
                            <div class="option-element">
                                <i class="fa-solid fa-plus" onclick="addQuestion(${numberClick},${sectionIndex},this,${numberQuestion})" title="Add question"></i>
                                <i class="fa-solid fa-trash" onclick="delQuestion(this)" title="Delete question"></i>
                                <i class="fa-solid fa-chevron-up ClickUP" aria-hidden="true" onclick="ChangePositionUP(this)" title="Move up question"></i>
                                <i class="fa-solid fa-chevron-down ClickDOWN" aria-hidden="true" onclick="ChangePositionDOWN(this)" title="Move down question"></i>
                            </div>
                        </div>
                    </div>
    `;
    formQuestion.insertAdjacentHTML('afterend', questionDetails);
    countQuestion++;
}
let arrayRandom = [];
function addAnswer(numberClick, indexSection, indexQuestion) {
    let select = document.getElementById('type-question-' + numberClick);
    let option = select.options[select.selectedIndex];
    number = option.value;
    checkTypeInput();
    let addChoiceDiv = document.querySelector('.answer-choice-' + numberClick);
    let randomNumberAnswer = getID();

    let answerDetails = `
        <div class="answer-list answer-list-${numberClick}">
            <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
            id="Sections_${indexSection}__Questions_${indexQuestion}__ChoiceAnswers_${randomNumberAnswer}__ID" name="Sections[${indexSection}].Questions[${indexQuestion}].ChoiceAnswers[${randomNumberAnswer}].ID" type="hidden" value="">
            <div class="answer-list-choose">
                <input type="${typeInput}" class="answer-list-choose_input-${numberClick}" name="radio_answer" disabled>
            </div>
            <div class="answer-list-content">
                <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                id="Sections_${indexSection}__Questions_${indexQuestion}__ChoiceAnswers_${randomNumberAnswer}__Label"
                name="Sections[${indexSection}].Questions[${indexQuestion}].ChoiceAnswers[${randomNumberAnswer}].Label"
                class="answer-list-content_input" placeholder="Option" value="">
            </div>
            <button  type="button" class="btnAnswerDelete fa-solid fa-trash" onclick="removeAnswer(this)" title="Delete answer"></button>
            <br />
            <small></small>
        </div>
        `;
    addChoiceDiv.insertAdjacentHTML('beforeend', answerDetails);
}
function getID() {
    let randomNumber = Math.floor(Math.random() * 10000);
    if (arrayRandom.includes(randomNumber))
        while (arrayRandom.includes(randomNumber)) {
            randomNumber = Math.floor(Math.random() * 10000);
        }
    arrayRandom.push(randomNumber);
    return randomNumber;
}
let arrayQuestionId = [];
function getQuestionID() {
    let randomNumber = (Math.floor(Math.random() * 10000)) +500;
    if (arrayQuestionId.includes(randomNumber))
        while (arrayQuestionId.includes(randomNumber)) {
            randomNumber = (Math.floor(Math.random() * 10000))+500;
        }
    arrayQuestionId.push(randomNumber);
    return randomNumber;
}
function removeAnswer(element) {
    let checkAnswer = element.parentElement.querySelector(".choice-status");
    if (checkAnswer != null) {
        element.parentElement.style.display = "none";
        element.parentElement.getElementsByClassName("choice-status")[0].value = false;
    } else {
        element.parentElement.remove();
    }


}

function addChoiceOther(numberClick, indexSection, indexQuestion) {
    let select = document.getElementById('type-question-' + numberClick);
    let option = select.options[select.selectedIndex];
    number = option.value;
    checkTypeInput();
    let disableChoiceOther = document.querySelector('.add-answer-choice-' + numberClick);
    disableChoiceOther.style.display = 'none';
    let addChoiceDiv = document.querySelector('.answer-other-' + numberClick);
    let randomNumberAnswer = getID();
    let answerDetails = `
         <div class="answer-list answer-list-${numberClick}"">
            <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
            id="Sections_${indexSection}__Questions_${indexQuestion}__ChoiceAnswers_${randomNumberAnswer}__ID" name="Sections[${indexSection}].Questions[${indexQuestion}].ChoiceAnswers[${randomNumberAnswer}].ID" type="hidden" value="">
            <div class="answer-list-choose">
                <input type="${typeInput}" class="answer-list-choose_input-${numberClick}" name="radio_answer" disabled>
            </div>
            <div class="answer-list-content">
             <input type ="text" class="answer-list-content_input" placeholder="Other..." value="">
             <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
                id="Sections_${indexSection}__Questions_${indexQuestion}__ChoiceAnswers_${randomNumberAnswer}__IsOtherChoice"
                name="Sections[${indexSection}].Questions[${indexQuestion}].ChoiceAnswers[${randomNumberAnswer}].IsOtherChoice"
                type="hidden" class="answer-list-content_check" value="true">
            </div>
            <button  type="button" class="btnAnswerDelete fa-solid fa-trash" onclick="removeChoiceOther(this,${numberClick})" title="Delete other answer"></button>
        </div>
        `;
    addChoiceDiv.insertAdjacentHTML('beforeend', answerDetails);
}
function removeChoiceOther(element, numberClick) {
    let disableChoiceOther = document.querySelector('.add-answer-choice-' + numberClick);
    disableChoiceOther.style.display = 'block';
    let checkChoice = element.parentElement.querySelector(".other-status");
    if (checkChoice != null) {
        element.parentElement.style.display = "none";
        element.parentElement.getElementsByClassName("other-status")[0].value = false;
    } else {
        element.parentElement.remove();
    }
}

function delQuestion(element) {
    let countDelQuestion = 0;
    let positionQuestion = element.parentElement.parentElement.parentElement.parentElement.querySelectorAll('.question');
    console.log(positionQuestion);
    for (let i = 0; i < positionQuestion.length; i++) {
        if (positionQuestion[i].style.display == "") {
            countDelQuestion = countDelQuestion +1;
        }
    }
    console.log(countDelQuestion);
    let checkQuestion = element.parentElement.parentElement.parentElement.querySelector(".question-status");
    if (countDelQuestion > 1) {
        if (checkQuestion != null) {
            element.parentElement.parentElement.parentElement.style.display = "none";
            element.parentElement.parentElement.parentElement.getElementsByClassName("question-status")[0].value = false;
        } else {
            element.parentElement.parentElement.parentElement.remove();
        }
    }
}

function addOther(numberClick, indexSection, indexQuestion) {
    let disableOther = document.querySelector('.add-answer-other-' + numberClick);
    disableOther.style.display = 'none';
    let otherContent = document.querySelector('.other-' + numberClick);
    otherContent.querySelector('.other-content_input').value = ''
    let addChoiceOtherDiv = document.querySelector('.other-' + numberClick);
    if (addChoiceOtherDiv.style.display == 'none') {
        addChoiceOtherDiv.style.display = "block";
    }
    let addTextChoiceAnswer = document.querySelector('.other-content-' + numberClick);
    let answerChoiceText = `
        <div class="other-content-check-${numberClick}">
            <input data-val="true" data-val-required="The CheckTextChoice field is required."
            id="Sections_${indexSection}__Questions_${indexQuestion}__NewTextAnswer_0__ID"
            name="Sections[${indexSection}].Questions[${indexQuestion}].NewTextAnswer[0].ID" class="other-content-check_txt" type="hidden" value="true">
            <input data-val="true" data-val-required="The CheckTextChoice field is required."
            id="Sections_${indexSection}__Questions_${indexQuestion}__TextAnswer__CheckTextChoice"
            name="Sections[${indexSection}].Questions[${indexQuestion}].TextAnswer.CheckTextChoice" class="other-content-check_txt" type="hidden" value="true">
        </div>
    `;
    addTextChoiceAnswer.insertAdjacentHTML('beforeend', answerChoiceText);

}
function removeOther(numberClick) {
    let disableOther = document.querySelector('.add-answer-other-' + numberClick);
    disableOther.style.display = 'block';
    addChoiceOtherDiv = document.querySelector('.other-' + numberClick);
    if (addChoiceOtherDiv.style.display == 'block') {
        addChoiceOtherDiv.style.display = "none";
    }
    let addTextChoiceAnswer = document.querySelectorAll('.other-content-check-' + numberClick);
    if (addTextChoiceAnswer != null) {
        if (addTextChoiceAnswer.length == 1) {
            if (addTextChoiceAnswer[0].querySelector('.txt-status') == null) {
                addTextChoiceAnswer[0].remove();
            } else {
                addTextChoiceAnswer[0].style.display = "none";
                addTextChoiceAnswer[0].getElementsByClassName("txt-status")[0].value = false;
            }
        }
        if (addTextChoiceAnswer.length >1) {
            addTextChoiceAnswer[1].remove();
        }
    }
}
function changeSelect(numberClick) {
    addChoiceOtherDiv = document.querySelector('.other-' + numberClick);
    if (addChoiceOtherDiv.style.display == 'block') {
        addChoiceOtherDiv.style.display = "none";
    }
}
function checkTypeInput() {
    if (number == 1) {
        typeInput = 'radio';
    }
    else if (number == 2) {
        typeInput = 'checkbox';
    }
}
function changeType(listInput) {
    for (let i = 0; i < listInput.length; i++) {
        listInput[i].type = typeInput;
    }
}
function selectNumberLast(clickNumber, indexSection, indexQuestion) {
    removeAnswerRank(clickNumber)
    let select = document.getElementById('rank-number_last-' + clickNumber);
    let rank = document.querySelector('.rank-content-' + clickNumber);
    let option = select.options[select.selectedIndex];
    let numberRank = option.value;
    for (let i = 0; i < numberRank; i++) {
        let answerRank = `
         <div class="rank-content-number rank-content-number-${clickNumber}">
             <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
             id="Sections_${indexSection}__Questions_${indexQuestion}__LinearAnswers_${i}__ID" name="Sections[${indexSection}].Questions[${indexQuestion}].LinearAnswers[${i}].ID" type="hidden" value="">
             <span class="rank-content-number_txt rank-content-number_txt-${i + 1}">${i + 1}</span>
             <input type="hidden" name="Sections[${indexSection}].Questions[${indexQuestion}].LinearAnswers[${i}].ScaleNumber" value="${i + 1}"/>
             <input data-val="true" data-val-number="The field ID must be a number." data-val-required="The ID field is required."
             id="Sections_${indexSection}__Questions_${indexQuestion}__LinearAnswers_${i}__ID" name="Sections[${indexSection}].Questions[${indexQuestion}].LinearAnswers[${i}].ScaleLabel"
             class="rank-content-number_input" placeholder="Label">
             <small class="error-rank"></small>
        </div>
        `;
        rank.insertAdjacentHTML('beforeend', answerRank);
    }
}
function removeAnswerRank(clickNumber) {
    const listRank = document.querySelectorAll('.rank-content-number-' + clickNumber);
    listRank.forEach(listR => {
        listR.remove();
    });
}


function ChangePositionUP(element) {
    let ListQuestion = element.parentElement.parentElement.parentElement.parentElement;
    CurrentElement_TOMOVE = element.parentElement.parentElement.parentElement;
    previousElement_TOMOVE = CurrentElement_TOMOVE.previousElementSibling;
    if (previousElement_TOMOVE != null) {
        ListQuestion.insertBefore(CurrentElement_TOMOVE, previousElement_TOMOVE);
    } else {
        alert('Cannot Move UP')
    }
}


function ChangePositionDOWN(element) {
    let ListQuestion = element.parentElement.parentElement.parentElement.parentElement;
    CurrentElement_TOMOVE = element.parentElement.parentElement.parentElement;
    nextElement_TOMOVE = CurrentElement_TOMOVE.nextElementSibling;
    if (nextElement_TOMOVE != null) {
        ListQuestion.insertBefore(nextElement_TOMOVE, CurrentElement_TOMOVE);
    } else {
        alert('Cannot Move Below')
    }
}

function checkIsOtherChoice() {

    let inputOther = document.querySelectorAll('.answer-list-content_check');
    let inputOtherChoice;
    for (let i = 0; i < inputOther.length; i++) {
        if (inputOther[i] != null) {
            inputOtherChoice = inputOther[i].parentElement.parentElement.parentElement.parentElement.parentElement;
            inputOtherChoice.querySelector('.add-answer-choice').style.display = "none";
        }
    }
    let inputText = document.querySelectorAll('.other-content-check_txt');
    let inputOtherText;
    for (let j = 0; j < inputText.length; j++) {
        if (inputText[j] != null) {
            inputOtherText = inputText[j].parentElement.parentElement.parentElement.parentElement.parentElement;
            inputOtherText.querySelector('.add-answer-other').style.display = "none";
        }
    }
    let inputShortAnswer = document.querySelectorAll('.short-content');
    let inputShortText;
    for (let k = 0; k < inputShortAnswer.length; k++) {
        if (inputShortAnswer[k] != null) {
            inputShortText = inputShortAnswer[k].parentElement.parentElement.parentElement;
            inputShortText.querySelector('.add-answer-other').style.display = "none";
            inputShortText.querySelector('.add-answer-choice').style.display = "none";
            inputShortText.querySelector('.add-answer-option').style.display = "none";
        }
    }

    let inputLinearAnswer = document.querySelectorAll('.type-question');
    let inputLinearScale;
    for (let t = 0; t < inputLinearAnswer.length; t++) {
        if (inputLinearAnswer[t] != null) {
            inputLinearScale = inputLinearAnswer[t].parentElement.parentElement.parentElement;
            if (inputLinearScale.getElementsByClassName("type-question")[0].value == 4) {
                inputLinearScale.querySelector('.add-answer-other').style.display = "none";
                inputLinearScale.querySelector('.add-answer-choice').style.display = "none";
                inputLinearScale.querySelector('.add-answer-option').style.display = "none";
            }

        }
    }

}

//validate
function checkEdit(idForm) {
    try {
        let form = document.querySelector(idForm);
        let dateInput = form.querySelectorAll('.survey-date_input');
        let inputOpenDate = document.getElementById('OpenTime');
        let inputCloseDate = document.getElementById('CloseTime');
        let surveyName = form.querySelectorAll('.title-name');
        let surveyDescription = form.querySelectorAll('.title-description');
        let sectionTitle = form.querySelectorAll('.section-title_input');
        let sectionDescription = form.querySelectorAll('.section-description_input');
        let questionDescription = form.querySelectorAll('.question-list-title_input');
        let textExpand = form.querySelectorAll('.other-content_input');
        let listAnswerChoice = form.querySelectorAll('.answer');
        let listOther = form.querySelectorAll('.other');
        let checkAdd = true;
        let checkAddChoice = true;

        let checkDate = checkDateInput(dateInput, "Please Choose Date");
        let checkClose = true;
        if (checkDate) {
            checkClose = checkCloseDate(inputOpenDate, inputCloseDate);
        }
        /*Check Survey Name*/
        let checkSurveyName = checkListInput(surveyName);
        let checkLengthSurveyName = checkLengthInput(surveyName, 500);
        /*Check Survey Name*/


        /*Check Survey Description*/
        let checkSurveyDescription = checkListInput(surveyDescription);
        let checkLengthSurveyDescription = checkLengthInput(surveyDescription, 2000);
        /*Check Survey Description*/

        /*Check Section title*/
        let checkSectionTitle = true;
        let checkSectionTitleInput = true;
        let checkSectionTitleLength = true;
        checkSectionTitleInput = checkInput(sectionTitle, checkSectionTitleInput);
        checkSectionTitleLength = checkLength(sectionTitle, checkSectionTitleLength, 500);
        checkSectionTitle = checkValidate(checkSectionTitleInput, checkSectionTitleLength);
        /*Check Section title*/


        /*Check Section description*/
        let checkSectionDes = true;
        let checkSectionDesInput = true;
        let checkSectionDesLength = true;
        checkSectionDesInput = checkInput(sectionDescription, checkSectionDesInput);
        checkSectionDesLength = checkLength(sectionDescription, checkSectionDesLength, 500);
        checkSectionDes = checkValidate(checkSectionDesInput, checkSectionDesLength);
        /*Check Section description*/


        /*Check Question*/
        let checkQuestion = true;
        let checkQuestionLabel = true;
        let checkLengthQuestion = true;
        checkQuestionLabel = checkInput(questionDescription, checkQuestionLabel);
        checkLengthQuestion = checkLength(questionDescription, checkLengthQuestion, 500);
        checkQuestion = checkValidate(checkQuestionLabel, checkLengthQuestion);
        /*Check Question*/

        /*Check TextExpand*/
        let checkExpand = true;
        let checkLengthExpand = true;
        checkLengthExpand = checkTextExpand(textExpand, checkLengthExpand, 500, listOther);
        if (checkLengthExpand) {
            checkExpand = true;
        } else {
            checkExpand = false;
        }
        /*Check TextExpand*/

        let checkLinear = true;
        let checkChoice = true;
        let checkRankLabel = true;
        let checkLengthRank = true;
        let checkChoiceLabel = true;
        let checkLengthChoiceLabel = true;
        let checkValue = true;
        let selectTypeQuestion = document.querySelectorAll('.btn-select');
        for (let j = 0; j < selectTypeQuestion.length; j++) {
            if (selectTypeQuestion[j].options[selectTypeQuestion[j].selectedIndex].value == 1 || selectTypeQuestion[j].options[selectTypeQuestion[j].selectedIndex].value == 2) {
                let x = selectTypeQuestion[j].parentElement.parentElement.parentElement.querySelector('.answer-choice').querySelectorAll('.answer-list-content_input');
                checkAdd = checkAddAnswer(listAnswerChoice, checkAdd);
                if (checkAdd) {
                    checkAddChoice = true;
                } else {
                    checkAddChoice = false;
                }
                for (let k = 0; k < x.length; k++) {
                    if (x[k].style.display == "none") {

                    } else {
                        checkValue = false;
                    }
                }

                if (checkValue) {
                    checkChoice = false;
                } else {
                    let answerChoice = selectTypeQuestion[j].parentElement.parentElement.parentElement.querySelector('.answer-choice').querySelectorAll('.answer-list-content_input');
                    for (let k = 0; k < answerChoice.length; k++) {
                        if (!answerChoice[k].value) {
                            checkChoiceLabel = false;
                            answerChoice[k].parentElement.parentElement.querySelector('small').innerHTML = "Please enter Text";
                        }
                    }
                    for (let m = 0; m < answerChoice.length; m++) {
                        if (answerChoice[m].value.length > 500) {
                            checkLengthChoiceLabel = false;
                            answerChoice[m].parentElement.parentElement.querySelector('small').innerHTML = "Please enter less than 500 words"
                        }
                        if (answerChoice[m].value.length < 500 && answerChoice[m].value.length > 0) {
                            answerChoice[m].parentElement.parentElement.querySelector('small').innerHTML = "";
                        }
                    }
                    if (checkChoiceLabel && checkLengthChoiceLabel) {
                        checkChoice = true;
                    } else {
                        checkChoice = false;
                    }
                }
             
            }
            if (selectTypeQuestion[j].options[selectTypeQuestion[j].selectedIndex].value == 4) {
                let textFirstLinear = selectTypeQuestion[j].parentElement.parentElement.parentElement.querySelectorAll('.rank-content-number_input');
                checkRankLabel = checkInput(textFirstLinear, checkRankLabel);
                checkLengthRank = checkLength(textFirstLinear, checkLengthRank, 500);
                checkLinear = checkValidate(checkRankLabel, checkLengthRank);
            }
        }
        if (checkDate && checkSurveyName && checkSurveyDescription && checkSectionDes && checkSectionTitle && checkLengthSurveyDescription
            && checkLengthSurveyName && checkLinear && checkChoice && checkQuestion && checkExpand && checkAddChoice && checkClose) {
            $("#myModal").modal();
        }

    } catch (Error) {
        console.log(Error)
        return false;
    }

    function checkValidate(checkInput, checkLength) {
        if (checkInput && checkLength) {
            return true;
        } else {
            return false;
        }
    }
    function checkAddAnswer(input, check) {
        let checkAdd = true;
        for (let k = 0; k < input.length; k++) {
            if (input[k].style.display == "" || input[k].style.display == "block") {
                let listAnswer = input[k].querySelector('.answer-choice').querySelectorAll('.answer-list');
                if (input[k].querySelector('.answer-choice').querySelectorAll('.answer-list').length > 0) {
                    for (let i = 0; i < listAnswer.length; i++) {
                        if (listAnswer[i].style.display == "" || listAnswer[i].style.display == "block") {
                            checkAdd = true;
                            break;
                        } else {
                            checkAdd = false;
                        }
                    }
                    if (!checkAdd) {
                        check = false;
                        input[k].parentElement.querySelector('.required-answer').innerHTML = "Please add answer";
                        input[k].parentElement.querySelector('.required-answer').style.marginLeft = "40%";
                    } else {
                        input[k].parentElement.querySelector('.required-answer').innerHTML = "";
                        input[k].parentElement.querySelector('.required-answer').style.margin = "0";
                    }
                }
                if (input[k].querySelector('.answer-choice').querySelectorAll('.answer-list').length == 0) {
                    check = false;
                    input[k].parentElement.querySelector('.required-answer').innerHTML = "Please add answer";
                    input[k].parentElement.querySelector('.required-answer').style.marginLeft = "40%";
                }
            }

        }
        return check;
    }
    function checkInput(input, check) {
        for (let k = 0; k < input.length; k++) {
            if (!input[k].value) {
                check = false;
                input[k].parentElement.querySelector('small').innerHTML = "Please enter Text";
            }
        }
        return check;
    }
    function checkLength(input, check, max) {
        for (let m = 0; m < input.length; m++) {
            if (input[m].value.length > max) {
                check = false;

                input[m].parentElement.querySelector('small').innerHTML = `Please enter less than ${max} words"`;
            }
            if (input[m].value.length < max && input[m].value.length > 0) {
                input[m].parentElement.querySelector('small').innerHTML = "";
            }
        }
        return check;
    }
    function checkTextExpand(input, isTextExpand, max, listExpand) {
        for (let m = 0; m < input.length; m++) {
            if (listExpand[m].style.display == "" || listExpand[m].style.display == "block") {
                if (input[m].value.length > max) {
                    isTextExpand = false;
                    input[m].parentElement.parentElement.querySelector('small').innerHTML = `Please enter less than ${max} words"`;
                }
                if (input[m].value.length < max && input[m].value.length >= 0) {
                    input[m].parentElement.parentElement.querySelector('small').innerHTML = "";
                }
            }
        }
        return isTextExpand;
    }

}



function showError(input, message) {
    let parent = input.parentElement;
    let small = parent.querySelector('small');
    small.innerHTML = message;
}
function showSuccess(input) {
    let parent = input.parentElement;
    let small = parent.querySelector('small')
    small.innerHTML = '';
}

function checkLengthInput(listInput, max) {
    let isLength = true;
    listInput.forEach(input => {
        input.value = input.value.trim();
        if (input.value.length > max) {
            showError(input, `Please enter less than ${max} words`);
            isLength = false;
        }
        if (input.value.length > 0 && input.value.length < max) {
            showSuccess(input);
            isLength = true;
        }
    });
    return isLength;
}
function checkDateInput(listInput, txt) {
    let isEmpty = true;
    listInput.forEach(input => {
        input.value = input.value.trim();
        if (!input.value) {
            isEmpty = false;
            showError(input, txt);
        } else {
            showSuccess(input)
            isEmpty = true;
        }
    });
    return isEmpty;
}
function checkListInput(listInput) {
    let isEmpty = true;
    listInput.forEach(input => {
        input.value = input.value.trim();
        if (!input.value) {
            isEmpty = false;
            showError(input, "Please enter text");
        } else {
            showSuccess(input)
            isEmpty = true;
        }
    });
    return isEmpty;
}
function checkLengthLabel(listInput, max) {
    let isLengthLabel = true;
    listInput.forEach(input => {
        input.value = input.value.trim();
        if (input.value.length > max) {
            isLengthLabel = false;
            showErrorLabel(input, `Please enter less than ${max} words`);
        }
        if (input.value.length > 0 && input.value.length < max) {
            showSuccessLabel(input);
            isLengthLabel = true;
        }
        if (input.value.length < 0) {
            isLengthLabel = false;
        }
    });
    return isLengthLabel;
}
function checkListLabel(listInput) {
    let isEmptyLabel = true;
    listInput.forEach(input => {
        input.value = input.value.trim();
        if (!input.value) {
            isEmptyLabel = false;
            showErrorLabel(input, "Please enter Text");
        } else {
            showSuccessLabel(input)
            isEmptyLabel = true;
        }
    });
    return isEmptyLabel;
}

function showErrorLabel(input, message) {
    let parent = input.parentElement.parentElement;
    let small = parent.querySelector('small');
    small.innerHTML = message;
}
function showSuccessLabel(input) {
    let parent = input.parentElement.parentElement;
    let small = parent.querySelector('small')
    small.innerHTML = '';
}

function showErrorTypeQuestion(input, message) {
    let small = input.querySelector('.required-answer');
    small.innerHTML = message;
    small.style.marginLeft = "40%";
}
function showSuccessTypeQuestion(input) {
    input.innerHTML = '';
    input.style.margin = "0";
}

function checkCloseDate(inputOpen, inputClose) {
    isCheckDate = true;
    let dateOpen = new Date(inputOpen.value);
    let dateClose = new Date(inputClose.value);
    if (dateOpen >= dateClose) {
        isCheckDate = false;
        inputClose.parentElement.querySelector('small').innerHTML = "Must be greater than current time";
        inputClose.focus();
    } else {
        isCheckDate = true;
        inputClose.parentElement.querySelector('small').innerHTML = "";
    }
    return isCheckDate;

}

const myText = document.querySelector('.title-description');
myText.style.cssText = `height: ${myText.scrollHeight}px; overflow-y:hidden`;
myText.addEventListener("input", function () {
    this.style.height = "auto";
    this.style.height = `${this.scrollHeight}px`;
});