SEGGIES=16;

module display()
{
    union()
    {
        // Backlight
        color("Gainsboro")
        cube([85, 62.8, 2.4]);

        // LCD
        color("DarkSeaGreen")
        translate([0, 0, 2.4])
        cube([85, 55.8, 2]);
        
        // Top rubbery bit
        color([0.1, 0.1, 0.1, 1])
        translate([4, 55.8, 2.4])
        cube([78, 7, 1.8]);
    }
}

module pushbutton()
{
    union()
    {
        // Body
        color([0.1, 0.1, 0.1, 1])
        cube([6, 6, 3.4]);

        // Cap
        color("Silver")
        translate([0, 0, 3.4])
        cube([6, 6, 0.1]);

        // Actuator
        color([0.1, 0.1, 0.1, 1])
        translate([3, 3, 0])
        cylinder(r=(3.5/2), h=4.3, $fn=SEGGIES);
    }
}

module keyboard()
{
    KEYSPACEV=10;
    KEYSPACEH=12.5;

    for(r=[0:2])
    {
        translate([0, r*KEYSPACEV, 0])
        for(i=[0:6])
        {
            translate([i*KEYSPACEH, 0, 0])
            pushbutton();
        }
    }
        
    translate([KEYSPACEH, KEYSPACEV*3, 0])
    for(i=[0:4])
    {
        translate([i*KEYSPACEH, 0, 0])
        pushbutton();
    }
}

module usb_a()
{
    union()
    {
        color("Silver")
        difference()
        {
            union()
            {
                // Shell
                cube([13.1, 14.1, 5.7]);
                
                // Little lip at the front
                translate([-0.7, 0, -0.7]) 
                cube([14.5, .4, 7.1]);
            }
            
            translate([0.2, -0.1, 0.2]) 
            cube([12.7, 14.0, 5.3]);
        }
        
        // Dingly tab
        color([0.1, 0.1, 0.1, 1])
        translate([0.5, 0, 3]) 
        cube([12, 13, 1.7]);
    }
}

module ethernet()
{
    color("Silver")
    difference()
    {
        // Shell
        cube([15.75, 21.72, 13.35]);
        
        // Jack
        translate([1.9, -0.1, 4.1])
        cube([11.95, 20, 6.7]);
    }
}

module usb_micro()
{
    // Jack
    color("Silver")
    cube([7.86, 5.1, 3.1]);

}



translate([0, 40, 0])
display();
keyboard();