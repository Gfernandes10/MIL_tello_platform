clc; clear; close all;

%% Parâmetros do Drone
mass = 1.0;   % Massa do drone (kg)
g = 9.81;     % Gravidade (m/s^2)
inertia = diag([0.02, 0.02, 0.04]); % Tensor de inércia (kg.m^2)

%% Controladores PID (Ganho P, I, D para cada eixo)
kp_roll = 1.0; ki_roll = 0.1; kd_roll = 0.05;
kp_pitch = 1.0; ki_pitch = 0.1; kd_pitch = 0.05;
kp_yaw = 1.0; ki_yaw = 0.1; kd_yaw = 0.05;

kp_vx = 1.0; ki_vx = 0.1; kd_vx = 0.05;
kp_vy = 1.0; ki_vy = 0.1; kd_vy = 0.05;
kp_vz = 1.0; ki_vz = 0.1; kd_vz = 0.05;

%% Inicialização das Variáveis
position = [0; 0; 0];
velocity = [0; 0; 0];
euler = [0; 0; 0]; % [roll; pitch; yaw]
angular_velocity = [0; 0; 0];

%% Comando de Entrada (simulando um cmd_vel)
desired_velocity = [0.5; 0.5; -0.2]; % [vx, vy, vz] (m/s)
desired_yaw_rate = 0.1; % (rad/s)

%% Loop de Simulação
dt = 0.01; % Passo de tempo (s)
T = 5; % Tempo total (s)
n_steps = T / dt;

% Erros acumulados para controle integral
error_int_v = [0; 0; 0];
error_int_yaw = 0;

for k = 1:n_steps
    %% Cálculo do Erro
    error_v = desired_velocity - velocity;
    error_yaw = desired_yaw_rate - angular_velocity(3);
    
    % Atualização dos erros integrados
    error_int_v = error_int_v + error_v * dt;
    error_int_yaw = error_int_yaw + error_yaw * dt;
    
    %% Controle PID para velocidade linear
    force_x = kp_vx * error_v(1) + ki_vx * error_int_v(1) + kd_vx * (error_v(1)/dt);
    force_y = kp_vy * error_v(2) + ki_vy * error_int_v(2) + kd_vy * (error_v(2)/dt);
    force_z = kp_vz * error_v(3) + ki_vz * error_int_v(3) + kd_vz * (error_v(3)/dt);
    
    %% Controle PID para yaw
    torque_yaw = kp_yaw * error_yaw + ki_yaw * error_int_yaw + kd_yaw * (error_yaw/dt);
    
    %% Aplicação das forças e torques
    force = [force_x; force_y; force_z + mass * g];
    torque = [0; 0; torque_yaw];
    
    %% Atualização da Dinâmica
    acceleration = force / mass - [0; 0; g];
    velocity = velocity + acceleration * dt;
    position = position + velocity * dt;
    
    angular_acceleration = inertia \ (torque - cross(angular_velocity, inertia * angular_velocity));
    angular_velocity = angular_velocity + angular_acceleration * dt;
    euler = euler + angular_velocity * dt;
    
    %% Plotagem em tempo real
    clf; hold on; grid on;
    plot3(position(1), position(2), position(3), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
    xlim([-1 1]); ylim([-1 1]); zlim([-1 1]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
    title(sprintf('Posição: (%.2f, %.2f, %.2f)', position));
    pause(0.01);
end

%% Exibição dos Resultados
fprintf('Posição final: X=%.2f, Y=%.2f, Z=%.2f\n', position);
