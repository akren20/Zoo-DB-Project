function get(url){
    return fetch(url).then(res=>res.json());
}
function post(url,data){
    return fetch(url,{
        method:'POST',
        headers:{},
        body:JSON.stringify(data)
    }).then(res=>res.json());
}

