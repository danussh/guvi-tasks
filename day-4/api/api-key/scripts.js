var url_string = 'https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=efee1852143e1b2ca5dc44cd6c511957';


fetch(url_string)
.then(res=>res.json())
.then(data=>console.log(data))