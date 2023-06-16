/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const inputIcon = document.getElementById("input-icon")
        const inputPassword = document.getElementById("password")
        inputIcon.addEventListener('click', () => {
        inputIcon.classList.toggle('ri-eye-off-line')
                inputIcon.classList.toggle('ri-eye-line')
                inputPassword.type = inputPassword.type === 'password' ?
                'text' : 'password'

        })

