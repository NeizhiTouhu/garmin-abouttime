using Toybox.System;
using Toybox.Test;

(:test)
class AboutTimeTest {

  (:test)
  function testTimes(logger) {
    var view = new AboutTimeView();
    var time = System.getClockTime();
    view.readLocale();
    for (var hour=0; hour<24; hour++) {
      time.hour = hour;
      var nextHour = hour + 1;
      for (var min=0; min<60; min+=5) {
        time.min = min;
        var currentLocale = view.localize();
        var dict = view.prepareStrings(time, currentLocale);
        // var str = "'" + dict[:top] + "' '" + dict[:middle] + "' '" + dict[:bottom] + "'";
        var str = dict[:top] + "\t" + dict[:middle] + "\t" + dict[:bottom];
        // logger.debug(time.hour + ":" + time.min.format("%02d") + " = " + str);
        System.println(time.hour + ":" + time.min.format("%02d") + " = " + str);
        if (str.length() < 4) {
          logger.warning("Short string: " + time.hour + ":" + time.min.format("%02d") + " = " + str);
          return false;
        }
      }
    }
    return true;
  }

}
