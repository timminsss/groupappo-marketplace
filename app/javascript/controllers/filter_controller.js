import { Controller } from "@hotwired/stimulus"
import Isotope from "isotope-layout"
let selectedCategory = ''

export default class extends Controller {
  static targets = ["bikesContainer", "button"]

  connect() {
    console.log("Hello from the filter side!")
    this.setupFilters()
    this.initIsotope()
    this.activeClasses = ["btn", "btn-primary", "active"]
    debugger
  }

  initIsotope() {
    const options = {}
    this.isotope = new Isotope( this.bikesContainerTarget, options)
    console.log(this.isotope)
  }

  setupFilters() {
    this.filters = {
      // show if number is greater than 50
      category: ( itemElem ) => {
                              const bikeCategory = itemElem.dataset.category
                              return bikeCategory === this.selectedCategory;
                            },
    }
  }

  applyActiveClass(button) {
    this.activeClasses.forEach((className) => {
      button.classList.add(className)
    })
  }

  removeActiveClasses() {
    this.buttonTargets.forEach((button) => {
      this.activeClasses.forEach((className) => {
        button.classList.remove(className)
      })
    })
  }

    applyFilter(event) {
      this.removeActiveClasses()
      const clickedButton = event.currentTarget
      this.selectedCategory = clickedButton.dataset.filter

      this.applyActiveClass(clickedButton)

      this.isotope.arrange({ filter: this.filters['category'] });
    }
}
