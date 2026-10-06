*** Settings ***
Resource         ../TestCases/Checkout.robot
Test Setup       Open Store
Test Teardown    Close All Browsers

*** Test Cases ***
CT: Login E Checkout Completo
    [Tags]    checkout
    Complete Checkout

CT: Usuario Bloqueado
    [Tags]    login
    Reject Locked User

CT: Nome Obrigatorio
    [Tags]    validacao
    Require Customer Name

CT: Remocao Do Produto
    [Tags]    carrinho
    Remove Backpack From Cart

CT: Retomar Checkout Apos Cancelar Dados
    [Tags]    checkout    carrinho
    Resume Checkout After Cancelling Customer Form
