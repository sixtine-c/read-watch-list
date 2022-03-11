import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "list", "searchInput"]
  connect() {
    console.log(this.element);
    // console.log(this.formTarget);
    // console.log(this.listTarget);
    console.log(this.searchInputTarget);
  }

  search() {
    // this.listTarget = "";
    const url = `https://www.googleapis.com/books/v1/volumes?q=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.json())
      .then((data) => {
        data.items.forEach(el => {
          this.listTarget.insertAdjacentHTML('beforeEnd',
            `<div class="bookmark-card">
                <img style="-webkit-user-select: none;margin: auto;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src='${el.volumeInfo.imageLinks['thumbnail']}'>
                <h5> '${el.volumeInfo.title}' </h5>
            </div>`
        );
      })
      console.log(data.items);
      data.items.forEach(element => {
        console.log(element.volumeInfo.imageLinks["thumbnail"]);

      });
      })
  }
}
