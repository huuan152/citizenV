import React, { useEffect, useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import Button from "@mui/material/Button";
import { Ethnics } from "../../constants/citizen/citizens";
import { Religions } from "../../constants/citizen/citizens";
import { LearningLevels } from "../../constants/citizen/citizens";
import { Occupations } from "../../constants/citizen/citizens";
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import { appendCitizen } from '../../redux/reducers/citizens/citizens.thunk';
import {addToast} from "../../utils"
import { loadAgenciesAsync } from '../../redux/reducers/agencies/agencies.thunk';
import { styled } from '@mui/material/styles';
import Papa from "papaparse";
import { citizen_columns_full, educational } from '../../constants/citizen/citizens';
import TableExtra from '../../components/Table/TableExtra';
import { TableRow, TableCell } from '@mui/material';
import { addMultiCitizens } from "../../api/apiCitizens";

let clicked = false;

const AddCitizenByCSV = () => {
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
    if (currentUser.actually_declared_permission !== declarePermission) {
      setDeclarePermission(!declarePermission);
    }
  }, [currentUser, declarePermission]);

  const Input = styled('input')({
    display: 'none',
  });
  const allIsNumber = (word) => {
    for (var x = 0; x < word.length; x++) {
      if (!/\d/.test(word[x])) {
        return false;
      }
    }
    return true;
  }

  const mapSubAgenciesNameToID = (agencyName) => {
    if (currentUser.level === "4") {
      return village_id;
    } else {
      for (var j = 0; j < agencies.length; j++) {
        if (agencies[j].name === agencyName) {
          return agencies[j].id;
        }
      }
    }
  }

  const mapSubAgenciesIDToName = (agencyID) => {
    if (currentUser.level === "4") {
      return currentUser.agency.name;
    } else {
      for (var i = 0; i < agencies.length; i++) {
        if (agencies[i].id === agencyID) {
          return agencies[i].name;
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
    ethnic: "Kinh (Vi???t)",
    religion: "Kh??ng",
    educational: "university",
    declarer: "",
    occupations: "Nh?? chuy??n m??n b???c cao (?????i h???c tr??? l??n)",
    village_id: mapSubAgenciesNameToID(subAgencies[0]),
    home_town: "",
    address_line1: "",
    address_line2: "",
  };

  const [er, setError] = useState([]);
  const [open, setOpen] = React.useState(false)
  const [isError, setErrorState] = React.useState([]);

  const [citizenCSVData, setDataCSV] = useState([]);

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
        },
  }

  /* const formatEducational = (learningLevel) => {
    if (learningLevel === "Ti???u h???c") {
      return "primary";
    } else if (learningLevel === "Trung h???c c?? s???") {
      return "secondary";
    } else if (learningLevel === "Trung h???c ph??? th??ng") {
      return "high";
    } else if (learningLevel === "Cao ?????ng / ?????i h???c") {
      return "university";
    } else if (learningLevel === "Sau ?????i h???c") {
      return "master";
    } else if (learningLevel === "primary") {
      return "Ti???u h???c";
    } else if (learningLevel === "secondary") {
      return "Trung h???c c?? s???";
    } else if (learningLevel === "high") {
      return "Trung h???c ph??? th??ng";
    } else if (learningLevel === "university") {
      return "Cao ?????ng / ?????i h???c";
    } else if (learningLevel === "master") {
      return "Sau ?????i h???c";
    } 
  } */

  const dispatch = useDispatch()
    
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

  const validateNameInput = (input) => {
    const content = input;
    const words = content.split(/\s/);
    if (content === '') {
      return "Kh??ng ???????c ????? tr???ng!";
    } else if (content[0] === " ") {
      return "Kh??ng ???????c b???t ?????u b???ng kho???ng tr???ng!";
    } else if (content[content.length - 1] === " ") {
      return "Kh??ng ???????c k???t th??c b???ng kho???ng tr???ng!";
    } else if (/\d/.test(content)) {
      return "Kh??ng ???????c ch???a ch??? s???!";
    } else if (containLowerCase(content[0]) || containLowerCase(words[words.length - 1][0])) {
      return "Vi???t hoa k?? t??? ?????u ti??n c???a m???i t???!";
    } else if ((content.length > 1 && containUpperCase(content.substr(1)) && words.length < 2) || (words[words.length - 1].length > 1 && containUpperCase(words[words.length - 1].substr(1)))) {
      return "Ch??? vi???t hoa ch??? c??i ?????u ti??n c???a t???!";
    } else if (containSpecialCharacter(content)) {
      return "Kh??ng ???????c ch???a k?? t??? ?????c bi???t!";
    } else if (content.split(/\s/).length - 1 < 1) {
      return "??t nh???t 2 t??? ????n!";
    } else {
      return "";
    }
  }

  const validateId_numberInput = (input) => {
    const content = input;
    if (allIsNumber(content) === false) {
      return "Ch??? ???????c ch???a ch??? s???!"
    } else if (0 < content.length && content.length < 9) {
      return "S??? CMND/CCCD ph???i ????? 9/12 ch??? s??? ho???c ????? tr???ng khi ch??a ???????c c???p!";
    } else if (9 < content.length && content.length < 12) {
      return "S??? CCCD ph???i ????? 12 ch??? s???!";
    } else if (content.length > 12) {
      return "Kh??ng h???p l???!";
    } else {
      return ""
    }
  }

  const validateDuplicatedId_numberInput = (errors) => {
    // Ch??a c???p nh???t l?? do l???i ??? state er m?? ch??? c???p nh???t c?? ????ng hay sai ??? state isError
    var updateErrorState = errors;
    for (var i = 0; i < citizenCSVData.length - 1; i++) {
      var current_id_number = citizenCSVData[i].id_number;
      var isDup = false;
      if (current_id_number !== "") {
        if (updateErrorState[i] === false) {
          for (var j = i + 1; j < citizenCSVData.length; j++) {
            if (current_id_number === citizenCSVData[j].id_number) {
              updateErrorState[j] = true;
              isDup = true;
            }
          }
          updateErrorState[i] = isDup;
        }
      }
      if (isDup) {
        addToast({type:'error', title:'H???ng!', message:`S??? CMND/CCCD ${current_id_number} b??? tr??ng l???p`, duration: 5000})
      }
    }
    setErrorState(updateErrorState);
  }

  const validateDobInput = (input) => {
    const content = input;
    let temp = content.split(/[-]/)
    if (temp.length === 3) {
      let today = new Date();
      let dob = new Date(temp[0], temp[1] - 1, temp[2]);
      if (today >= dob) {
        return ""
      }
    }
    return "Kh??ng h???p l???"
  }

  const validateGenderInput = (input) => {
    const content = input;
    if (content === "male" || content === "female") {
      return ""
    } else {
      return "Kh??ng h???p l???"
    }
  }

  const validateEthnicInput = (input) => {
    const content = input;
    for (var i = 0; i < Ethnics.length; i++) {
      if (content === Ethnics[i]) {
        return ""
      }
    }
    return "Kh??ng h???p l???"
  }

  const validateReligionInput = (input) => {
    const content = input;
    if (content === "") {
      return "";
    }
    for (var i = 0; i < Religions.length; i++) {
      if (content === Religions[i]) {
        return ""
      }
    }
    return "Kh??ng h???p l???"
  }

  const validateLearningLevelsInput = (input) => {
    const content = input;
    for (var i = 0; i < LearningLevels.length; i++) {
      if (content === LearningLevels[i].value) {
        return ""
      }
    }
    return "Kh??ng h???p l???"
  }

  const validateOccupationsInput = (input) => {
    const content = input;
    for (var i = 0; i < Occupations.length; i++) {
      if (content === Occupations[i]) {
        return ""
      }
    }
    return "Kh??ng h???p l???"
  }

  const validateHomeTownInput = (input) => {
    const content = input;
    if (content === '') {
      return "Kh??ng ???????c ????? tr???ng!";
    } else {
      return "";
    }
  };

  const validateAddress_line1Input = (input) => {
    const content = input;
    if (content === '') {
      return "Kh??ng ???????c ????? tr???ng!";
    } else {
      return "";
    }
  };

  const validateAddress_line2Input = (input) => {
    const content = input;
    if (content === '') {
      return "Kh??ng ???????c ????? tr???ng!";
    } else {
      return "";
    }
  };

  if (village_id.length === 8) {
    subAgencies.push(mapSubAgenciesIDToName(village_id));
  }

  const validateVillage_IDInput = (input) => {
    const content = input;
    for (var i = 0; i < subAgencies.length; i++) {
      if (content === mapSubAgenciesNameToID(subAgencies[i])) {
        return "";
      }
    }
    return "???? c?? l???i x???y ra";
  }

  const validateBeforeSubmit = (citizen) => {
    let err = {}
    err.name = validateNameInput(citizen.name);
    err.id_number = validateId_numberInput(citizen.id_number);
    err.dob = validateDobInput(citizen.dob);
    err.gender = validateGenderInput(citizen.gender);
    err.ethnic = validateEthnicInput(citizen.ethnic);
    err.religion = validateReligionInput(citizen.religion);
    err.educational = validateLearningLevelsInput(citizen.educational);
    err.occupations = validateOccupationsInput(citizen.occupations);
    err.village_id = validateVillage_IDInput(citizen.village_id);
    err.home_town = validateHomeTownInput(citizen.home_town);
    err.address_line1 = validateAddress_line1Input(citizen.address_line1);
    err.address_line2 = validateAddress_line2Input(citizen.address_line2);
    return err;
  }

  const handleResetInput = (event) => {
    setError([]);
    setErrorState([]);
    setDataCSV([]);
    setOpen(false);
    setDataLoaded(false);
  }

  const checkError = () => {
      var errors = [];
      for (var i = 0; i < citizenCSVData.length; i++) {
        var err = validateBeforeSubmit(citizenCSVData[i]);
        if (err.name === "" && err.id_number === "" && err.dob === "" && err.gender === "" && err.ethnic === "" && err.religion === "" && err.educational === "" && err.occupations === "" && err.village_id === "" && err.home_town === "" && err.address_line1 === "" && err.address_line2 === "") {
          errors.push(true);
        } else {
          errors.push(false);
        }
      }
      setError({
        ...er,
        err
      })
      validateDuplicatedId_numberInput(errors);
  }

  const parseCSV = (fileCSVdata) => {
    return new Promise((resolve) => {
      Papa.parse(fileCSVdata, {
        delimiter: "",
        header: true,
        skipEmptyLines: true,
        complete: function(responses) {
          resolve(responses.data);
        }
      });
    });
  }

  const validateHeaderFormat = (header) => {
    if (Object.keys(header).length === 12) { 
      if (header.hasOwnProperty("id_number") && header.hasOwnProperty("name") && header.hasOwnProperty("dob") && header.hasOwnProperty("gender") && header.hasOwnProperty("ethnic") && header.hasOwnProperty("religion") && header.hasOwnProperty("educational") && header.hasOwnProperty("occupations") && header.hasOwnProperty("village_id") && header.hasOwnProperty("home_town") && header.hasOwnProperty("address_line1") && header.hasOwnProperty("address_line2")) {
        return true;
      }
    }
    return false;
  }

  const handleCSVFile = (event) => {
    let fileCSVdata = event.target.files[0];
    (async() => {
      try {
        let data = await parseCSV(fileCSVdata);
        if (validateHeaderFormat(data[0])) {
          setDataCSV(data);
        } else {
          addToast({type:'error', title:'H???ng!', message:`File CSV sai format!`, duration: 5000})
        }
      } catch (err) {
        console.log("ParseCSV error!");
      }
    })()
  }

  const [dataLoaded, setDataLoaded] = React.useState(false);

  useEffect(() => {
    if (citizenCSVData.length !== 0 && dataLoaded === false) {
      checkError();
      setOpen(true);
      setDataLoaded(true);
    }
  }, [dataLoaded, citizenCSVData]);

  const handleClose = () => {
    handleResetInput();
  };

  const ableToSubmit = () => {
    for (var i = 0; i < isError.length; i++) {
      if (isError[i] === true) {
        return false;
      }
    }
    return true;
  }

  const updateCitizensList = (data) => {
    return new Promise((resolve) => {
      for (var i = 0; i < data.length; i++) {
        dispatch(appendCitizen(data[i]));
      }
      resolve("Finish update citizens list");
    });
  }

  const handleClick = () => {
    if (clicked) {
      return 
    }
    clicked = true
    if (ableToSubmit()) {
      (async () => {
        try {
          let res = await addMultiCitizens(citizenCSVData);
          if (res.status === 200) {
            await updateCitizensList(res.data);
            addToast({type:'success', title:'Xong!', message:`Khai b??o c??ng d??n th??nh c??ng.`, duration: 5000});
            handleResetInput();
          } else {
            addToast({type:'error', title:'H???ng!', message:`???? x???y ra l???i khi th??m c??ng d??n.`, duration: 5000})
          }
          clicked = false
        } catch (e) {
          clicked = false
          if (e.response && e.response.data) {
            var errorState = [];
            for (var i = 0; i < e.response.data.length; i++) {
              if(e.response.data[i].id_number && e.response.data[i].id_number[0] === "{'citizen width this id_number has exist'}") {
                /* setError({
                  ...er,
                  id_number: "S??? CMND/CCCD ???? t???n t???i!",
                }); */
                addToast({type:'error', title:'H???ng!', message:`S??? CMND/CCCD ???? t???n t???i!`, duration: 5000})
                errorState[i] = true;
              } else {
                errorState[i] = false;
              }
            }
            setErrorState(errorState);
          }
        }
      })();
    }
  }

  useEffect(() => {
    
  }, [isError]);

  const renderData = (item, index) => {
    return (
        <TableRow key={index} hover role="checkbox" tabIndex={-1} style={{background: isError[index] === true ? "rgb(255 0 0 / 46%)":"#82DD55"}}>
            <TableCell>{item.id_number? item.id_number: "-"}</TableCell>
            <TableCell>{item.name}</TableCell>
            <TableCell>{new Date(item.dob).toLocaleDateString('en-GB')}</TableCell>
            <TableCell>{item.gender === "male" ? "Nam":"N???"}</TableCell>
            <TableCell>{item.ethnic}</TableCell>
            <TableCell>{item.religion?  item.religion: "-"}</TableCell>
            <TableCell>{educational[item.educational]}</TableCell>
            <TableCell>{item.occupations}</TableCell>
            <TableCell>{mapSubAgenciesIDToName(item.village_id)}</TableCell>
            <TableCell>{item.home_town}</TableCell>
            <TableCell>{item.address_line1}</TableCell>
            <TableCell>{item.address_line2}</TableCell>
        </TableRow>
    )
}



  if (!declarePermission) {
    return null
  }
    return (
      <div>
          <label htmlFor="contained-button-file">
            <Input accept=".csv" id="contained-button-file" type="file" onChange={handleCSVFile}/>
            <Button style={{background: "#2E3192", color: "white", marginLeft: "10px"}} variant="contained" component="span">
                Khai b??o c??ng d??n b???ng file CSV
            </Button>
          </label>
      <Dialog open={open} onClose={handleClose} maxWidth='xl'>
        <DialogTitle style={styles.title}>Khai b??o c??ng d??n b???ng file CSV</DialogTitle>
        <DialogContent>
          <TableExtra
            name="ListCitizensTitles"
            columns = {citizen_columns_full}
            data = {citizenCSVData}
            renderData = {renderData}
            searchEngine = {false}
          />
        </DialogContent>
        <DialogActions>
          <Button style={{marginLeft: "10px"}} variant="light" component="span" onClick={handleClose} >
            H???y
          </Button>
          <Button style={{ marginLeft: "10px"}} variant="contained" component="span" onClick={handleClick} disabled={!ableToSubmit()}>
            Upload
          </Button>
        </DialogActions>
      </Dialog>
      </div>
    );
}

export default AddCitizenByCSV;