function plotter(I, im2)
    figure;
    % Original image
    subplot(3, 2, 1)
    imshow(I)
    title("Original image")
    subplot(3, 2, 2)
    imhist(I)
    title("Original image - histogram")

    % Equalize function
    subplot(3, 2, 3)
    imshow(im2)
    title("Equalized image")
    subplot(3, 2, 4)
    imhist(im2)
    title("Equalized image - histogram")

    % histeq function
    I = histeq(I);
    subplot(3, 2, 5)
    imshow(I)
    title("histeq image")
    subplot(3, 2, 6)
    imhist(I)
    title("histeq - histogram")
end