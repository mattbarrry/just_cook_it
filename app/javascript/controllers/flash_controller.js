import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.element.addEventListener('click', () => {
            this.element.parentNode.remove();
        })

        setTimeout(() => {
            this.element.parentNode.remove();
        }, 5000);
    }
}
