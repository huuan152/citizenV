import apiClient from "../axios/api";
import apiAuthedClient from "../axios/apiAuthed";
import axiosClient from "../axios/myapi"

export const apiLoginUser = ({username, password}) => {
    return apiClient().post("/api/user/login/", {username, password})
}

export const apiPersistUser = () => {
    return apiAuthedClient().get("/api/user/my");
}
export const isAuthenticated = () => {

    if (typeof window === "undefined"){
        return false;
    }
    // try{
    //     const user = await apiPersistUser();
    //     console.log(user);
    //     return true;
    // }
    // catch(error){
    //     console.log(error)
    //     return false;
    // }
    if(localStorage.getItem("token")){
        return localStorage.getItem("token");
    }
    else{
        return false;
    }
}

export const myUser = () => {
    return axiosClient.get("user/my/")
}

export const loginApi = (data) => {
    return axiosClient.post("user/login/", data)
}
