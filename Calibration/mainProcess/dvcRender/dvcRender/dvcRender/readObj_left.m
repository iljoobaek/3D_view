function [obj_left] = readObj(fname)
%
% obj = readObj(fname)
%
% This function parses wavefront object data
% It reads the mesh vertices, texture coordinates, normal coordinates
% and face definitions(grouped by number of vertices) in a .obj file 
% 
%
% INPUT: fname - wavefront object file full path
%
% OUTPUT: obj.v - mesh vertices
%       : obj.vt - texture coordinates
%       : obj.vn - normal coordinates
%       : obj.f - face definition assuming faces are made of of 3 vertices
%
% Bernard Abayowa, Tec^Edge
% 11/8/07

% set up field types
%v = []; vt = []; vn = []; f.v = []; f.vt = []; f.vn = [];

fid = fopen(fname);

if (fid == -1)
    fprintf('Cannot open file %s.\n',fname);
end

%% get number of face to allocate correct cell array
numFace = 0;
numVerts = 0;
while 1    
    tline = fgetl(fid);
    if ~ischar(tline),   break,   end  % exit at end of file 
    ln = sscanf(tline,'%s',1); % line type 
    if (ln == 'f')
        numFace = numFace + 1;
    end
    
    if (ln == 'v')
        numVerts = numVerts + 1;
    end
    
end
fclose(fid);

%% Face
iFace = 0;
f.v = cell(numFace,1);
f.vt = cell(numFace, 1);
%% Verts
iVert = 0;
v = zeros(numVerts,3);

count = 1;
fid = fopen(fname);
%% parse .obj file 
while 1    
    tline = fgetl(fid);
    if ~ischar(tline),   break,   end  % exit at end of file 
     ln = sscanf(tline,'%s',1); % line type    

     %disp(ln)
    switch ln
        case 'v'   % mesh vertexs
            iVert = iVert+1;
            v_new = sscanf(tline(2:end),'%f')';            
            v(iVert,:) = v_new;
        case 'f'   % face definition     
            iFace = iFace+1;
            str = textscan(tline(2:end),'%s'); str = str{1};
            
            [vt, matches] = strsplit(tline, {'/','/'}, 'CollapseDelimiters', true);
            fvt(1, count) = str2double(vt(2));
            fvt(2, count) = str2double(vt(4));
            fvt(3, count) = str2double(vt(6));
            count = count + 1;
            
            %nf = length(findstr(str{1},'/')); % number of fields with this face vertices
 
            [tok str] = strtok(str, '//');     % vertex only
            fv = ones(1,length(tok));
            for k = 1:length(tok)
                fv(k) = str2double(tok{k}); 
            end
%             if (nf > 1) 
%             [tok str] = strtok(str,'//');   % add normal coordinates
%                 for k = 1:length(tok) fvn = [fvn str2num(tok{k})]; end
%             end
             f.v{iFace} = fv;
             f.vt{iFace} = fvt;
            % f.vn(iFace,:) =fvn;
    end
end
fclose(fid);

% set up matlab object 
obj_left.vt = vt;
obj_left.v = v;
% obj.vt = vt; 
% obj.vn = vn;
obj_left.f = f;
