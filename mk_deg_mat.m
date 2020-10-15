function ret = mk_deg_mat( size, tap )

ret = zeros( size, size );
for i=0:size-1
  for j=0:tap-1
    pos = mod( i+j, size );
    ret( i+1, pos+1 ) = 1.0 / tap;
  end
end

end

