program main
    use, intrinsic :: iso_c_binding
    implicit none
    include 'fftw3.f03'
    character(100) :: filename
    integer (kind=c_int), dimension(10000) :: ind
    real(kind = c_double), dimension(10000) :: val
    complex(kind = c_double_complex), dimension(10000) :: transformed
    character(2) :: c
    type(c_ptr) :: planf
    integer :: i
    call get_command_argument(1, filename)
    call get_command_argument(2, c)
    open (unit = 1, file = filename)
    do i=1, 10000
        read(1,*) ind(i), val(i)
    end do
    planf = fftw_plan_dft_r2c_1d(size(val), val, transformed, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(planf, val, transformed)
    if (c .eq. '1') then
        do i=1, 10000
            write(*,*) ind(i), transformed(i)
        end do
    else
        do i=1, 10000
            write(*,*) abs(transformed(i))
        end do
    endif
    call fftw_destroy_plan(planf)
end program main

