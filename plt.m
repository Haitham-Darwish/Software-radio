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
## @deftypefn {} {@var{retval} =} plt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pc <pc@HAITHAM>
## Created: 2022-04-16

function retval = plt (Tx_out, name)

  for i=1:5,
    % Polar Non Return to Zero
    subplot(5,1, i);
    stairs(Tx_out(:, i));
    set(gca, 'ylim', [-5 5]);
  end
xlabel(name)
endfunction
