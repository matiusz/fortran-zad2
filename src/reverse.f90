program main
    use, intrinsic :: iso_c_binding
    implicit none
    include 'fftw3.f03'
    character(100) :: filename
    integer (kind=c_int), dimension(10000) :: ind
    real(kind = c_double), dimension(10000) :: val
    complex(kind = c_double_complex), dimension(10000) :: transformed
    type(c_ptr) :: planb
    integer :: i
    call get_command_argument(1, filename)
    open (unit = 1, file = filename)
    do i=1, 10000
        read(1,*) ind(i), transformed(i)
	if (abs(transformed(i)) .LT. 100) then
	    transformed(i) = (0.0, 0.0)
	endif
    end do
    
    planb = fftw_plan_dft_c2r_1d(size(transformed), transformed, val, FFTW_ESTIMATE+FFTW_PRESERVE_INPUT)
    call fftw_execute_dft_c2r(planb, transformed, val)
    do i=1, 10000
        write(*,*) ind(i), real(val(i))/size(val)
    end do
    call fftw_destroy_plan(planb)
end program main
