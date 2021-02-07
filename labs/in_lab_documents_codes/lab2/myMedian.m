function [median] = myMedian(img)
[row,col,ch] = size(img);    
Card = row*col; % Cardinality
    if (ch==3)
        img = rgb2gray(img);
    end
    img = double(img);
    Data = reshape(img, [1 Card]); % I reshaped my photo to 1D array
    Data = sort(Data);    
    if (mod(Card,2) == 0)
        ind = Card/2;
        median = (Data(ind) + Data(ind+1))/2;
    else
        ind = (Card+1)/2;
        median = Data(ind);
    end
end