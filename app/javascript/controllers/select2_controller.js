import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import "select2";
import "select2/dist/css/select2.min.css";


export default class extends Controller {
  connect() {
    console.log ('hello from select2 controller');
    $(this.element).select2({
      ajax: {
        url: "https://www.googleapis.com/books/v1/volumes?",
        dataType: 'json',
        delay: 500,
        data: function (params) {
          return {
            q: params.term, // search term
            page: params.page
          };
        },
        processResults: function (data, params) {
          // parse the results into the format expected by Select2
          // since we are using custom formatting functions we do not need to
          // alter the remote JSON data, except to indicate that infinite
          // scrolling can be used
          params.page = params.page || 1;

          return {
            results: data.items,
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          };
        },
        cache: true
      },
      placeholder: 'Search for a book',
      minimumInputLength: 1,
      templateResult: formatBook,
      templateSelection: formatBookSelection
    });

  }
}

  function formatBook(book) {
    if (book.loading) {
      return book.text;
    }
    console.log(book);
    if (typeof book.volumeInfo.imageLinks === "undefined"){
      var $container = $(
        "<div class='select2-result-books clearfix'>" +
        "<div class='select2-result-books__avatar'><img src=" + "http://triathlondegerardmer.com/wp-content/uploads/2019/02/no-image.jpg" + " /></div>" +
        "<div class='select2-result-books__meta'>" +
        "<div class='select2-result-books__title'></div>" +
        "<div class='select2-result-books__author'></div>" +
        // "<div class='select2-result-books__statistics'>" +
        // "<div class='select2-result-books__forks'><i class='fa fa-flash'></i> </div>" +
        // "<div class='select2-result-books__stargazers'><i class='fa fa-star'></i> </div>" +
        // "<div class='select2-result-books__watchers'><i class='fa fa-eye'></i> </div>" +
        "</div>" +
        "</div>" +
        "</div>"
      );
    } else {
      var $container = $(
        "<div class='select2-result-books clearfix'>" +
       "<div class='select2-result-books__avatar'><img src=" + book.volumeInfo.imageLinks['thumbnail'] + " /></div>" +
      "<div class='select2-result-books__meta'>" +
        "<div class='select2-result-books__title'></div>" +
        "<div class='select2-result-books__author'></div>" +
        // "<div class='select2-result-books__statistics'>" +
        // "<div class='select2-result-books__forks'><i class='fa fa-flash'></i> </div>" +
        // "<div class='select2-result-books__stargazers'><i class='fa fa-star'></i> </div>" +
        // "<div class='select2-result-books__watchers'><i class='fa fa-eye'></i> </div>" +
        "</div>" +
        "</div>" +
        "</div>"
      );
    }

    $container.find(".select2-result-books__title").text(book.volumeInfo.title);
    $container.find(".select2-result-books__author").text(book.volumeInfo.authors);
    // $container.find(".select2-result-books__forks").append(repo.forks_count + " Forks");
    // $container.find(".select2-result-books__stargazers").append(repo.stargazers_count + " Stars");
    // $container.find(".select2-result-books__watchers").append(repo.watchers_count + " Watchers");

    return $container;
  }

  function formatBookSelection(book) {
    console.log(book);
    // return book.volumeInfo || book.text;
  }

      // const url = `https://www.googleapis.com/books/v1/volumes?q=${this.searchInputTarget.value}`
      // fetch(url, { headers: { 'Accept': 'text/plain' } })
      //   .then(response => response.json())
      //     .then((data) => {
      //       data.items.forEach(el => {
      //         this.listTarget.insertAdjacentHTML('beforeEnd',
      //           `<div class="bookmark-card">
      //             <img style="-webkit-user-select: none;margin: auto;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src='${el.volumeInfo.imageLinks['thumbnail']}'>
      //             <h5> '${el.volumeInfo.title}' </h5>
      //         </div>`
      //         );
      //       })
      //       console.log(data.items);
      //       data.items.forEach(element => {
      //         console.log(element.volumeInfo.imageLinks["thumbnail"]);

//       //       });
//           })
//       });



//   }
// }
