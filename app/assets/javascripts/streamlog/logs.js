$(document).ready(function () {
    var autoScroll = true;

    function startAutoScroll() {
        $("#streamlog-resume").addClass('streamlog-hidden');
        autoScroll = true;
    }

    function stopAutoScroll() {
        $("#streamlog-resume").removeClass('streamlog-hidden');
        autoScroll = false;
    }

    function scrollToBottom() {
        window.scrollTo(0, document.body.scrollHeight);
    }

    var source = new EventSource('/streamlog/stream');

    source.addEventListener('message', function (e) {
        $("<p>" + JSON.parse(e.data) + "</p>").insertBefore(".streamlog-cursor");
        if (autoScroll)
            scrollToBottom();
    });

    $("#streamlog-resume").click(scrollToBottom);

    window.onscroll = function () {
        if ($(window).scrollTop() + $(window).height() == $(document).height())
            startAutoScroll();
        else
            stopAutoScroll();
    };
});