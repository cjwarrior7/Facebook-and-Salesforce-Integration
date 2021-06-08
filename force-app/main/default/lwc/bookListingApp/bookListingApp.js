import { LightningElement,track } from 'lwc';
const BOOK_URL = "https://www.googleapis.com/books/v1/volumes?q=";
export default class BookListingApp extends LightningElement {
    query = 'Man';
    @track books = {};
    timer

    connectedCallback(){
        this.handleFetch();
    
    }

    handleFetch(){
         fetch(BOOK_URL+this.query)
        .then((response) => response.json()) 
          /* response.json() gives us back a promise
          we need to process the promise in .then()*/
        .then((data) => {console.log(data)
           this.books = data
          console.log(':'+books); })
        .catch((error =>console.error(error)));
      }
//deboucing technique of Searching with timer variable
      fetchHandler(event){
          this.query = event.target.value;
          window.clearTimeout(this.timer)
          this.timer = setTimeout(()=>{
            this.handleFetch();
          },1000)
          

      }
}
 