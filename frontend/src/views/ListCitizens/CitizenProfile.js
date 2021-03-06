import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router';
import TextField from "@mui/material/TextField";
import {createTheme} from '@mui/material/styles';
import { ThemeProvider } from '@mui/material/styles';
import FormControl from '@mui/material/FormControl';
import FormControlLabel from '@mui/material/FormControlLabel';
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormLabel from '@mui/material/FormLabel';
import Select from '@mui/material/Select';
import InputLabel from '@mui/material/InputLabel';
import Button from "@mui/material/Button";
import { Ethnics } from "../../constants/citizen/citizens";
import { Religions } from "../../constants/citizen/citizens";
import { LearningLevels } from "../../constants/citizen/citizens";
import { Occupations } from "../../constants/citizen/citizens";
import MenuItem from '@mui/material/MenuItem';
import { DatePicker, MuiPickersUtilsProvider } from "@material-ui/pickers";
import DateFnsUtils from '@date-io/date-fns';
import {addToast} from "../../utils"
import { getCitizenById, updateCitizen, deleteCitizen } from "../../api/apiCitizens";
import { updateCitizenInTable, deleteCitizenInTable } from '../../redux/reducers/citizens/citizens.thunk'
import Loader from "../../core/Loader";
import { loadAgenciesAsync } from '../../redux/reducers/agencies/agencies.thunk';
import '../../style/citizen.css';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import Slide from '@mui/material/Slide';
import Autocomplete from '@mui/material/Autocomplete';

