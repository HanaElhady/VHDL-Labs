PROCESS(x)
BEGIN
  y <= x;
  z <= y;
END PROCESS;



a <= b;
b <= c;
c <= '1';



PROCESS (x)
BEGIN
  a <= x;
  b <= NOT a;
END PROCESS;

If x changes from '0' to '1' at T=0,
?? When does b update?
?? Draw the timing diagram for x, a, and b.
