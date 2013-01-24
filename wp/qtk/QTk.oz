%
% Authors:
%   Donatien Grolaux (2000)
%
% Copyright:
%   (c) 2000 Université catholique de Louvain
%
% Last change:
%   $Date$ by $Author$
%   $Revision$
%
% This file is part of Mozart, an implementation
% of Oz 3:
%   http://www.mozart-oz.org
%
% See the file "LICENSE" or
%   http://www.mozart-oz.org/LICENSE.html
% for information on usage and redistribution
% of this file, and for a DISCLAIMER OF ALL
% WARRANTIES.
%
%  The development of QTk is supported by the PIRATES project at
%  the Université catholique de Louvain.

functor

import
   QTkBare(build:DialogBuilder
           dialogbox:DialogBox
           bell:Bell
           clipboard:Clipboard
           newFont:NewFont
           newImage:NewImage
           newImageLibrary:NewImageLibrary
           loadImageLibrary:LoadImageLibrary
           saveImageLibrary:SaveImageLibrary
           buildImageLibrary:BuildImageLibrary
           buildMenu:NewMenu
           newLook:NewLook
           wInfo:WInfo
           setAssertLevel:SetAssertLevel
           qTkDesc:QTkDesc
           newBuilder:GetBuilder
           flush:Flush)

export
   build:DialogBuilder
   dialogbox:DialogBox
   Bell
   Clipboard
   NewFont
   NewImage
   NewImageLibrary
   LoadImageLibrary
   SaveImageLibrary
   BuildImageLibrary
   buildMenu:NewMenu
   newLook:NewLook
   WInfo
   SetAssertLevel
   QTkDesc
   newBuilder:GetBuilder
   Flush

end
