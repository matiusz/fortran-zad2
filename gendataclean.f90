program main
    integer :: i
    do i=0, 10000
        write(*,*)   i, sin(2*3.141592*REAL(i)/10000*200)+2*sin(2*3.141592*REAL(i)/10000*400)
    end do
end program

