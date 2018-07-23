//slowly increase transparency (decrease alpha), when fully transparent, destroy.
image_alpha -= .0025;
if (image_alpha <= 0) instance_destroy();