import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { loadCitizensAsync } from '../../redux/reducers/citizens/citizens.thunk';
import PieChartOccupation from './PieChartOccupation';
import PieChartGender from './PieChartGender';
import { occupationsDescription, genderDescription } from '../../constants/description/description';
import PopulationLineChart from './LineChart';
import Filter from '../../components/Filter';
import { Grid } from '@mui/material';
import StatisticComponent from './StatisticComponent';
import NewPyramid from './GenderAnalysis/NewPyramid';
const ListUser = () => {
    const dispatch = useDispatch();
    const level_current_user = useSelector(state => state.user.currentUser.level);
    useEffect(() => {
        dispatch(loadCitizensAsync());
    }, []);
    const styles = {
        root: {
            display: "block",
            width: "100%",
            margin: "0 auto"
        },
        informationChart: {
            display: "flex",
            width: "100"
        },
        firstChart: {
            display: "flex",
            width: "100%",
            gap: "16px"
        },
        secondChart: {
            display: "flex",
            width: "100%",
            height: "32rem",
            marginTop: "1rem",
            gap: "16px"
        },
        age: {
            background: "white",
            width: "50%"
        }
    }

    return (
        <div class="page-limit">
            {level_current_user <= "3" && <Grid style={{marginBottom: "12px"}} container spacing={2}>
                <Grid item lg={1}>
                    <Filter type={"analysis"} />
                </Grid>

            </Grid>}
            <Grid container spacing={1.5}  rowSpacing="0">
                <Grid item lg={4} md={6} xs={12}>
                    <StatisticComponent title={"Dân số"} number={192783} />
                </Grid>
                <Grid item lg={4} md={6} xs={12}>
                    <StatisticComponent title={"Số Lượng Nam"} number={213456} />
                </Grid>
                <Grid item lg={4} md={6} xs={12}>
                    <StatisticComponent title={"Số Lượng Nữ"} number={345672} />
                </Grid>
            </Grid>
            <Grid container spacing={1.5} >
                <Grid item xs={12} lg={7}>
                    <NewPyramid />
                </Grid>
                <Grid item xs={12} lg={5}>
                    <PieChartOccupation />
                </Grid>
                <Grid item xs={12} lg={6}>
                    <PopulationLineChart />
                </Grid>
                <Grid item xs={12} lg={6}>
                    <PieChartGender />
                </Grid>
            </Grid>
        </div>
    );
}

export default ListUser;