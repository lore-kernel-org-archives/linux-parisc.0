From: Meelis Roos <mroos@linux.ee>
Subject: Re: Aw: Re: parsic: strange boot crash on a500
Date: Mon, 5 Dec 2016 12:22:52 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1612051210370.25582@math.ut.ee>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee> <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de> <alpine.LRH.2.20.1611272329430.19497@math.ut.ee> <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de> <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
 <trinity-e31b21fb-9eb0-43ac-9d20-c8882740e7d6-1480347397040@3capp-gmx-bs03> <trinity-2cc16b5d-53b2-4332-8a92-566526865345-1480347604360@3capp-gmx-bs71> <alpine.LRH.2.20.1611282036240.11649@math.ut.ee> <02c86f80-c5c8-c652-21b4-2a32d51c15fe@gmx.de>
 <98c1d3ba-53be-57f6-5a06-5c4895c4bf6c@gmx.de> <alpine.LRH.2.20.1611282220060.12618@math.ut.ee> <664aac8f-f2cd-07bd-9fad-c65ec21d314f@gmx.de> <1f4ef55f-cae9-03a7-0fea-795910a7dcd0@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: null <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1f4ef55f-cae9-03a7-0fea-795910a7dcd0@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> and then it dawned on me - I have wrong symlink under /boot. On most 
> >> machines I have symlink named test that points to my latest test kernel, 
> >> but on parisc I had default vmlinux since installerkenl worked out of 
> >> the box with it. So it just worked, until I removed vmlinux and created 
> >> "test" symlink by mistake whern testing 4.9-rc*. Now I recreated the 
> >> vmlinux symlink and the new kernels just work.
> >>
> >> So it was a bad user error my side, probably from staying up too late 
> >> some day :)
> >>
> >> However, palo seems to miss error handling in that case.
> > 
> > Agreed, I'll try to fix that.
> 
> I just tried to fix this problem, but could not reproduce it.
> Can you explain exactly how your symlinks looked like ?

vmlinux and vmlinux.old are symlinks in /boot, with no path, just 
pointing to vmlinux-... files. In the problematic case, there was no 
vmlinux symlink, just "test" symlink that palo did not know anything 
about.

> E.g. a "ls -la" output of /boot ?

Current one is

-rw-r--r-- 1 root root 1037705 Jul  1  2013 System.map-3.10.0
-rw-r--r-- 1 root root 1050543 Oct  8  2013 System.map-3.11.0
-rw-r--r-- 1 root root 1046172 Jun  9  2014 System.map-3.15.0
-rw-r--r-- 1 root root 1053608 Aug 12  2014 System.map-3.16.0
-rw-r--r-- 1 root root 1068795 Dec  8  2014 System.map-3.18.0
-rw-r--r-- 1 root root 1080097 Mar  9  2015 System.map-3.19.0
-rw-r--r-- 1 root root 1083003 Apr 15  2015 System.map-4.0.0
-rw-r--r-- 1 root root 1087981 Jun 26  2015 System.map-4.1.0
-rw-r--r-- 1 root root 1119899 Sep  1  2015 System.map-4.2.0
-rw-r--r-- 1 root root  777767 Jul 29 19:23 System.map-4.7.0
-rw-r--r-- 1 root root  783238 Oct  5 20:50 System.map-4.8.0
-rw-r--r-- 1 root root  792511 Nov 25 23:24 System.map-4.9.0-rc5-00297-g20afa6e
-rw-r--r-- 1 root root  798408 Nov 27 21:25 System.map-4.9.0-rc6-00240-gd8e435f
-rw-r--r-- 1 root root  798408 Nov 28 20:39 System.map-4.9.0-rc7
-rw-r--r-- 1 root root  798539 Dec  5 09:39 System.map-4.9.0-rc7-00198-g0cb65c8
-rw-r--r-- 1 root root       0 Jun  2  2014 System.map-dummy
-rw-r--r-- 1 root root   33032 Jul  1  2013 config-3.10.0
-rw-r--r-- 1 root root   33555 Oct  8  2013 config-3.11.0
-rw-r--r-- 1 root root   34596 Aug 12  2014 config-3.16.0
-rw-r--r-- 1 root root   35356 Dec  8  2014 config-3.18.0
-rw-r--r-- 1 root root   35788 Mar  9  2015 config-3.19.0
-rw-r--r-- 1 root root   35945 Apr 15  2015 config-4.0.0
-rw-r--r-- 1 root root   35930 Jun 26  2015 config-4.1.0
-rw-r--r-- 1 root root   32036 Sep  1  2015 config-4.2.0
-rw-r--r-- 1 root root   34196 Jul 29 19:23 config-4.7.0
-rw-r--r-- 1 root root   34342 Oct  5 20:50 config-4.8.0
-rw-r--r-- 1 root root   34725 Nov 25 23:24 config-4.9.0-rc5-00297-g20afa6e
-rw-r--r-- 1 root root   35044 Nov 27 21:25 config-4.9.0-rc6-00240-gd8e435f
-rw-r--r-- 1 root root   35044 Nov 28 20:39 config-4.9.0-rc7
-rw-r--r-- 1 root root   35076 Dec  5 09:39 config-4.9.0-rc7-00198-g0cb65c8
drwx------ 2 root root   12288 Nov  6  2012 lost+found
lrwxrwxrwx 1 root root      32 Dec  5 09:39 vmlinux -> vmlinux-4.9.0-rc7-00198-g0cb65c8
-rw-r--r-- 1 root root 7177406 Jul  1  2013 vmlinux-3.10.0
-rw-r--r-- 1 root root 7267400 Oct  8  2013 vmlinux-3.11.0
-rw-r--r-- 1 root root 7620429 Aug 12  2014 vmlinux-3.16.0
-rw-r--r-- 1 root root 7749731 Dec  8  2014 vmlinux-3.18.0
-rw-r--r-- 1 root root 7795213 Mar  9  2015 vmlinux-3.19.0
-rw-r--r-- 1 root root 7815201 Apr 15  2015 vmlinux-4.0.0
-rw-r--r-- 1 root root 7846008 Jun 26  2015 vmlinux-4.1.0
-rw-r--r-- 1 root root 8022604 Sep  1  2015 vmlinux-4.2.0
-rw-r--r-- 1 root root 7827216 Jul 29 19:23 vmlinux-4.7.0
-rw-r--r-- 1 root root 7882632 Oct  5 20:50 vmlinux-4.8.0
-rw-r--r-- 1 root root 8022800 Nov 25 23:24 vmlinux-4.9.0-rc5-00297-g20afa6e
-rw-r--r-- 1 root root 8071224 Nov 27 21:25 vmlinux-4.9.0-rc6-00240-gd8e435f
-rw-r--r-- 1 root root 8071224 Nov 28 20:39 vmlinux-4.9.0-rc7
-rw-r--r-- 1 root root 8071400 Dec  5 09:39 vmlinux-4.9.0-rc7-00198-g0cb65c8
lrwxrwxrwx 1 root root      17 Nov 28 20:39 vmlinux.old -> vmlinux-4.9.0-rc7

palo.conf:

# Please read the palo --help output for more info
# Non-commented lines are treated as command line arguments

--commandline=2/vmlinux root=/dev/sda3
--init-partitioned=/dev/sda

#Uncomment this if you want a rescue kernel
#--recoverykernel=/boot/vmlinux.old


> Were they hardlinks ?

No.

> Can you still reproduce the problem with latest palo 1.96 ?

Yes - just did "rm vmlinux" from the above state and rebooted and it 
crashed like before.

-- 
Meelis Roos (mroos@linux.ee)
