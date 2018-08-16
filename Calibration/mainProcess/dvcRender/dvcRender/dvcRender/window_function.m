function  window_function(action, src,evnt, w )
%WINDOW_FUNCTION Window event handler
%   Response to user mouse activity
import OpenTK.*;

%% switch action
switch (action)
        
      case 'MouseMove'
        button=[];
        if(evnt.Button==System.Windows.Forms.MouseButtons.Left), button='Left'; end
        if(evnt.Button==System.Windows.Forms.MouseButtons.None), button='None'; end
        if(evnt.Button==System.Windows.Forms.MouseButtons.Right), button='Right'; end
        if(evnt.Button==System.Windows.Forms.MouseButtons.Middle), button='Middle'; end
        if(evnt.Button==System.Windows.Forms.MouseButtons.XButton1), button='XButton1'; end
        if(evnt.Button==System.Windows.Forms.MouseButtons.XButton2), button='XButton2'; end

        XY = double([evnt.X evnt.Y]);
        diffXY = XY - w.sceneData.LastXY;
         switch(button)             
            case 'Left'
                 diff_pos = w.camera.eye - w.camera.target;
                 
                 %% Z component
                 rotScale = [pi/w.camera.rotScale(1) pi/w.camera.rotScale(2)];
                 degZ = diffXY(2)*rotScale(2);
                 % The tangential vector
                 normZ = Vector3d(-diff_pos(3),0,diff_pos(1));
                 rotZ = Matrix4d.CreateFromAxisAngle(normZ,degZ);
                 %% Y component
                 degY = diffXY(1)*rotScale(1);
                 rotY = Matrix4d.CreateRotationY(degY);
                 
                 %% New position
                 rot = Matrix4d.Mult(rotZ,rotY);
                 old_diff = Vector3d(diff_pos(1),diff_pos(2),diff_pos(3));
                 new_diff = Vector3d.TransformPosition(old_diff,rot);
                 w.camera.eye =  w.camera.target + [new_diff.X new_diff.Y new_diff.Z];
                 
                 % Draw Polygons
                 render( w );
                  
            case 'Right'
                 transScale = w.camera.transScale;                
                 dist = w.camera.eye - w.camera.target;
                 normZ = [dist(1) dist(3)];
                 normZ = normZ./norm(normZ); % normalize it
                 % Translation along tangential direction
                 new_diff = [normZ(2) 0 -normZ(1)].*diffXY(1)/transScale(1);
                 % Translation along view direction
                 new_diff = new_diff + [normZ(1) 0 normZ(2)].*diffXY(2)/transScale(2);
                 w.camera.eye = w.camera.eye + new_diff;
                 w.camera.target = w.camera.target + new_diff;
                 
                 % Draw Polygons
                 render( w );
                 
            case 'Middle'
                 w.camera.eye = w.camera.eye - w.camera.target;
                 w.camera.target = [0 0 0];
                 
                 % Draw Polygons
                 render(w);
               
            otherwise
            return
         end
        w.sceneData.LastXY = XY;
        
    case 'MouseWheel'
          z = double(evnt.Delta);
          zoomscale = w.camera.zoomScale;
          diff_pos = w.camera.eye - w.camera.target;
          norm_diff = diff_pos./norm(diff_pos); % normalize it
          norm_diff = norm_diff.*(z/zoomscale);
      
          if ( norm(diff_pos + norm_diff) > w.camera.minDistance)
              w.camera.eye = w.camera.eye + norm_diff;
          end         
          % Draw Polygons
          render( w );
   
    case 'MouseDown'
         w.sceneData.LastXY = double([evnt.X evnt.Y]);
    case 'MouseUp'
    case 'KeyPress'
        %data.viewmatrix=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
    case 'FormClosing'
        %% Stop timer        
        if (w.timer.timeInterval > 0)
            stop(w.timer.t);
            delete(w.timer.t)
            w.timer.timeInterval = -1;
        end
        
        %% Remove bodies
        for i=1:size(w.Bodies,2)
            if (w.Bodies(i).visible)
                w.Bodies(i).geom.close();
            end
        end
        
        if (w.grid ~= 0)
            w.grid.close();
        end

        renControl = w.sceneData.renControl;
        renControl.Dispose();
        return;
    case 'FormClosed'
        % Remove Form and Window data
        return;
    case 'SizeChanged'
        renWindow = w.sceneData.renForm;
        w.sceneData.width = double(renWindow.Width);
        w.sceneData.height = double(renWindow.Height);
        renControl = w.sceneData.renControl;
        renControl.Size = System.Drawing.Size(w.sceneData.width - 17,w.sceneData.height-38);
        % Get Render (window) size
        w.sceneData.renderWidth = double(renControl.Size.Width);
        w.sceneData.renderHeight = double(renControl.Size.Height);
        setupViewport( w );  
        render( w );
    case 'Enter'
        renControl = w.sceneData.renControl;
        renControl.MakeCurrent();     
        render( w );
    otherwise
        %id
        %action
        %eventdata
end

% Draw Polygons
%render( w );

end

