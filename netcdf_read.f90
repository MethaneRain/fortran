program ReadIn
    use netcdf
    integer ncid,ierr,dimidx,dimidy,dimidz,dimidt,varid,varidx,varidy
    integer varidz,varidt,startA(1),countA(1),startB(4),countB(4)
    integer lenx,leny,lenz,lent

    integer NF_OPEN,NF_NOWRITE,NF_INQ_DIMID,NF_INQ_VARID,NF_INQ_DIMLEN
    integer NF_GET_VARA_REAL,NF_CLOSE

    ierr=nf90_open('/Users/chowdahead/Desktop/hgt.2016.nc',NF_NOWRITE,ncid)
    print*,1,ierr

    ierr=NF_INQ_DIMID(ncid,'time',dimidt)
    print*,5,ierr

end program ReadIn