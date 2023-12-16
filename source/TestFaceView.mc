import Toybox.Application;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

using Toybox.Time.Gregorian as Date;

class TestFaceView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc) as Void {
        // Get the current time and format it correctly
        setClockDisplay();
        setDateDisplay();
        setDodgeTuesdayText();


        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }
    
    hidden function setClockDisplay() as Void {
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
	
	// This	will break if it doesn't match your drawable's id!
        var view = View.findDrawableById("TimeDisplay");
	
        view.setText(timeString);
    }

     hidden function setDateDisplay() as Void {
        var curTime = Time.now();
        var date = Date.info(now, Time.FORMAT_LONG);

        var dateString = Lang.format("$1$ $2$, $3$", [date.month, date.day, date.year]);
        var dateDisplay = View.findDrawableById("DateDisplay");

        dateDisplay.setText(dateString);
    }

    hidden function setDodgeTuesdayText() as Void {
        var tueText = "";
        var date = Date.info(now, Time.FORMAT_LONG);

        if (true) {
            tueText = "DODGE TUESDAY!!!";
        } else {
            tueText = "not Dodge Tuesday :((((";
        }

        var view = View.findDrawableById("DodgeTuesdayText");
        view.setText(tueText);
    }

}
