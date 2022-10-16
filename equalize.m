function im2 = equalize(im)
    im2 = im;

    % Find the size of the image
    [rows, cols] = size(im2);

    % Now calculating intensity levels for all the values
    levels = zeros(1, 256);                     % Create an empty array
    for i = 1:rows
        for j = 1:cols 
            idx = im2(i, j) + 1;                % +1 as intesity values are from 0-255 but index are from 1-256
            levels(idx) = levels(idx) + 1;      % Increment that index
        end
    end

    % Now calculate PDF (Pk) for each intensity level
    N = rows * cols;                            % Calculate total number of pixels
    P = @(Nk) Nk / N;                           % Create lambda function of the equation
    levels = arrayfun(P, levels);               % Apply function to each intensity level

    % Now finding the descrete version of the CDF
    running_sum = levels(1);                    % Initialize the running sum with the first value
    for i = 2:256                               % Start from 2 as first one doesnt need any addition
        running_sum = running_sum + levels(i);  % Update the sum with current value
        levels(i) = running_sum;                % Update the current value
    end 

    % Now perform the mapping
    for i = 1:rows
        for j = 1:cols
            intensity = im2(i, j) + 1;
            Sk = levels(intensity) * 255;
            im2(i ,j) = round(Sk);
        end
    end
end