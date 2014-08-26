$(document).ready(function () {
    var autoScroll = true;

    function startAutoScroll() {
        $("#resume").addClass('hidden');
        autoScroll = true;
    }

    function stopAutoScroll() {
        $("#resume").removeClass('hidden');
        autoScroll = false;
    }

    function scrollToBottom() {
        window.scrollTo(0, document.body.scrollHeight);
    }

    var source = new EventSource('/streamlog/stream');

    source.addEventListener('message', function (e) {
        $("<p>" + JSON.parse(e.data) + "</p>").insertBefore(".cursor");
        if (autoScroll)
            scrollToBottom();
    });

    $("#resume").click(scrollToBottom);

    window.onscroll = function () {
        if ($(window).scrollTop() + $(window).height() == $(document).height())
            startAutoScroll();
        else
            stopAutoScroll();
    };
});