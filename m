Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id C31F04829
	for <parisc-linux@parisc-linux.org>; Tue, 14 Jan 2003 15:27:51 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 status update 2003-01-14
Date: Tue, 14 Jan 2003 23:27:15 +0100
References: <20030114155409.X26554@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030114155409.X26554@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200301142327.16050.deller@gmx.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Matthew,

some comments from me too:

On Tuesday 14 January 2003 16:54, Matthew Wilcox wrote:
>  - Helge went completely nuts on drivers/video ;-)

:-)

> The largest chunks of that are:
>
> -rw-r--r--    1 willy    willy      166953 Jan 12 07:54 parisc-hil.diff
> -rw-r--r--    1 willy    willy      151345 Jan 12 07:47 parisc-video.diff
>
> I'm not worried about drivers/video; Helge's doing a great job staying
> synchronised with James Simmons' fb tree and that artificially inflates
> that diff.

Correct. I'll continue to feed James with our changes, so next time
when Linus syncs, we should be done.

> I am a little worried about the HIL keyboard/mouse/etc.  If someone could
> step up to take care of making them work in 2.5 and generally look after
> them, that'd be great.

It's on my todo-list, but sadly I'm currently a little too much busy with
my day-job. I'll hope to find some time in the next 10 days to look closer at this.

> Status:
> -------
>  - Merged to 2.5.58
>  - 2.5.57 booted on A500.  712 has serial problems.
>  - 2.5.56 booted on A500, 712

2.5.58-pa2 booted on 715/64

> Todo:
> -----
>  - Serial code not working for c3000 (helge)

Sadly my c3000 is completely broken, so I won't be able to test it anymore.

>  - Some options still need Kconfig help entries

Maybe some of our native english speakers could jump in here ?

>  - drivers/char/keyboard.c:987:2: warning: #warning "Cannot generate
> rawmode keyboard for your architecture yet."

I might look at this...

>  - our PDC early debug console hacks need to be cleaned up somehow

... and this too.

BTW, what happened to our IODC-Console ?????

>  - fix HIL problem: ksoftirqd eats 100% cpu (kernel 2.4; kernel 2.5?)

I'll try to look at this too.

>  - proc files are b0rken (interrupts), possible irqi funcs related pb.

pa64:~# cat /proc/interrupts 
           CPU00 
 32:     108092      PARISC-CPU  timer
 33:      13183      PARISC-CPU  lasi
 39:    1122504      PARISC-CPU  wax
 86:      11647            Lasi  lasi710
 87:        969            Lasi  i82596
 90:        569            Lasi  serial
125:          0             Wax  HP SDC NMI
126:    1122503             Wax  HP SDC

pa64:~# uname -a
Linux pa64 2.5.58-pa2 #349 Tue Jan 14 23:00:41 CET 2003 parisc unknown unknown GNU/Linux

I think I fixed that 1-2 weeks ago.

> - kernel module loader support

YES, PLEASE !


>  Started and in progress:
>  ------------------------
>  - port sym53c8xx hppa changes forward (helge)

I can't continue here, maybe some can take over and look if it's still necessary ?

>  - port hil_kbd.c to new input layer
>  - port hil_ptr.c to new input layer

belongs to HIL stuff.


Helge
