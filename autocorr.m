## Copyright (C) 2022 pc
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} autocorr (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pc <pc@HAITHAM>
## Created: 2022-04-18

function retval = autocorr (Tx_out)

  retval=zeros(700, 700);
  for t=1:700,
    for tau=0:700-t,
      retval(t, tau+1)=Tx_out(t, :)*Tx_out(t+tau, :)'/500;
    end
  end
figure
    plot(retval(1,:));
    xlabel('Stat auto')
    sum=0;
  for taw = 0: 699
      for t = 1: 700-taw
       sum = sum + Tx_out(t,350)*Tx_out(taw+t,350); 
      end   
     timeauto(taw+1)=sum/(700-taw);
 sum=0; 
  end
 figure(4)
t=0:1:499; % More than 500 Samples will be meaningless due to the large values of tau.
plot(t,timeauto(1:500),'LineWidth',2);
title('Time Auto corrleration '); xlabel('Taw'); ylabel('RX(TAW) ');  

endfunction
