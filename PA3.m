function [] = PA3(NumParticles)

    time = 200;

    x = zeros(NumParticles, 1);
    last_x = zeros (NumParticles, 1);
    v = zeros (NumParticles, 1);
    last_v = zeros (NumParticles, 1);
    
    acc = 2;
    Elast = -1.5;
    
    vArr = [];
    mean_v = 0;

    figure(1)
    hold on

    for t = 1:time
        v = v + acc;
        x = x + v;
    
        scattered = rand(NumParticles, 1) < 0.05;
        if any(scattered)
            v =v .* (1-scattered); 
        end
    
        figure(1)
        subplot(2, 1, 1);
        hold on
        plot([t-1 t], [last_x x], "g");
        xlabel('Time', 'FontSize', 10);
        ylabel('Distance', 'FontSize', 10);

        subplot(2, 1, 2);
        hold on
        plot([t-1 t], [last_v v], "r");
        xlabel('Time', 'FontSize', 10);
        ylabel('Velocity', 'FontSize', 10);

        vArr = [vArr v]; %Concatnate vArr with itself and new values
        mean_v = mean(vArr, "all"); %Average of all values of Array 
        title(sprintf("Avg Velocity: %s", mean_v))

%         subplot(3, 1, 3)
%         hold on
%         plot([last_x x], [last_v v], "b");
        
        last_x = x;
        last_v = v;

    end
    
end