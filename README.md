# Godilloscope

Godilloscope is an oscilloscope drawing application made using the Godot game engine.
Currently you can create drawings in the XY drawing viewport. These drawings will be translated into the X waveform view and the Y waveform view. These views are an accurate representation of the what the left and right audio channel's waveforms will look like.

The application allows you to modify the frequency of the waveform anywhere from 1Hz to 22050Hz

There is an image overlay option to allow users to trace over their image of choice.

Godilloscope also comes equipped with line manipulation tools. These include translation, scale, and rotation.
This only affects the selected line group though. The user can make unlimited line groups. Snapping can be used to connect the end of a line to the start thus completing a line and creating a shape. There is also an option for wobble compensation. Godilloscope will try to transition between lines groups as quickly as possible. On some oscilloscopes this introduces wobble. Wobble compensation changes the line group transition amount. Default = 0.05

It is also possible to save and open drawings as .dat files. Also compatible with .json made using http://bummsn.de/osc_txt/

This version doesn't include a midi sequencer but If I get around to it the next version will
