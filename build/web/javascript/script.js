/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function mostrarpassword(){
    const inputpassword = document.querySelector('#inputpassword');
    const password = document.querySelector('#password')
    if(inputpassword.checked){
        password.type = 'text';
    }else{
        password.type = 'password';
    }
}

async function teste(){
    
    $.ajax({
        url: "teste.jsp",
        type: "post",
        data: $('#nomepaciente').serialize(),
        dataType: "html",
        success: function(result){
            console.log(result);
        }
    });
}
    