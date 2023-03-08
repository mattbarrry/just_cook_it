import { Controller } from "@hotwired/stimulus"

const waitTime = 750;
let timer;

export default class extends Controller {
    static get targets() {
        return ["form", "text"]
    }

    submit() {
        this.formTarget.requestSubmit();
        this.formTarget.reset();
    }

    textSearch() {
        clearTimeout(timer);
        timer = setTimeout(() => {
            if (this.verifyUrl(this.textTarget.value)) {
                this.submit();
            } else {
                // do something to indicate no valid url after [x] seconds
            }
        }, waitTime);
    }

    verifyUrl(text) {
        try {
            return Boolean(new URL(text));
        } catch(e) {
            return false;
        }
    }
}
