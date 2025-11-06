%% Çoklu eğim testi: SOC - Vterm - Ibatt karşılaştırması
clc; clear; close all;

model = 'EV_Powertrain';
load_system(model);

grades = [0 5 10];          % derece
simTime = 30;               % s
colors = lines(numel(grades));

% Sonuç depoları
SOCs   = cell(size(grades));
Vterms = cell(size(grades));
Ibatt  = cell(size(grades));
labels = strings(size(grades));

% yardımcı fonksiyon tanımı daha aşağıda olacak!
for k = 1:numel(grades)
    grade_deg = grades(k);
    assignin('base','grade_deg',grade_deg);

    simOut = sim(model,'StopTime',num2str(simTime), ...
        'SrcWorkspace','base','SaveOutput','on');

    SOC   = getSig(simOut,'soc_log1');
    Vt    = getSig(simOut,'Vterm_log');
    Ib    = getSig(simOut,'I_batt');

    if ~isempty(SOC) && size(SOC,2) > 1, SOC = SOC(:,2); end
    if ~isempty(Vt)  && size(Vt,2)  > 1, Vt  = Vt(:,2);  end
    if ~isempty(Ib)  && size(Ib,2)  > 1, Ib  = Ib(:,2);  end

    SOCs{k}   = SOC;
    Vterms{k} = Vt;
    Ibatt{k}  = Ib;
    labels(k) = sprintf('grade = %d°',grade_deg);

    dSOC = SOC(1) - SOC(end);
    fprintf('grade = %2d°  -->  ΔSOC = %.6f  |  avg|Ibatt| = %.3f A\n', ...
        grade_deg, dSOC, mean(abs(Ib)));
end


%% Grafikler
t = linspace(0,simTime,numel(SOCs{1})); % örnekleme eşitse iş görür
figure('Name','Karşılaştırma','Color','w','Position',[100 100 1100 800]);

subplot(3,1,1); hold on; grid on; title('Battery SOC vs Grade'); xlabel('Time (s)'); ylabel('SOC (%)');
for k=1:numel(grades), plot(t,SOCs{k},'LineWidth',1.6,'Color',colors(k,:)); end
legend(labels,'Location','best');

subplot(3,1,2); hold on; grid on; title('Battery Terminal Voltage V_{term}'); xlabel('Time (s)'); ylabel('V_{term} (V)');
for k=1:numel(grades), plot(t,Vterms{k},'LineWidth',1.6,'Color',colors(k,:)); end
legend(labels,'Location','best');

subplot(3,1,3); hold on; grid on; title('Battery Current |I_{batt}|'); xlabel('Time (s)'); ylabel('|I_{batt}| (A)');
for k=1:numel(grades), plot(t,abs(Ibatt{k}),'LineWidth',1.6,'Color',colors(k,:)); end
legend(labels,'Location','best');

% (Opsiyonel) tablo
final_SOC = cellfun(@(x) x(end), SOCs);
delta_SOC = cellfun(@(x) x(1)-x(end), SOCs);
avg_Ibatt = cellfun(@(x) mean(abs(x)), Ibatt);
disp(table(grades',final_SOC',delta_SOC',avg_Ibatt', ...
     'VariableNames',{'Grade_deg','Final_SOC','Delta_SOC','Avg_Ibatt'}));
%% --- Yardımcı Fonksiyonlar ---

function sig = getSig(simOut,name)
try
    sig = simOut.get(name);
catch
    try
        sig = simOut.find('Name',name).Values.Data;
    catch
        sig = [];
    end
end
end
