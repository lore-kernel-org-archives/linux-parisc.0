From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Machine stuck when userspace 100% busy
Date: Mon, 22 Oct 2012 09:41:36 +0200
Message-ID: <35fd660c364b9a45770b17a5bd0ecbaf@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

My C3600 runs the CMake nightly builds. Basically this is a master 
process (ctest) that forks other binaries that do the actual tests. 
Afterwards it collects the output. If the child does not respond for 
some time (usually set to 30 minutes) it will get killed by ctest.

Yesterday someone accidentially introduced an endless loop into CMake, 
so some of the called tests will run at 100% CPU load forever. The 
master process was not affected by this, so these childs should have 
eventually got killed. But this did not happen. It did happen on all 
other machines building those tests 
(http://open.cdash.org/index.php?project=CMake&date=2012-10-21, e.g. 
http://open.cdash.org/viewTest.php?onlyfailed&buildid=2621607), but not 
on my machine. And from all what I can tell it does not look as if it is 
a ctest bug, but something in the scheduler or something like that not 
working properly.

$ ping voyager
PING voyager (192.168.2.119) 56(84) bytes of data.
64 bytes from voyager (192.168.2.119): icmp_seq=1 ttl=64 time=0.504 ms
64 bytes from voyager (192.168.2.119): icmp_seq=2 ttl=64 time=0.268 ms
64 bytes from voyager (192.168.2.119): icmp_seq=3 ttl=64 time=0.274 ms

So, the machine is alive and the ping time is ok. Doing ssh to it will 
get stuck for hours (literally). So, sadly, I have currently no way to 
get into userland of the machine. What I know is:

-ssh doesn't work
-kernel is alive
-the machine is very likely running at 100% CPU load from a normal user 
account (with not too excessive RAM usage AFAIK)

So for me it looks like this "userspace is at 100%" does something 
utterly bad to the scheduling, as it seems that no other processes will 
get their chance of running. If ctest would get it's chance it should 
have killed the slave after ~30 minutes, and ssh should definitely work. 
 From what I see on other machines the worst case scenario would be 18 of 
these amok processes, so after ~9 hours the dust should start to clear. 
That would have been nearly 20 hours ago, so something is not working 
there.

Any ideas?

Eike
