package com.buet.brtc.test;

import java.util.*;
import java.util.concurrent.TimeUnit;

public class Test {

    public static void main(String[] args) {
        Map<TimeUnit, Long> result = computeDiff(
                new Date(System.currentTimeMillis() - 100042001),
                //new Date(System.currentTimeMillis() - 042001),
                new Date()
        );
        System.out.println(result);
        //{DAYS=1, HOURS=3, MINUTES=46, SECONDS=40, MILLISECONDS=0, MICROSECONDS=0, NANOSECONDS=0}
        System.out.println(result.get(TimeUnit.MINUTES));
        System.out.println(timeDiffToString(result));
    }

    public static String timeDiffToString(Map<TimeUnit, Long> result) {
        String time = "";
        Long days = result.get(TimeUnit.DAYS);
        Long hours = result.get(TimeUnit.HOURS);
        Long minute = result.get(TimeUnit.MINUTES);
        Long second = result.get(TimeUnit.SECONDS);
        if (days > 0) time += days + " day ";
        if (hours > 0) time += hours + " hours ";
        if (minute > 0) time += minute + " minute ";
        if (second > 0) time += second + " second ";
        return time + " ago";
    }

    public static Map<TimeUnit, Long> computeDiff(Date date1, Date date2) {
        long diffInMillies = date2.getTime() - date1.getTime();
        List<TimeUnit> units = new ArrayList<TimeUnit>(EnumSet.allOf(TimeUnit.class));
        Collections.reverse(units);

        Map<TimeUnit, Long> result = new LinkedHashMap<TimeUnit, Long>();
        long milliesRest = diffInMillies;
        for (TimeUnit unit : units) {
            long diff = unit.convert(milliesRest, TimeUnit.MILLISECONDS);
            long diffInMilliesForUnit = unit.toMillis(diff);
            milliesRest = milliesRest - diffInMilliesForUnit;
            result.put(unit, diff);
        }
        return result;
    }

}
