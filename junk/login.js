const signupBtn = document.querySelector('.signupbtn');
const loginBtn = document.querySelector('.loginbtn');
const nameField = document.querySelector('.namefield');
const title = document.querySelector('.title');
const text = document.querySelector('.text');
const LSBtn = document.querySelector('.lsbtn');

loginBtn.addEventListener('click',()=>{
    nameField.style.maxHeight = '0';
    title.innerHTML = 'Login';
    text.innerHTML = "Don't Have an Account?";
    signupBtn.classList.add('disable');
    LSBtn.innerHTML = 'Sign Up';
    LSBtn.setAttribute("href", "#Login");
    loginBtn.classList.remove('disable');
})

signupBtn.addEventListener('click',()=>{
    nameField.style.maxHeight = '60px';
    title.innerHTML = 'Sign UP';
    text.innerHTML = "Already Have an Account?";
    LSBtn.innerHTML = 'Login';
    LSBtn.setAttribute("href", "#Sign Up");
    signupBtn.classList.remove('disable');
    loginBtn.classList.add('disable');
})