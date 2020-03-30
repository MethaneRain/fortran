program arrays
    implicit none
    INTEGER, DIMENSION(8) :: vert_press_levels
    vert_press_levels(1)=1000
    vert_press_levels(2)=925
    vert_press_levels(3)=850
    vert_press_levels(4)=700
    vert_press_levels(5)=500
    vert_press_levels(6)=400
    vert_press_levels(7)=300
    vert_press_levels(8)=250
    print *,"8th entry of pressur level array: ",vert_press_levels(8),"hPa"
end program arrays