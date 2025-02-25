import { LightningElement } from 'lwc';
import getWeatherDetails from '@salesforce/apex/getWetherTemp.getWeatherDetails'
export default class NewWeatherComp extends LightningElement {
    inputCityName = '';
    weatherDetails = {};
    showWeatherDetails = false;


    HandleInputChane(event) {
        this.inputCityName = event.detail.value;
    }

    handleSearch(){
        getWeatherDetails({cityName : this.inputCityName})
        .then((result) => {
            
            this.showWeatherDetails = true;
            this.weatherDetails = result;
        })
        .catch((error) => {
           this.showWeatherDetails = false;
           console.log('some error occurred while fetching weather details'+error);
        
    });
    console.log('result'+JSON.stringify(this.weatherDetails));
}
}