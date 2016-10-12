From: Helge Deller <deller@gmx.de>
Subject: timekeeping: Cycle offset (32) is larger than allowed by the
 'jiffies' clock's max_cycles value (10): time overflow danger
Date: Wed, 12 Oct 2016 23:22:30 +0200
Message-ID: <57FEA996.3030004@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: "john.stultz@linaro.org" <john.stultz@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When enabling CONFIG_DEBUG_TIMEKEEPING, I see on kernel 4.8 git head
those warnings on the parisc architecture:

Linux version 4.8.0-64bit+ (deller@p100.box) (gcc version 4.9.2 20150212 (Red Hat Cross 4.9.2-5) (GCC) ) #516 SMP Wed Oct 12 22:52:58 CEST 2016
...
clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0xacf9151134, max_idle_ns: 440795214493 ns
WARNING: timekeeping: Cycle offset (32) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
         timekeeping: Your kernel is sick, but tries to cope by capping time updates
WARNING: timekeeping: Cycle offset (42) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
         timekeeping: Your kernel is sick, but tries to cope by capping time updates
...
At this stage the jiffies clocksource was not yet registered (at least not mentioned in the bootlog).
This warning happens over and over. Maybe it should be rate-limited too?

Comparing to 4.7 where CONFIG_DEBUG_TIMEKEEPING is not enabled I see:
root@c8000:~# dmesg | grep clock
[    0.000000] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0xcf914c9718, max_idle_ns: 440795231327 ns
[    0.873644] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    7.968087] clocksource: Switched to clocksource cr16

Am I somehow missing to initialize the max_cycles field of the jiffies clocksource
on the parisc architecture ?

Helge
