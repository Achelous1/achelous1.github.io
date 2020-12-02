$(document).ready(function() {
    $(".cProgramming").circularProgress({
        line_width: 6,
        color: "#ccc",
        starting_position: 0, // 12.00 o' clock position, 25 stands for 3.00 o'clock (clock-wise)
        percent: 0, // percent starts from
        percentage: true,
        text: "C Programming"
    }).circularProgress('animate', 80, 5000);
});
