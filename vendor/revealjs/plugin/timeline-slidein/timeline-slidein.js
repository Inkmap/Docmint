var slideInModals = document.querySelectorAll('.slidein-modal');
var modalDelayTimeout;
var modalDurationTimeout;

if (slideInModals.length > 0) {
    [].forEach.call(slideInModals, function(modal, index) {
        var slideInModalClose = document.createElement('button');
        slideInModalClose.className = 'slidein-modal-close';
        slideInModalClose.textContent = 'x';
        slideInModalClose.setAttribute('title', 'Close');
        modal.appendChild(slideInModalClose);

        slideInModalClose.addEventListener('click', function(ev) {
            modal.className = "slidein-modal";
            clearTimeout(modalDelayTimeout);
            clearTimeout(modalDurationTimeout);
            ev.preventDefault();
        });
    });
}

var showModal = function(event) {
    var modalId = event.currentSlide.getAttribute('data-timeline-slidein') || false;
    var modalDelay = event.currentSlide.getAttribute('data-timeline-slidein-delay') || 500;
    var modalDuration = event.currentSlide.getAttribute('data-timeline-slidein-duration') || 5000;
    modalDuration = +modalDelay + +modalDuration;

    if (slideInModals.length > 0) {
        [].forEach.call(slideInModals, function(modal, index) {
            modal.className = "slidein-modal";
        });
    }

    clearTimeout(modalDelayTimeout);
    clearTimeout(modalDurationTimeout);

    if (modalId) {
        modalDelayTimeout = setTimeout(function() {
            document.querySelector('#' + modalId).className = "slidein-modal slidein-modal--active";
        }, modalDelay);

        modalDurationTimeout = setTimeout(function() {
            document.querySelector('#' + modalId).className = "slidein-modal";
        }, modalDuration);
    }
}

Reveal.addEventListener('ready', function(event) {
    showModal(event);
});

Reveal.addEventListener('slidechanged', function(event) {
    showModal(event);
});