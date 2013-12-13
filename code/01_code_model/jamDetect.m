function [ n_jams, n_jammed ] = jamDetect( coordinates, jamLength, L )
%JAMDETECT Find jams larger or equal than size 'jamLength' on a road of 
% length 'L'
%   JAMDETECT( coordinates, jamLength, L) lists the coordinates of the
%   first and last car of all jams that are larger than a specified size
%   'jamLength'. The input argument 'coordinates' is a row vector of the
%   positions of all cars.

sz = size(coordinates);
n_jams=zeros(1,sz(1));
n_jammed=zeros(1,sz(1));
    for n = 1:sz(1);
        x = sort(coordinates(n,:));
        jam_size = 1;
        jam = [];
        l=numel(x);
        jam_end=-1;
        for k = 1:(2*l)
            coordinates0 = x(mod(k-1,l)+1);
            coordinates1 = x(mod(k+1-1,l)+1);
            d = mod(coordinates1-coordinates0,L); % distance between cars
            if d==1
                jam_size = jam_size+1;
            else
                jam_end = coordinates0;
                jam_start = mod(coordinates0-(jam_size-1)-1,L)+1;
                if (k>l)&&(~isempty(jam))&&(jam_start<=jam(end,1))
                    break;
                end
                %disp(jam_end-jam_start+1);
                if (mod(jam_end-jam_start,L)+1) >= jamLength
                    if (jam_start>jam_end)&&(~isempty(jam))&&(jam(1,2) == jam_end)
                        jam(1,1)=jam_start;
                    else
                        jam = [jam;jam_start,jam_end];
                    end
                end
                jam_size = 1;
            end
        end
        if ~isempty(jam)
            sz = size(jam);
            n_jams(n) = sz(1);
            length = mod(jam(:,2)-jam(:,1),L)+1;
            n_jammed(n) = sum(length);
        elseif jam_end==-1&&(~isempty(x))
            n_jams(n)=1;n_jammed(n)=L;
            jam = [1,L];
        else
            n_jams(n)=0; n_jammed(n)=0;
        end
    end
end