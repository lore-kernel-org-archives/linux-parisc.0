From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Mon, 17 Oct 2011 18:28:07 -0400
Message-ID: <BLU0-SMTP3369C2E5C7F1EBE9C97C5B97E40@phx.gbl>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <20111017152358.GA3518@glitch> <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com> <4E9C6F9E.5000605@bell.net> <4E9C9643.6030309@systemhalted.org> <4E9C9971.5090806@bell.net> <20111017215734.GA28681@glitch>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Domenico Andreoli <cavok@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111017215734.GA28681@glitch>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 17-Oct-11, at 5:57 PM, Domenico Andreoli wrote:

> On Mon, Oct 17, 2011 at 05:09:05PM -0400, John David Anglin wrote:
>> On 10/17/2011 4:55 PM, Carlos O'Donell wrote:
>>> On 10/17/2011 2:10 PM, John David Anglin wrote:
>>>>> On 10/17/2011 11:47 AM, Carlos O'Donell wrote:
>>>>>>> The test-fork1 failure is still unexplained and happens  
>>>>>>> intermittently.
>>>>>> I have built a lot of unstable on my rp3440.  I think this
>>>> one causes failures in the thread
>>>>> testsuites of perl, python2.7 and glib2.0.  These are  
>>>>> characterized by tests hanging.
>>>>>> There is another class of failures.  They typically cause
>>>> my rp3440 to crash due
>>>>> to cache corruption.  The GCC libgomp and libatomic-ops  
>>>>> testsuite seem to trigger
>>>>> this one.  As I have mentioned, it's the libgomp "for" tests that
>>>>>>>
>>>>>>> The cancellation issues happen in tst-cancel*.
>>>>>>>
>>>>>>> I believe the cancellation issues are toolchain issues and I  
>>>>>>> need to
>>>>>>> look into them.
>>>>> Possibly, this is related to the following bug that I found last  
>>>>> week building mpfr-3.1.0:
>>>>> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50691
>>>>> A call to __tls_get_addr clobbers first argument of call to  
>>>>> mpfr_cache.  Don't have a
>>>>> fix at the moment, but there is a simple testcase.
>>>>>> On a different subject, I tried to get udev-172-1 working.
>>>> However, this breaks bootstrap
>>>>> due to an invalid argument in a call to inotify_init.  It's  
>>>>> somewhat timing dependent since
>>>>> some kernels will boot if they build enough of /dev before udev  
>>>>> messes up.  In any case,
>>>>> I believe that Guy Martin posted a patch a year or so ago to  
>>>>> correct an inconsistency
>>>>> between the glibc and the kernel for some bit definitions.  I'm  
>>>>> thinking this may fix the
>>>>> udev problem.
>>> What patch is this? I don't remember it. URL?
>>>
>> http://www.cygwin.com/ml/libc-ports/2010-08/msg00001.html
>
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=617973
>
dave@mx3210:~$ dpkg -l libc6
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/ 
Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============- 
============================================
ii  libc6          2.13-10        Embedded GNU C Library: Shared  
libraries

Bug was supposed to be fixed in 2.13-0exp4...

This is the console output:

...
Loading, please wait...
mount: mounting udev on /dev failed: No such device
W: devtmpfs not available, falling back to tmpfs for /dev
udevd[834]: inotify_init failed: Invalid argument
udevd[834]: error initializing inotify
Begin: Loading essential drivers ... SCSI subsystem initialized done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ...
Begin: Running /scripts/local-top ... done.
Begin: Waiting for root file system ... done.
Gave up waiting for root device. Common problems:
  - Boot args (cat /proc/cmdline)
     - Check rootdelay= (did the system wait long enough?)
     - Check root= (did the system wait for the right device?)
  - Missing modules (cat /proc/modules; ls /dev)
chvt: can't open console
ALERT! /dev/sda5 does not exist. Dropping to a shell!

BusyBox v1.18.4 (Debian 1:1.18.4-1) built-in shell (ash)
Enter 'help' for a list of built-in commands.

/bin/sh: can't access tty; job control turned off
(initramfs)

Dave
--
John David Anglin	dave.anglin@bell.net



