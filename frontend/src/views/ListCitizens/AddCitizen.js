import React, { useEffect, useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import {createTheme} from '@mui/material/styles';
import { ThemeProvider } from '@mui/material/styles';
import { DatePicker, MuiPickersUtilsProvider } from "@material-ui/pickers";
import DateFnsUtils from '@date-io/date-fns';
import FormControlLabel from '@mui/material/FormControlLabel';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormLabel from '@mui/material/FormLabel';
import { useNavigate } from 'react-router';
import { Ethnics } from "../../constants/citizen/citizens";
import { Religions } from "../../constants/citizen/citizens";
import { LearningLevels } from "../../constants/citizen/citizens";
import { Occupations } from "../../constants/citizen/citizens";
import { addCitizen } from "../../api/apiCitizens";
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import { appendCitizen } from '../../redux/reducers/citizens/citizens.thunk';
import {addToast} from "../../utils"
import { loadAgenciesAsync } from '../../redux/reducers/agencies/agencies.thunk';
import Autocomplete from '@mui/material/Autocomplete';

let clicked = false

const AddCitizen = () => {
  const {currentUser} = useSelector(state => state.user);
  const village_id = currentUser.agency.id;
  const { agencies } = useSelector(state => {
    return state.agencies
  });
  var subAgencies = [];
  for(var i = 0; i < agencies.length; i++) {
    subAgencies.push(agencies[i].name);
  }
  const [declarePermission, setDeclarePermission] = useState(currentUser.actually_declared_permission);
  useEffect(() => {
    if (agencies.length === 0) {
      dispatch(loadAgenciesAsync());
    }
  }, []);

  useEffect(() => {
    console.log(declarePermission)
    if (currentUser.actually_declared_permission !== declarePermission) {
      setDeclarePermission(!declarePermission);
    }
    console.log(declarePermission)
  }, [currentUser, declarePermission]);

  const theme = createTheme({
        palette: {
            primary: {
                main: "#2E3192",
            },
        },
  });
  const allIsNumber = (word) => {
    for (var x = 0; x < word.length; x++) {
      if (!/\d/.test(word[x])) {
        return false;
      }
    }
    return true;
  }

  const mapSubAgenciesId = (agency) => {
    if (typeof agency !== 'undefined') {
      if (currentUser.level === "4") {
        if (allIsNumber(agency)) {
          return currentUser.agency.name
        } else {
          return village_id;
        }
      } else if (allIsNumber(agency)) {
        for (var i = 0; i < agencies.length; i++) {
          if (agencies[i].id === agency) {
            return agencies[i].name;
          }
        }
      } else {
        for (var j = 0; j < agencies.length; j++) {
          if (agencies[j].name === agency) {
            return agencies[j].id;
          }
        }
      }
    }
  }
  const citizenById = {
    id: "",
    id_number: "",
    name: "",
    dob: new Date().toLocaleDateString('en-CA'),
    gender: "male",
    ethnic: "Kinh",
    religion: "Kh??ng",
    educational: "none",
    declarer: "",
    occupations: "T??? do",
    village_id: mapSubAgenciesId(subAgencies[0]),
    home_town: "",
    address_line1: "",
    address_line2: "",
  };
  const error = {
    id_number: "",
    name: "",
    home_town: "",
    address_line1: "",
    address_line2: "",
  }

  const [citizen, setData] = useState(citizenById);
  const [er, setError] = useState(error);
  const [inputAddress_line1, setInputAddress_line1] = React.useState('');
  const [inputAddress_line2, setInputAddress_line2] = React.useState('');

  const styles = {
        root: {
            width: "45vw",
            background: "white",
            borderRadius: "10px",
            padding: "40px"
        },
        title: {
            fontWeight: "bold",
            fontSize: "25px",
        },
        marginRight: {
          marginRight: "1vw"
        }
  }

  const formatEducational = (learningLevel) => {
    if (learningLevel === "Kh??ng") {
      return "none";
    } else if (learningLevel === "Ti???u h???c") {
      return "primary";
    } else if (learningLevel === "Trung h???c c?? s???") {
      return "secondary";
    } else if (learningLevel === "Trung h???c ph??? th??ng") {
      return "high";
    } else if (learningLevel === "Cao ?????ng / ?????i h???c") {
      return "university";
    } else if (learningLevel === "Sau ?????i h???c") {
      return "master";
    } else if (learningLevel === "none") {
      return "Kh??ng";
    } else if (learningLevel === "secondary") {
      return "Trung h???c c?? s???";
    } else if (learningLevel === "high") {
      return "Trung h???c ph??? th??ng";
    } else if (learningLevel === "university") {
      return "Cao ?????ng / ?????i h???c";
    } else if (learningLevel === "master") {
      return "Sau ?????i h???c";
    } 
  }

  const dispatch = useDispatch()
  
  const handleChangeValue = (e) => {
    // village_id 
    if (!isNaN(Date.parse(e))) {
      setData({
        ...citizen,
        dob: new Date(e).toLocaleDateString('en-CA')
      });
    } else if (e.target.name === "educational") {
      setData({
        ...citizen,
        educational: e.target.value
      });
    } else if (e.target.value === "male" || e.target.value === "female") {
      setData({
        ...citizen,
        gender: e.target.value
      })
    } else if (e.target.name === "village_id") {
      setData({
        ...citizen,
        village_id: mapSubAgenciesId(e.target.value)
      })
    } else {
      const name = (e.target.name || e.target.id);
      setData({
        ...citizen,
        [name]: e.target.value,
      });
    }
  };

  
  const handleSubmit = (event) => {
    if (clicked) {
      console.log("return")
      return 
    }
    clicked = true
    let err = validateBeforeSubmit();
    if (err.name === "" && err.id_number === "" && err.home_town === "" && err.address_line1 === "" && err.address_line2 === "") {
      let temp = citizen;
      temp.address_line1 = inputAddress_line1;
      temp.address_line2 = inputAddress_line2;
      (async () => {
        try {
          let res = await addCitizen(temp);
          if (res.status === 200) {
            dispatch(appendCitizen(res.data));
            addToast({type:'success', title:'Xong!', message:`Khai b??o c??ng d??n th??nh c??ng.`, duration: 5000});
            handleResetInput();
          } else {
            addToast({type:'error', title:'H???ng!', message:`???? x???y ra l???i khi th??m c??ng d??n.`, duration: 5000})
          }
          clicked = false
        } catch (e) {
          clicked = false
          if (e.response && e.response.data && e.response.data.id_number) {
            if(e.response.data.id_number[0] === "{'citizen width this id_number has exist'}") {
              setError({
                ...error,
                id_number: "S??? CMND/CCCD ???? t???n t???i!",
              });
            }
          }
        }
      })();
    } else {
      clicked = false
      setError(err);
    }
  }
    
  const containUpperCase = (word) => {
    if (/[???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????A-Z]/.test(word)) {
      return true;
    } else {
      return false;
    }
  }
  const containLowerCase = (word) => {
    if (/[a??????????????????????????????????????????????bcd??e??????????????????????????????fghi????????????jklmno??????????????????????????????????????????????pqrstu?????????????????????????????vwxy??????????????z]/.test(word)) {
      return true;
    } else {
      return false;
    }
  }
  const containSpecialCharacter = (word) => {
    // except for white-space
    for (var x = 0; x < word.length; x++) {
      if (!containLowerCase(word[x]) && !containUpperCase(word[x]) && !/\d/.test(word[x]) && !/\s/.test(word[x])) {
        return true;
      }
    }
    return false;
  }

  const validateNameInput = () => {
    const content = citizen.name;
    const words = content.split(/\s/);
    if (content === '') {
      setError({
        ...er,
        name: "Kh??ng ???????c ????? tr???ng!"
      })
      return "Kh??ng ???????c ????? tr???ng!";
    } else if (content[0] === " ") {
      setError({
        ...er,
        name: "Kh??ng ???????c b???t ?????u b???ng kho???ng tr???ng!"
      })
      return "Kh??ng ???????c b???t ?????u b???ng kho???ng tr???ng!";
    } else if (content[content.length - 1] === " ") {
      setError({
        ...er,
        name: "Kh??ng ???????c k???t th??c b???ng kho???ng tr???ng!"
      })
      return "Kh??ng ???????c k???t th??c b???ng kho???ng tr???ng!";
    } else if (/\d/.test(content)) {
      setError({
        ...er,
        name: "Kh??ng ???????c ch???a ch??? s???!"
      })
      return "Kh??ng ???????c ch???a ch??? s???!";
    } else if (containLowerCase(content[0]) || containLowerCase(words[words.length - 1][0])) {
      setError({
        ...er,
        name: "Vi???t hoa k?? t??? ?????u ti??n c???a m???i t???!"
      })
      return "Vi???t hoa k?? t??? ?????u ti??n c???a m???i t???!";
    } else if ((content.length > 1 && containUpperCase(content.substr(1)) && words.length < 2) || (words[words.length - 1].length > 1 && containUpperCase(words[words.length - 1].substr(1)))) {
      setError({
        ...er,
        name: "Ch??? vi???t hoa ch??? c??i ?????u ti??n c???a t???!"
      })
      return "Ch??? vi???t hoa ch??? c??i ?????u ti??n c???a t???!";
    } else if (containSpecialCharacter(content)) {
      setError({
        ...er,
        name: "Kh??ng ???????c ch???a k?? t??? ?????c bi???t!"
      })
      return "Kh??ng ???????c ch???a k?? t??? ?????c bi???t!";
    } else if (content.split(/\s/).length - 1 < 1) {
      setError({
        ...er,
        name: "??t nh???t 2 t??? ????n!"
      })
      return "??t nh???t 2 t??? ????n!";
    } else {
      setError({
        ...er,
        name: ""
      })
      return "";
    }
  }

  const validateId_numberInput = () => {
    const content = citizen.id_number;
    if (allIsNumber(content) === false) {
      setError({
        ...er,
        id_number: "Ch??? ???????c ch???a ch??? s???!"
      })
      return "Ch??? ???????c ch???a ch??? s???!";
    } else if (0 < content.length && content.length < 9) {
      setError({
        ...er,
        id_number: "S??? CMND/CCCD ph???i ????? 9/12 ch??? s??? ho???c ????? tr???ng khi ch??a ???????c c???p!"
      })
      return "S??? CMND/CCCD ph???i ????? 9/12 ch??? s??? ho???c ????? tr???ng khi ch??a ???????c c???p!";
    } else if (9 < content.length && content.length < 12) {
      setError({
        ...er,
        id_number: "S??? CCCD ph???i ????? 12 ch??? s???!"
      })
      return "S??? CCCD ph???i ????? 12 ch??? s???!";
    } else if (content.length > 12) {
      setError({
        ...er,
        id_number: "Kh??ng h???p l???!"
      })
      return "Kh??ng h???p l???!";
    } else {
      setError({
        ...er,
        id_number: ""
      })
      return ""
    }
  }

  const validateHomeTownInput = () => {
    const content = citizen.home_town;
    if (content === '') {
      setError({
        ...er,
        home_town: "Kh??ng ???????c ????? tr???ng!"
      })
      return "Kh??ng ???????c ????? tr???ng!";
    } else {
      setError({
        ...er,
        home_town: ""
      })
      return "";
    }
  };

  const validateAddress_line1Input = () => {
    const content = inputAddress_line1;
    if (content === '') {
      setError({
        ...er,
        address_line1: "Kh??ng ???????c ????? tr???ng!"
      })
      return "Kh??ng ???????c ????? tr???ng!";
    } else {
      setError({
        ...er,
        address_line1: ""
      })
      return "";
    }
  };

  const validateAddress_line2Input = () => {
    const content = inputAddress_line2;
    if (content === '') {
      setError({
        ...er,
        address_line2: "Kh??ng ???????c ????? tr???ng!"
      })
      return "Kh??ng ???????c ????? tr???ng!";
    } else {
      setError({
        ...er,
        address_line2: ""
      })
      return "";
    }
  };

  const validateBeforeSubmit = () => {
    let err = {}
    err.name = validateNameInput();
    err.id_number = validateId_numberInput();
    err.home_town = validateHomeTownInput();
    err.address_line1 = validateAddress_line1Input();
    err.address_line2 = validateAddress_line2Input();
    return err;
  }

  if (village_id.length === 8) {
    subAgencies.push(mapSubAgenciesId(village_id));
  }

  const handleResetInput = (event) => {
    setInputAddress_line1("");
    setInputAddress_line2("");
    setData(citizenById);
    setError(error);
  }

  const [open, setOpen] = React.useState(false)
  const handleClickOpen = () => {
    handleResetInput();
    setData({
      ...citizen,
      village_id: mapSubAgenciesId(subAgencies[0])
    })
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    handleResetInput();
  };

  if (!declarePermission) {
    return null
  }
    return (
      <div>
        <Button variant="contained" onClick={handleClickOpen}>
          Khai b??o c??ng d??n m???i 
        </Button>
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle style={styles.title}>Khai b??o c??ng d??n</DialogTitle>
        <DialogContent>
        <ThemeProvider theme={theme}>
          <form>
              <TextField   
                error= {er.name !== ""}
                helperText = {er.name !== ""? er.name:""}
                value={citizen.name}
                id="name" 
                margin="dense"
                name="name" 
                label="H??? v?? t??n"
                variant="standard"
                onChange={handleChangeValue}
                onBlur={validateNameInput}
                style={{width: "100%"}}
                inputProps={{
                  style: {
                    fontSize: "17px",
                  }
                }}
                required
              />
              <div style={{display: "flex", justifyContent: "space-between", width: "100%", marginTop: "1.5vh"}}>
              <FormControl component="fieldset" style={{width: "30%"}}>
                <FormLabel component="legend" style={{fontSize: "13px"}}>Gi???i t??nh *</FormLabel>
                <RadioGroup row aria-label="gender" id="gender" value={citizen.gender} onChange={handleChangeValue}>
                  <FormControlLabel value="male" control={<Radio />} label="Nam" style={{marginRight: "10px"}} />
                  <FormControlLabel value="female" control={<Radio />} label="N???" style={{marginRight: 0}} />
                </RadioGroup>
              </FormControl>
              <MuiPickersUtilsProvider utils={DateFnsUtils}>
              <DatePicker
                id="dob" 
                style={{width: "30%"}}
                disableFuture
                autoOk
                openTo="year"
                format="dd/MM/yyyy"
                label="Ng??y sinh *"
                views={["year", "month", "date"]}
                value={citizen.dob}
                onChange={handleChangeValue}
              />
              </MuiPickersUtilsProvider>
              <TextField
                error= {er.id_number !== ""}
                helperText = {er.id_number ? er.id_number:""}
                value={citizen.id_number}
                style={{width: "30%"}}
                id="id_number" 
                label="S??? CCCD/CMND"
                variant="standard"
                onChange={handleChangeValue}
                onBlur={validateId_numberInput}
                required
              />
              </div>
              <div style={{display: "flex", justifyContent: "space-between", width: "100%", marginTop: "1.5vh"}}>
                <FormControl variant="standard" sx={{ m: 1 }} style={{width: "30%"}}>
                  <InputLabel >D??n t???c *</InputLabel>
                  <Select
                  name="ethnic"
                  value={citizen.ethnic}
                  label="D??n t???c"
                  onChange={handleChangeValue}
                  >
                  {
                    Ethnics.map((item, index) => <MenuItem key={index} value={item}>{item}</MenuItem>)
                  }
                </Select>
                </FormControl>
                <FormControl variant="standard" sx={{ m: 1}} style={{width: "30%"}}>
                <InputLabel >T??n gi??o *</InputLabel>
                <Select
                  name="religion"
                  value={citizen.religion}
                  label="T??n gi??o"
                  onChange={handleChangeValue}
                >
                {
                  Religions.map((item, index) => <MenuItem key={index} value={item}>{item}</MenuItem>)
                }
                </Select>
                </FormControl>
              <FormControl variant="standard" sx={{ m: 1 }} style={{width: "30%"}}>
                <InputLabel >Tr??nh ????? h???c v???n *</InputLabel>
                <Select
                  name="educational"
                  value={citizen.educational}
                  label="Tr??nh ????? h???c v???n"
                  onChange={handleChangeValue}
                >
                {
                  LearningLevels.map((item, index) => <MenuItem key={item.value} value={item.value}>{item.name}</MenuItem>)
                }
                </Select>
              </FormControl>
              </div>
              <div style={{display: "flex", justifyContent: "space-between", width: "100%", marginTop: "3vh"}}>
              <FormControl variant="standard" sx={{ m: 1 }} style={{width: "47%"}}>
                <InputLabel >Ngh??? nghi???p *</InputLabel>
                <Select
                  name="occupations"
                  value={citizen.occupations}
                  label="Ngh??? nghi???p"
                  onChange={handleChangeValue}
                >
                {
                  Occupations.map((item, index) => <MenuItem key={index} value={item}>{item}</MenuItem>)
                }
                </Select>
              </FormControl>
              <FormControl variant="standard" sx={{ m: 1 }} style={{width: "47%"}}>
                <InputLabel >Th??n/B???n/T??? *</InputLabel>
                <Select
                  name="village_id"
                  value={mapSubAgenciesId(citizen.village_id)}
                  label="Th??n/B???n/T???"
                  onChange={handleChangeValue}
                  inputProps={{ 
                    disabled: currentUser.level === "4"
                  }}
                >
                {
                    subAgencies.map((item, index) => <MenuItem key={index} value={item}>{item}</MenuItem>)
                }
                </Select>
              </FormControl>
              </div>
              <TextField
                error= {er.home_town !== ""}
                helperText = {er.home_town ? er.home_town:""}
                style={{ marginTop: "3vh" }}
                id="home_town"
                value={citizen.home_town}
                onChange={handleChangeValue}
                onBlur={validateHomeTownInput}
                label="Qu?? qu??n"
                inputProps={{
                  style: {
                    fontSize: "17px",
                  }
                }}
                fullWidth
                variant="standard"
                required
              />
              <Autocomplete
                id="free-solo-demo1"
                sx={{
                  '& input': {
                    height: 22,
                    fontSize: "17px",
                  },
                }}
                freeSolo
                options={currentUser.agency.stringName? [currentUser.agency.stringName]:[]}
                inputValue={inputAddress_line1}
                onInputChange={(event, newInputValue) => {
                  setInputAddress_line1(newInputValue);
                }}
                renderInput={(params) => 
                <TextField 
                  error= {er.address_line1 !== ""}
                  helperText = {er.address_line1 ? er.address_line1:""}
                  id="address_line1"
                  style={{ marginTop: "3vh" }} 
                  fullWidth
                  onBlur={validateAddress_line1Input}
                  variant="standard" {...params} 
                  label="?????a ch??? th?????ng tr??"
                  required 
                  />}
              />
              <Autocomplete
                id="free-solo-demo2"
                sx={{
                  '& input': {
                    height: 22,
                    fontSize: "17px",
                  },
                }}
                freeSolo
                options={currentUser.agency.stringName? [currentUser.agency.stringName]:[]}
                inputValue={inputAddress_line2}
                onInputChange={(event, newInputValue) => {
                  setInputAddress_line2(newInputValue);
                  console.log(newInputValue);
                }}
                renderInput={(params) => 
                <TextField 
                  error= {er.address_line2 !== ""}
                  helperText = {er.address_line2 ? er.address_line2:""}
                  id="address_line2"
                  style={{ marginTop: "3vh" }} 
                  fullWidth
                  onBlur={validateAddress_line2Input}
                  variant="standard" {...params} 
                  label="?????a ch??? t???m tr??"
                  required 
                  />}
              />
          </form>
        </ThemeProvider>
        </DialogContent>
        <DialogActions>
          <Button style={{background: "lightgrey", color: "black"}} onClick={handleResetInput}>Reset</Button>
          <Button style={{background: "#2E3192", color: "white", marginLeft: "10px"}} type="submit" onClick={handleSubmit}>Th??m</Button>
        </DialogActions>
      </Dialog>
      </div>
    );
}

export default AddCitizen;