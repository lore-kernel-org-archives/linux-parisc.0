Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <36E748FC.38A01576@Technologist.Com>
Date: Wed, 10 Mar 1999 22:39:24 -0600
From: Justin Hamilton <CTOP@Technologist.Com>
Reply-To: JHamilton@Earthling.Net
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Bootstrap take 3 - SUCCESSFUL
References: <199903092345.RAA25911@equator.com>
Content-Type: multipart/mixed;
 boundary="------------F37B0E25A39500AA966A619F"
Resent-Message-ID: <"qZP1y.0.9O5.9aqvs"@sod.res.cmu.edu>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------F37B0E25A39500AA966A619F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Happy to announce my 9000/720 booted & ran the dummy kernel successfully
from my 2nd disk.

Keep it coming, I have a whole 2nd disk to test this on as it is
developed.  Wish I had some OS Coding knowledge & experience to add to
the project.  I will settle for being a tester :)

Jason Eckhardt wrote:

> If the test runs successfully you should see this at the end:
> ---------------------------------------------------------------------------
> 
> Reading parameters...done.
> Size = 28672 bytes, entry = 0x00001000, location = 0xnnnnnnnn.
> Loading kernel...done.
> Transferring control to kernel.
> 
> *********************************************************
> 
> VMLINUX 0.0: Dummy kernel image loaded and executing!
> 
> It is now safe to reboot. (you should see this at least once, and upto 6 times).
> 
> ---------------------------------------------------------------------------
> The very last thing you should see is a "spinning cursor" which means
> you reached the last statement in the bootstrap (i.e. passed). (this is
> an infinite loop, the cursor will spin forever until you reboot).

Got This.

> It seems that some characters get dropped on some systems, usually when
> booting over the network. I don't know why this is the case, and HPs
> documentation doesn't say anything about needing delays during console I/O.

Screen looks good, mine is running on a graphics display, not an ASCII
terminal.

-- 

Justin Hamilton
mailto:JHamilton@Earthling.Net

CTOP Computers
mailto:CTOP@Technologist.Com

-- "Microsoft announced today that the official release date for the new
operating system 'Windows 2000' will be delayed until the second quarter
of 1901."

-- "The number of UNIX installations has grown to 10, with more
expected." - The UNIX Programmer's Manual, Second Edition (June 1972)
--------------F37B0E25A39500AA966A619F
Content-Type: text/x-vcard; charset=us-ascii;
 name="CTOP.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Justin Hamilton
Content-Disposition: attachment;
 filename="CTOP.vcf"

begin:vcard 
n:Hamilton;Justin
tel;fax:(205) 985-8523
tel;work:(205) 620-CTOP (2867)
x-mozilla-html:TRUE
org:CTOP Computers
adr:;;549, Creekview Drive;Pelham;AL;35124;USA
version:2.1
email;internet:JHamilton@Earthling.Net
title:Linux Intranet Specialist
x-mozilla-cpt:;-16496
fn:Justin Hamilton
end:vcard

--------------F37B0E25A39500AA966A619F--

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
