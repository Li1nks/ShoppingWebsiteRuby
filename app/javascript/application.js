// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


// app/javascript/packs/application.js
document.addEventListener("turbolinks:load", () => {
    // Listen for schema response from AJAX request
    document.querySelector('form[action*="check_user_schema"]').addEventListener('ajax:success', (event) => {
      const [data] = event.detail;
      // Display schema information inside the div
      document.getElementById("schema-info").innerHTML = `<pre>${JSON.stringify(data, null, 2)}</pre>`;
    });
  });