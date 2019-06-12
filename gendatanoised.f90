program main
    integer :: i
    real :: num
    call random_seed()
    do i=0, 10000
        call random_number(num)
        write(*,*)    i, (2*sin(2*3.141592*REAL(i)/10000*400))+(sin(2*3.141592*REAL(i)/10000*200))+num-0.5

    end do
end program
