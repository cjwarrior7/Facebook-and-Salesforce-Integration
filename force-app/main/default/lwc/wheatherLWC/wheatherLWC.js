import { LightningElement, track } from 'lwc';
import getWheatherDetails from '@salesforce/apex/WheatherAppController.getWheatherDetails';
export default class WheatherLWC extends LightningElement {
    @track city = "" ;
    @track temperature = "" ;
    error; 
      
    changecity(event){
        this.city = event.target.value ;     
        console.log('city:'+city);
    }

    getTemp(event){
        if(this.city !=null || this.city != ''){
            getWheatherDetails({cityName : this.city})
            .then(result =>{
                 this.temperature = result
                 console.log('temperature '+temperature );
            })
            .catch(error =>{
             this.error = error;
            });
        }
        else{
            alert('Please enter City');
        }
    }
}