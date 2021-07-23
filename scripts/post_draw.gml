
if (unsafe_itemgettimer > 0)
{
    var alpha = (1.0 * unsafe_itemgettimer)/itemgettimer_max;

    var item = nspecial_itemlist[itemselect];
    draw_sprite_ext(item.sprite, item.image, x, y - 100, 1, 1, 0, c_white, alpha);

    unsafe_itemgettimer--;
}
