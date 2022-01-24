function Greetings(occasion){

    switch(occasion){
        case "New Year":
            console.log("Happy New Year!!!");
            break;
        case "Birthday":
            console.log("Happy Birthday to You!");
            break;
        case "Cristmus":
            console.log("Happy Merry Cristmus");
            break;
        case "Anniversary":
            console.log("Happy Anniversary");
            break;
        default:
                console.log("always be happy");
    }
}
module.exports=Greetings;





