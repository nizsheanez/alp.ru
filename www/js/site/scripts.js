$(document).ready(function()
{
    $('#menu_nav li').each(function()
    {
        var self = $(this),
            is_active = self.hasClass('active');
        $(this).hover(function()
        {
            self.addClass('active');
        }, function()
        {
            if (!is_active)
            {
                self.removeClass('active');
            }
        });
    });

    $('.left:first').css({'height': $('.content:first').height() + 50,'background-color': '#f0fefe'});
})
;