import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.element.addEventListener('click', () => {
            let target = this.element.dataset.target;
            let $target = document.getElementById(target);

            this.element.classList.toggle('is-active');
            $target.classList.toggle('is-active');
        })
    }
}
