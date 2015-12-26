From: Helge Deller <deller@gmx.de>
Subject: timerfd_settime/timerfd_gettime issue ?
Date: Sat, 26 Dec 2015 13:26:14 +0100
Message-ID: <567E8766.6020707@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Thomas,

I see a strange behavior on the parisc platform, for which I'm not sure if it's intended or
if there is a bug somewhere.

The program calls timerfd_settime() and sets a timer (e.g. sec=0, nsec=100000000).
Directly after setting the timer it calls timerfd_gettime() and receives (sec=0, nsec=103914413).
The second nsec is higher than the initial nsec value which was set.

Does timerfd_settime() maybe tries to add the initial time it takes to start the timer?
Any idea or hint?

Thanks,
Helge

Background:
I'm debugging the build-failure on debian for the liblinux-fd-perl package:
https://buildd.debian.org/status/fetch.php?pkg=liblinux-fd-perl&arch=hppa&ver=0.011-1&stamp=1443355593

Here is a log which I get from kernel after adding some printks.
The problematic line is #3. 
[  465.888000] timerfd_settime: interval (sec=0, nsec=0)         it_value (sec=0, nsec=100000000) 
[  466.196000] timerfd_settime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=100000000) 
[  466.300000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=103914413) 
[  466.404000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=97444552) 
[  466.508000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=92611704) 
[  466.616000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=87376859) 
[  466.720000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=82538534) 
[  466.824000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=77293289) 
[  466.928000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=72501584) 
[  467.036000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=67377673) 
[  467.140000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=62631601) 
[  467.244000] timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=57401824) 
