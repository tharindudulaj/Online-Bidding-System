let hero = document.querySelector(".hero");

const images = [
    {
        img:"url(images/pra.jpg)",
    },
    {
        img:"url(images/thu.jpeg)",
    },
    {
        img:"url(images/sa.jpg)",
    },
]

let curr = 0;

function slider(){
    let item = images[curr];
    if(curr === 2){
        curr = 0;
    }
    else{
        curr++
    }
    hero.style.backgroundImage = item.img;
}

let slideInt;

slideInt = setInterval(slider, 3000);