function [NS,EW,UD] = smoothing(ns,ew,ud)
    NS = smooth(ns);
%     NS = smooth(NS);
%     NS = smooth(NS);
%     NS = smooth(NS);

    EW = smooth(ew);
%     EW = smooth(EW);
%     EW = smooth(EW);
%     EW = smooth(EW);

    UD = smooth(ud);
%     UD = smooth(UD);
%     UD = smooth(UD);
%     UD = smooth(UD);
end