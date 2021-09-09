window.addEventListener("load", function(){
    window.cookieconsent.initialise({
      "palette": {
        "popup": {
          "background": "#383a35",
          "text": "#EEEEEE"
        },
        "button": {
          "background": "#62a744",
          "text": "#eeeeee"
        }
      },
      "position": "bottom",
      "static": false,
      "content": {
        "message": "Digilent uses cookies to ensure you get the best experience on our websites.  By using our site you agree to our use of cookies.",
        "dismiss": "Got it!",
        "link": "Learn More",
        "href": "https://store.digilentinc.com/digilent-cookie-policy/"
      }
    })});