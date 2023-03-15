LongueurTot=[]; Nom=[];
clear LongueurTot Nom

%% Initialisation

% Ces parametres doivent/peuvent évoluer ==> regarde leur influence
iDessin=false;  % Faire ou non des dessins
SeuilPixel=200; % comment nettoyer l'image : trop grand--> image floue / trop petit --> ramification coupée
LongMinimum=1; % Longueur minimum de tes ramification (en dessous, ce n'est pas supposé etre une ramification
DossierImageBrute='Length/';
DossierImageTraitee='ProcessedLength/';[a,b]=mkdir(DossierImageTraitee);
% Inscrire ici la taille tracée et la numérotation du trait à la dernière
% figure (figure 4) : avec un peu de chance, ce sera souvent 1

Seuil=100;
%Dossier = 'Longueurs';
Jour = input('Characteristic of the name of the algae : ', 's');
iLongueurEchelle=1; 
LongueurEchelle = eval(input('Scale length (cm) : ', 's'));

aa=dir(DossierImageBrute);

for index=1:size(aa,1)
    %if size(aa(index).name,1)>=size(Jour,1)
    if ((size(Jour,1)==0) || (strcmp(aa(index).name(1:min(size(aa(index).name,2),size(Jour,2))),Jour)))...
            & strcmp(aa(index).name(max(size(aa(index).name,2)-3,1):end),'.JPG')
        close all% Nom de ton image :
        FichierImageBrute=[DossierImageBrute aa(index).name] ;
        FichierImageTraitee=[DossierImageTraitee aa(index).name(1:end-4)] ;


        ImageBrute=FichierImageBrute;
        MesureTailleEnChaine
            Nom(index)={[aa(index).name]};
            LongueurTot(index).Total=sum(Longueur)-LongueurEchelle;
            LongueurTot(index).Ramification=Longueur;

            saveas(gcf,FichierImageTraitee,'fig')
            saveas(gcf,FichierImageTraitee,'png')

disp(['total: ' num2str(LongueurTot(index).Total)])
    
    end
end
LongueurTotale=[LongueurTot.Total]';Nom=Nom';
save(['AlgaeLenth' Jour],'TotalLength','Nom')
