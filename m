Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <7DB180A629C1D211869F00A0C9F44A8C17F2@retro-mail.fish.retrotech.com>
From: "Muench, David" <dmuen@retrotech.com>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] Bootstrap take 3
Date: Wed, 10 Mar 1999 09:00:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Resent-Message-ID: <"_cyCA3.0.aT.Whdvs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org


Worked great here on my 715/80.

Size = 28762 bytes, entry = 0x00001000, location = 0x0001B000

---
David Muench - Project System Administrator
Retrotech, Inc. - http://www.retrotech.com/



-----Original Message-----
From: Jason Eckhardt [mailto:jason@equator.com]
Sent: Tuesday, March 09, 1999 6:46 PM
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Bootstrap take 3



Following is take #3 of the bootstrap test.
The second test ran fine on my C160 but failed on a number of other
machines.
Its very difficult for me to determine the failures without having the
machine here to mess with. I will try a few different ideas and put them
up for people to try over the next couple days as time permits.

I still am unable to upload to the ftp site. So once again, I have included
the bootstrap in the mail.

If the test runs successfully you should see this at the end:
---------------------------------------------------------------------------

Reading parameters...done.
Size = 28672 bytes, entry = 0x00001000, location = 0xnnnnnnnn.
Loading kernel...done.
Transferring control to kernel.

*********************************************************

VMLINUX 0.0: Dummy kernel image loaded and executing!


It is now safe to reboot. (you should see this at least once, and upto 6
times).

---------------------------------------------------------------------------
The very last thing you should see is a "spinning cursor" which means
you reached the last statement in the bootstrap (i.e. passed). (this is
an infinite loop, the cursor will spin forever until you reboot).

It seems that some characters get dropped on some systems, usually when
booting over the network. I don't know why this is the case, and HPs
documentation doesn't say anything about needing delays during console I/O.






-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
