import React, { useState } from "react";
import { useSelector } from "react-redux";
import { Button, TextField } from "@mui/material";
import PieChartSubComponent from "./PieChartComponent/PieChartSubComponent";
import {filterCitizensFunc} from './GenderAnalysis/filterCitizensFunc';
import { Occupations } from "../../constants/citizen/citizens";

const extractCitizens = (citizens, startYear, endYear) => {
  return citizens.filter(element => {
      return element.dob.slice(0,4) >= startYear && element.dob.slice(0,4) <= endYear;
  });
};

const categorizeCitizensByOccupation = (citizens) => {
  const initialValue = () => {
    let value = [];
    for(let i = 0 ; i < Occupations.length ; i++){
        value.push({name: Occupations[i], value: 0})
    }
    return value;
  }
  const result = initialValue();
  citizens.forEach(element => {
      let exist = false;
      for(let i = 0 ; i<result.length - 1 ; i++){
          if(result[i].name === element.occupations){
              result[i].value++;
              exist = true;
          }
      }
      if(!exist){
          result[result.length - 1].value++;
      }
  });
  return result;
}
const PieChartOccupation = (props) => {
  const styles={
    root: {
      // height: "700px",
      background: "white",
      width: "100%",
      // minHeight: "100%",
      maxHeight: "100%",
      display: "flex",
      flexDirection: "column",
      borderRadius: "10px"
    },
    inputStyle: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      gap: "8px",
      padding: "12px"
    },
    title: {
      padding: "1rem"
    }
  }
  const {citizens, filterListAnalysis } = useSelector(state => state.citizens);
  const filteredCitizens = filterListAnalysis.length > 0 ? filterCitizensFunc(citizens, filterListAnalysis) : citizens;
  const rawData = categorizeCitizensByOccupation(extractCitizens(filteredCitizens, "1990", "1999"));
  const [data, setData] = useState(null);
  const [years, setYears] = useState({startYear: "1990", endYear: "1999"});
  const handleChangeStartYear = (e) => {
    setYears({
      ...years,
      startYear: e.target.value
    });
  }
  const handleChangeEndYear = (e) => {
    setYears({
      ...years,
      endYear: e.target.value
    })
  }
  const handleClick = () => {
    setData(categorizeCitizensByOccupation(extractCitizens(filteredCitizens, years.startYear, years.endYear)));
  }
  return (
    <div style={styles.root}>
      <h2 style={styles.title}>Nhóm dân số theo ngành</h2>
      <div style={{flexGrow: 1}}>
        <PieChartSubComponent data={data ? data : rawData} />
      </div>
      <div style={styles.inputStyle}>
         <TextField style={{width: 100}} size={"small"} onChange={handleChangeStartYear} id="startYear" label="Năm" placeholder="Năm bắt đầu"  variant="outlined" value={years.startYear}/>
         <span>đến</span>
         <TextField style={{width: 100}} size={"small"} onChange={handleChangeEndYear} id="endYear" label="Năm" placeholder="Năm bắt đầu"  variant="outlined" value={years.endYear}/>
         <Button onClick={handleClick} variant="contained">Tra cứu</Button>
       </div>
    </div>
  );
}
export default PieChartOccupation;