const CitizenProfile = (props) => {
  const {currentUser} = useSelector(state => state.user);
  let editable = (currentUser && (currentUser.level === "3" || currentUser.level === "4"))  ? true:false;
  const { agencies } = useSelector(state => {
    return state.agencies
  });
  useEffect(() => {
    if (agencies.length === 0) {
      dispatch(loadAgenciesAsync());
    }
}, []);
  const subAgencies = [];
  const citizenById = {
    id: "",
    id_number: "",
    name: "",
    dob: "",
    gender: "",
    ethnic: "",
    religion: "",
    educational: "",
    declarer: "",
    occupations: "",
    village_id: "",
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
  const {id} = props;
  const dispatch = useDispatch();
  const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />;
  });
  const [openDialog, setOpenDialog] = useState(false);
  const handleClickOpenDialog = () => {
    setOpenDialog(true);
  };
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };
  const [citizen, setData] = useState(citizenById);
  const [er, setError] = useState(error);
  const [inputAddress_line1, setInputAddress_line1] = React.useState('');
  const [inputAddress_line2, setInputAddress_line2] = React.useState('');

  useEffect(() => {
    (async () => {
      try {
        let res = await getCitizenById(id);
        if (res.status === 200) {
          setData(res.data);
          setInputAddress_line1(res.data.address_line1);
          setInputAddress_line2(res.data.address_line2);
        } else if (res.status === 404) {
          alert("Not found");
        }
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  const theme = createTheme({
      palette: {
          primary: {
              main: "#2E3192",
          },
      },
  });

  const styles = {
    title: {
      fontWeight: "bold",
      fontSize: "25px",
      paddingBottom: "1vh"
    },
  }

  const navigate = useNavigate();

  const handleChangeError = (name, value) => {
    setError({
      ...er,
      [name]: value
    });
  }
  
  const handleChangeValue = (e) => {
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
        village_id: e.target.value
      })
    } else {
      const name = (e.target.name || e.target.id);
      setData({
        ...citizen,
        [name]: e.target.value,
      });
    }
  };

  const handleUpdate = (e) => {
    e.preventDefault();
    if (citizen.name === "") {
      validateNameInput(e);
    }
    if (citizen.home_town === "") {
      validateHomeTownInput(e);
    }
    if (citizen.address_line1 === "") {
      validateAddress_line1Input(e);
    }
    if (citizen.address_line2 === "") {
      validateAddress_line2Input(e);
    }
    if (citizen.name !== "" && citizen.home_town !== "" && citizen.address_line1 !== "" && citizen.address_line2 !== "") {
      let temp = citizen;
      temp.address_line1 = inputAddress_line1;
      temp.address_line2 = inputAddress_line2;
      (async () => {
        try {
          let res = await updateCitizen(temp);
          if (res.status === 200) {
            dispatch(updateCitizenInTable(temp));
            addToast({type:'success', title:'Xong!', message:`C???p nh???t th??ng tin c??ng d??n th??nh c??ng.`, duration: 5000});
            navigate('/list-citizens');
          } else {
            addToast({type:'error', title:'H???ng!', message:`???? x???y ra l???i khi c???p nh???t th??ng tin c??ng d??n.`, duration: 5000})
          }
        } catch (e) {
          if (e.response && e.response.data && e.response.data.id_number) {
            if(e.response.data.id_number === "citizen width this id_number has exist") {
              setError({
                ...error,
                id_number: "S??? CMND/CCCD ???? t???n t???i!",
              });
            }
          }
        }
      })();
    }
  }

  const handleDelete = () => {
    (async () => {
      try {
        let res = await deleteCitizen(citizen.id);
        if (res.status === 200 || res.status === 204) {
          dispatch(deleteCitizenInTable(citizen.id));
          addToast({type:'success', title:'Xong!', message:`X??a th??ng tin c??ng d??n th??nh c??ng.`, duration: 5000});
          navigate('/list-citizens');
        } else {
          addToast({type:'error', title:'H???ng!', message:`???? x???y ra l???i khi c???p nh???t th??ng tin c??ng d??n.`, duration: 5000})
        }
      } catch (error) {}
    })();
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
  const allIsNumber = (word) => {
    for (var x = 0; x < word.length; x++) {
      if (!/\d/.test(word[x])) {
        return false;
      }
    }
    return true;
  }

  const validateNameInput = (event) => {
    const content = event.target.value;
    const words = content.split(/\s/);
    if (content === "") {
      handleChangeError("name", "Kh??ng ???????c ????? tr???ng!");
    } else if (content[0] === " ") {
      handleChangeError("name", "Kh??ng ???????c b???t ?????u b???ng kho???ng tr???ng!");
    } else if (content[content.length - 1] === " ") {
      handleChangeError("name", "Kh??ng ???????c k???t th??c b???ng kho???ng tr???ng!");
    } else if (/\d/.test(content)) {
      handleChangeError("name", "Kh??ng ???????c ch???a ch??? s???!");
    } else if (containLowerCase(content[0]) || containLowerCase(words[words.length - 1][0])) {
      handleChangeError("name", "Vi???t hoa k?? t??? ?????u ti??n c???a m???i t???!");
    } else if ((content.length > 1 && containUpperCase(content.substr(1)) && words.length < 2) || (words[words.length - 1].length > 1 && containUpperCase(words[words.length - 1].substr(1)))) {
      handleChangeError("name", "Ch??? vi???t hoa ch??? c??i ?????u ti??n c???a t???!");
    } else if (containSpecialCharacter(content)) {
      handleChangeError("name", "Kh??ng ???????c ch???a k?? t??? ?????c bi???t!");
    } else if (content.split(/\s/).length - 1 < 1) {
      handleChangeError("name", "??t nh???t 2 t??? ????n!");
    } else {
      handleChangeError("name", "");
    }
  }

  const validateId_numberInput = (event) => {
    const content = event.target.value;
    if (allIsNumber(content) === false) {
      handleChangeError("id_number", "Ch??? ???????c ch???a ch??? s???!");
    } else if (0 < content.length && content.length < 9) {
      handleChangeError("id_number", "S??? CMND/CCCD ph???i ????? 9/12 ch??? s??? ho???c ????? tr???ng khi ch??a ???????c c???p!");
    } else if (9 < content.length && content.length < 12) {
      handleChangeError("id_number", "S??? CCCD ph???i ????? 12 ch??? s???!");
    } else if (content.length > 12) {
      handleChangeError("id_number", "Kh??ng h???p l???!");
    } else {
      handleChangeError("id_number", "");
    }
  }

  const validateHomeTownInput = (event) => {
    const content = event.target.value;
    if (content.length === 0) {
      handleChangeError("home_town", "Kh??ng ???????c ????? tr???ng!")
    } else {
      handleChangeError("home_town", "")
    }
  };

  const validateAddress_line1Input = (event) => {
    const content = event.target.value;
    if (content.length === 0) {
      handleChangeError("address_line1", "Kh??ng ???????c ????? tr???ng!")
    } else {
      handleChangeError("address_line1", "")
    }
  };

  const validateAddress_line2Input = (event) => {
    const content = event.target.value;
    if (content.length === 0) {
      handleChangeError("address_line2", "Kh??ng ???????c ????? tr???ng!")
    } else {
      handleChangeError("address_line2", "")
    }
  };

  const updateAgencyList = () => {
    for(var i = 0; i < agencies.length; i++) {
      subAgencies.push(agencies[i].name);
    }
  }

  if (citizen.id === "") {
    return <Loader/>
  }
  return (
        <div id="profile">
        <ThemeProvider theme={theme}>
          <p style={styles.title}>Th??ng tin chi ti???t</p>
          <form>
              <TextField
                error= {er.name !== ""}
                helperText = {er.name !== ""? er.name:""}
                value={citizen.name}
                id="name" 
                margin="dense"
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
                InputProps={{
                  readOnly: !editable,
                }}
              />
              <div style={{display: "flex", justifyContent: "space-between", width: "100%", marginTop: "1.5vh"}}>
              <FormControl style={{width: "30%"}} component="fieldset">
                <FormLabel component="legend" style={{fontSize: "13px"}}>Gi???i t??nh *</FormLabel>
                <RadioGroup row aria-label="gender" id="gender" value={citizen.gender} onChange={handleChangeValue}>
                  <FormControlLabel value="male" control={<Radio />} label="Nam" disabled={!editable} />
                  <FormControlLabel value="female" control={<Radio />} label="N???" disabled={!editable} />
                </RadioGroup>
              </FormControl>
              <MuiPickersUtilsProvider utils={DateFnsUtils}>
              <DatePicker
                id="dob" 
                style={{width: "30%"}}
                disableFuture
                value={citizen.dob}
                autoOk
                openTo="year"
                format="dd/MM/yyyy"
                label="Ng??y sinh"
                views={["year", "month", "date"]}
                onChange={handleChangeValue}
                readOnly={!editable}
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
                InputProps={{
                  readOnly: !editable,
                }}
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
                  inputProps={{ readOnly: !editable }}
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
                  value={citizen.religion === ""?"Kh??ng":citizen.religion}
                  label="T??n gi??o"
                  onChange={handleChangeValue}
                  inputProps={{ readOnly: !editable }}
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
                  inputProps={{ readOnly: !editable }}
                >
                {
                  LearningLevels.map((item, index) => <MenuItem key={index} value={item.value}>{item.name}</MenuItem>)
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
                  inputProps={{ readOnly: !editable }}
                >
                {
                  Occupations.map((item, index) => <MenuItem key={index} value={item}>{item}</MenuItem>)
                }
                </Select>
              </FormControl>
              {currentUser.level === "3"? (
          <FormControl variant="standard" sx={{ m: 1 }} style={{width: "47%"}}>
          <InputLabel >Th??n/B???n/T??? *</InputLabel>
          <Select
            name="village_id"
            value={citizen.village_id}
            label="Th??n/B???n/T???"
            onChange={handleChangeValue}
            inputProps={{ 
              readOnly: !editable,
              disabled: currentUser.level === "4"
            }}
          >
            {updateAgencyList()}
          {
            agencies.map((item, index) => <MenuItem key={index} value={item.id}>{item.name}</MenuItem>)
          }
          </Select>
        </FormControl>
        ):null
        }
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
                InputProps={{
                  readOnly: !editable,
                }}
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
                  label="?????a ch??? t???m tr??"
                  InputProps={{
                    readOnly: !editable,
                  }}
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
                  InputProps={{
                    readOnly: !editable,
                  }}
                  required 
                  />}
              />
              {/* <TextField
                error= {er.address_line1 !== ""}
                helperText = {er.address_line1 ? er.address_line1:""}
                style={{ marginTop: "3vh" }}
                value={citizen.address_line1}
                id="address_line1"
                label="?????a ch??? th?????ng tr??"
                fullWidth
                variant="standard"
                onChange={handleChangeValue}
                onBlur={validateAddress_line1Input}
                inputProps={{
                  style: {
                    fontSize: "18px",
                  }
                }}
                InputProps={{
                  readOnly: !editable,
                }}
              />
              <TextField
                error= {er.address_line2 !== ""}
                helperText = {er.address_line2 ? er.address_line2:""}
                style={{ marginTop: "3vh" }}
                id="address_line2"
                value={citizen.address_line2}
                label="?????a ch??? t???m tr??"
                fullWidth
                variant="standard"
                onChange={handleChangeValue}
                onBlur={validateAddress_line2Input}
                inputProps={{
                  style: {
                    fontSize: "18px",
                  }
                }}
                InputProps={{
                  readOnly: !editable,
                }}
              /> */}
              {
                editable ? (
                  <div>
                  <div style={{display: "flex", justifyContent: "flex-end", marginTop: "3vh"}}>
                    <Button style={{marginRight: "10px", background: "lightgrey"}} onClick={handleClickOpenDialog}>X??a</Button>
                    <Button style={{background: "#2E3192", color: "white"}} onClick={handleUpdate}>C???p nh???t</Button>
                  </div>
                  </div>
                ) : null
              }
          </form>
          {
            openDialog? (
          <Dialog
        open={true}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleCloseDialog}
        aria-describedby="alert-delete-citizen"
      >
        <DialogTitle>B???n mu???n x??a h??? s?? n??y?</DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-delete-citizen">
            H??nh ?????ng n??y kh??ng th??? ho??n t??c. Ti???p t???c?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleCloseDialog}>H???y</Button>
          <Button onClick={() => handleDelete()}>X??a</Button>
        </DialogActions>
      </Dialog>
            ):null
      }
        </ThemeProvider>
    </div>
    );
}

export default CitizenProfile;