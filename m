Return-Path: <parisc-linux-request@lists.parisc-linux.org>
Received: from spam.carreker.com (unknown [65.221.249.208])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCC08484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 18:31:05 -0700 (MST)
Received: from localhost (dalvir04.carreker.com [127.0.0.1])
	by spam.carreker.com (Postfix) with ESMTP id B2FCF2E81DA
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 19:29:04 -0600 (CST)
Received: from spam.carreker.com ([127.0.0.1])
	by localhost (dalvir04.carreker.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 06571-06 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 19:29:03 -0600 (CST)
Received: from pickup.carreker.com (unknown [172.21.1.23])
	by spam.carreker.com (Postfix) with ESMTP id D2E752E841B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 18:54:46 -0600 (CST)
Message-ID: <20040126170109.28A1048E8@dsl2.external.hp.com>
From: parisc-linux-request@lists.parisc-linux.org
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 26 Jan 2004 11:01:09 -0600
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_003_01C3E42E.16DEE200"
Subject: [parisc-linux] parisc-linux Digest, Vol 2, Issue 32
Reply-To: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


------_=_NextPart_003_01C3E42E.16DEE200
Content-Type: text/plain;
	charset="iso-8859-1"

Send parisc-linux mailing list submissions to
	parisc-linux@lists.parisc-linux.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
or, via email, send a message with subject or body 'help' to
	parisc-linux-request@lists.parisc-linux.org

You can reach the person managing the list at
	parisc-linux-owner@lists.parisc-linux.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of parisc-linux digest..."


Today's Topics:

   1. Re: menu not available (Matthew Wilcox)
   2. Re: Re: [parisc-linux] missing barrier in _raw_spin_lock?
      (John David Anglin)
   3. Re: kernel BUG at mm/shmem.c:585! (Carlos O'Donell)
   4. Re: kernel BUG at mm/shmem.c:585! (John David Anglin)
   5. installation failed on C240 (fx4) workstation  
      (Reinhold Flecke CCF)
   6. help installation failed on C240 (fx4) workstation
      (Reinhold Flecke CCF)
   7. Re: kernel BUG at mm/shmem.c:585! (Grant Grundler)
   8. Re: help installation failed on C240 (fx4) workstation
      (Grant Grundler)
   9. A fix for B2k and CONFIG_PDC_CONSOLE pb (Joel Soete)


----------------------------------------------------------------------

Message: 1
Date: Sun, 25 Jan 2004 22:40:40 +0000
From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] menu not available
To: Grant Grundler <grundler@parisc-linux.org>
Cc: "Peralta, Joseph A" <jperalta@WPI.EDU>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20040125224040.GG11844@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii

On Fri, Jan 23, 2004 at 03:11:49PM -0700, Grant Grundler wrote:
> On Fri, Jan 23, 2004 at 04:47:11PM -0500, Peralta, Joseph A wrote:
> > When I try to install certain X-window managers under Debian 3.0 I
get
> > "xxx depends on menu (>> 1.5)... menu is not available" How would I
fix
> > this?
> 
> Dunno...menu is available for "sarge" (aka testing) and that
> works for me. Sounds like someone wants to backport to Woody.

menu is not available for woody because it's written in a language which
bears a passing resemblance to C++.  someone rewrote it in C++ for
sarge.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and
refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain


------------------------------

Message: 2
Date: Sun, 25 Jan 2004 19:13:47 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Re: [parisc-linux] missing barrier in _raw_spin_lock?
To: arndb@onlinehome.de
Cc: grundler@parisc-linux.org, arnd@arndb.de,
	parisc-linux@parisc-linux.org
Message-ID: <200401260013.i0Q0Dltk013819@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=US-ASCII

> > #define __ldcw(a) ({ \
> >   unsigned int __ret;
\
> >   __asm__ __volatile__("ldcw 0(%2),%0"
\
> > 		      : "=r" (__ret), "=m" (*(a)) : "r" (a));
\
> >   __ret;
\
> > })

> I suppose the memory operand specification is required here. Newer 
> compilers (especially gcc-3.4) can optimize away local variables if
you 
> only access the address but not the contents. I think even your 
> pthreads version is not really correct, because it specifies (*(a)) as
> output only instead of inout.

I agree.

> No, putting the barrier into __ldcw is wrong because it would impact
all
> other uses of __ldcw that don't need the barrier. AFAICS, the 

The only other uses for __ldcw are the SPIN_LOCK macro in atomic.h
and the _raw_spin_trylock in spinlock.h (i.e., it is only used
acquire locks).  If all these need barriers, then it might as well
be in __ldcw.

Dave
-- 
J. David Anglin
dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX:
952-6602)


------------------------------

Message: 3
Date: Sun, 25 Jan 2004 21:15:09 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
Message-ID: <20040126021508.GZ1060@baldric.uwo.ca>
Content-Type: text/plain; charset=us-ascii

On Fri, Jan 23, 2004 at 02:40:27PM -0500, John David Anglin wrote:
> > It appears non-fatal, and I want to blame the compiler :)
> 
> I agree but the proof is in the pudding ;-)

I told Grant, that at my current schedule, it would be 2006 
before I fixed this problem :)

It looks like a reordering issue, perhaps taking a look at the
respective .o objects produced by the two compilers might reveal the
issue. I think that's the way we did it when the tty layer broke and we
had to have that console.o compiled with 3.0.4 by hand? I think Randolph
and Grant worked on that together. I might have the wrong names, but
we've successfully debugged a problem like this before using similar
methods.

c.



------------------------------

Message: 4
Date: Sun, 25 Jan 2004 21:35:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
Message-ID: <200401260235.i0Q2Z783024373@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=US-ASCII

> On Fri, Jan 23, 2004 at 02:40:27PM -0500, John David Anglin wrote:
> > > It appears non-fatal, and I want to blame the compiler :)
> > 
> > I agree but the proof is in the pudding ;-)
> 
> I told Grant, that at my current schedule, it would be 2006 
> before I fixed this problem :)

My schedule isn't much better.  I'm off to Tokyo at the end of the week
to waive the Canadian flag at the ISO LRG meetin next week.  After that,
my brother's company would like me to work on more firmware for a new
project.

Is this on a SMP kernel (i.e., could this be a locking issue)?

Dave
-- 
J. David Anglin
dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX:
952-6602)


------------------------------

Message: 5
Date: Mon, 26 Jan 2004 11:54:13 +0100
From: "Reinhold Flecke CCF" <reinhold.flecke@ccf-consulting.de>
Subject: [parisc-linux] installation failed on C240 (fx4) workstation
	
To: <parisc-linux@lists.parisc-linux.org>
Message-ID:
	<LBEMKLBEFDGDOGGAOGIKAEJPCCAA.reinhold.flecke@ccf-consulting.de>
Content-Type: text/plain; charset="iso-8859-1"

I downloaded the "debian-30r2-hppa-binary-1.iso" and burned it to CD. 
If I start the installation on my C240 (fx4) workstation  with the
command:
bo sescsi.2.0

it seems everything ok, until I get the message:
..If this is the last message you see, you may need to switch your
console.
  This is a common sympton sarch the FAQ and mailing list at
parisc-linux.org

After this nothing happens anymore.
I searched the FAQ and mailing list but I could not find a solution.
Anyone who can help?

Thanks in advance.

Best Regards
Reinhold Flecke


Reinhold Flecke CCF
Fon:	+49 (0)5292 930601 (Office)
	+49 (0)700 93000093 (PR)
eMail:	<mailto:Reinhold.Flecke@ccf-consulting.de>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: winmail.dat
Type: application/ms-tnef
Size: 2008 bytes
Desc: not available
Url :
http://lists.parisc-linux.org/pipermail/parisc-linux/attachments/2004012
6/13277935/winmail-0001.bin

------------------------------

Message: 6
Date: Mon, 26 Jan 2004 12:13:22 +0100
From: "Reinhold Flecke CCF" <reinhold.flecke@ccf-consulting.de>
Subject: [parisc-linux] help installation failed on C240 (fx4)
	workstation
To: <parisc-linux@lists.parisc-linux.org>
Message-ID:
	<LBEMKLBEFDGDOGGAOGIKOEJPCCAA.reinhold.flecke@ccf-consulting.de>
Content-Type: text/plain; charset="iso-8859-1"

I downloaded the "debian-30r2-hppa-binary-1.iso" and burned it to CD. 
If I start the installation on my C240 (fx4) workstation  with the
command:
bo sescsi.2.0

it seems everything ok, until I get the message:
..If this is the last message you see, you may need to switch your
console.
  This is a common sympton sarch the FAQ and mailing list at
parisc-linux.org

After this nothing happens anymore.
I searched the FAQ and mailing list but I could not find a solution.
Anyone who can help?

Thanks in advance.


Best Regards
Reinhold Flecke


Reinhold Flecke CCF
Auf dem Anger 18
33165 Lichtenau-Husen
Fon:	+49 (0)5292 930601 (Office)
	+49 (0)700 93000093 (PR)
eMail:	<mailto:Reinhold.Flecke@ccf-consulting.de>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: winmail.dat
Type: application/ms-tnef
Size: 2056 bytes
Desc: not available
Url :
http://lists.parisc-linux.org/pipermail/parisc-linux/attachments/2004012
6/902d4aa3/winmail-0001.bin

------------------------------

Message: 7
Date: Mon, 26 Jan 2004 08:53:56 -0700
From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20040126155356.GA12175@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii

On Sun, Jan 25, 2004 at 09:35:07PM -0500, John David Anglin wrote:
> Is this on a SMP kernel (i.e., could this be a locking issue)?

no. I don't build or run SMP kernels on anything at the moment.

thanks,
grant


------------------------------

Message: 8
Date: Mon, 26 Jan 2004 09:13:16 -0700
From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] help installation failed on C240 (fx4)
	workstation
To: Reinhold Flecke CCF <reinhold.flecke@ccf-consulting.de>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20040126161316.GC12175@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii

On Mon, Jan 26, 2004 at 12:13:22PM +0100, Reinhold Flecke CCF wrote:
> I downloaded the "debian-30r2-hppa-binary-1.iso" and burned it to CD. 
> If I start the installation on my C240 (fx4) workstation  with the
command:
> bo sescsi.2.0

FX-4 graphics is not supported.
Either use serial console or replace the FX4 with PCI FX-E.

sorry,
grant


------------------------------

Message: 9
Date: Mon, 26 Jan 2004 18:00:53 +0100
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] A fix for B2k and CONFIG_PDC_CONSOLE pb
To: "Grant Grundler" <grundler@parisc-linux.org>,	"Christoph
Plattner"
	<christoph.plattner@gmx.at>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <400CB8A100004C60@ocpmta3.freegates.net>
Content-Type: text/plain; charset="iso-8859-1"

Hi Grant, Christoph,

I find a fix for this pb. I tested successfully (I reach to login with a
ttyB0 after replacing ttyS0 in inittab and telinit q :) ) on a 32bit 2.4
kernel on my b2k and a 64bit (up) [also 2.4] kernel on my N4k.

Here is its main part:
diff -NaurX dontdiff linux-2.4.24-pa0.orig/arch/parisc/kernel/firmware.c
linux-2.4.24-pa0/arch/parisc/kernel/firmware.c
--- linux-2.4.24-pa0.orig/arch/parisc/kernel/firmware.c	2003-10-02
07:30:55.000000000
+0200
+++ linux-2.4.24-pa0/arch/parisc/kernel/firmware.c	2004-01-26
16:48:23.000000000
+0100
@@ -871,15 +937,21 @@
 	int status;
 
 	/* Bail if no console input device. */
-	if (!PAGE0->mem_kbd.iodc_io)
+	if ((PAGE0->mem_cons.cl_class != CL_DUPLEX) &&
!PAGE0->mem_kbd.iodc_io)
 		return 0;
 	
 	/* wait for a keyboard (rs232)-input */
 	spin_lock_irqsave(&pdc_lock, flags);
-	real32_call(PAGE0->mem_kbd.iodc_io,
-		    (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
-		    PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers), 
-		    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
+	if (PAGE0->mem_cons.cl_class == CL_DUPLEX)
+		real32_call(PAGE0->mem_cons.iodc_io,
+			    (unsigned long)PAGE0->mem_cons.hpa,
ENTRY_IO_CIN,
+			    PAGE0->mem_cons.spa,
__pa(PAGE0->mem_cons.dp.layers), 
+			    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1,
0);
+	else
+		real32_call(PAGE0->mem_kbd.iodc_io,
+			    (unsigned long)PAGE0->mem_kbd.hpa,
ENTRY_IO_CIN,
+			    PAGE0->mem_kbd.spa,
__pa(PAGE0->mem_kbd.dp.layers), 
+			    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1,
0);
 
 	ch = *iodc_dbuf;
 	status = *iodc_retbuf;
diff -NaurX dontdiff linux-2.4.24-pa0.orig/arch/parisc/kernel/pdc_cons.c
linux-2.4.24-pa0/arch/parisc/kernel/pdc_cons.c
--- linux-2.4.24-pa0.orig/arch/parisc/kernel/pdc_cons.c	2004-01-19
07:25:46.000000000
+0100
+++ linux-2.4.24-pa0/arch/parisc/kernel/pdc_cons.c	2004-01-26
16:53:32.000000000
+0100
@@ -113,10 +112,6 @@
 		return;
 	++pdc_console_initialized;
 	
-	/* If the console is duplex then copy the COUT parameters to
CIN. */
-	if (PAGE0->mem_cons.cl_class == CL_DUPLEX)
-		memcpy(&PAGE0->mem_kbd, &PAGE0->mem_cons,
sizeof(PAGE0->mem_cons));
-
 	/* register the pdc console */
 	register_console(&pdc_cons);
 }
==========><==========

Can somebody else could also test it on some other platform to be sure I
don't broken other stuff?

Thanks in advance,
    Joel

PS: Grant I join the text file of the final backport of 2.6 work
included
this patch. Thanks in advance for your attention

------------------------------------------------------------------------
-
Tiscali ADSL: 12 mois à 29,50 EUR/mois! L'Internet rapide, c'est pour
tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr


-------------- next part --------------
A non-text attachment was scrubbed...
Name: pdc_console-bp+patch.diff
Type: application/octet-stream
Size: 23324 bytes
Desc: not available
Url :
http://lists.parisc-linux.org/pipermail/parisc-linux/attachments/2004012
6/67438867/pdc_console-bppatch.obj

------------------------------

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


End of parisc-linux Digest, Vol 2, Issue 32
*******************************************

------_=_NextPart_003_01C3E42E.16DEE200
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>parisc-linux Digest, Vol 2, Issue 32</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Send parisc-linux mailing list submissions to</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux@lists.parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>To subscribe or unsubscribe via the World Wide Web, =
visit</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2><A =
HREF=3D"http://lists.parisc-linux.org/mailman/listinfo/parisc-linux" =
TARGET=3D"_blank">http://lists.parisc-linux.org/mailman/listinfo/parisc-=
linux</A></FONT>
<BR><FONT SIZE=3D2>or, via email, send a message with subject or body =
'help' to</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux-request@lists.parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>You can reach the person managing the list at</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux-owner@lists.parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>When replying, please edit your Subject line so it is =
more specific</FONT>
<BR><FONT SIZE=3D2>than &quot;Re: Contents of parisc-linux =
digest...&quot;</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Today's Topics:</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp; 1. Re: menu not available (Matthew =
Wilcox)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 2. Re: Re: [parisc-linux] missing =
barrier in _raw_spin_lock?</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (John David =
Anglin)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 3. Re: kernel BUG at mm/shmem.c:585! =
(Carlos O'Donell)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 4. Re: kernel BUG at mm/shmem.c:585! =
(John David Anglin)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 5. installation failed on C240 (fx4) =
workstation&nbsp; </FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Reinhold Flecke =
CCF)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 6. help installation failed on C240 =
(fx4) workstation</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Reinhold Flecke =
CCF)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 7. Re: kernel BUG at mm/shmem.c:585! =
(Grant Grundler)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 8. Re: help installation failed on C240 =
(fx4) workstation</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Grant =
Grundler)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 9. A fix for B2k and CONFIG_PDC_CONSOLE =
pb (Joel Soete)</FONT>
</P>
<BR>

<P><FONT =
SIZE=3D2>---------------------------------------------------------------=
-------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 1</FONT>
<BR><FONT SIZE=3D2>Date: Sun, 25 Jan 2004 22:40:40 +0000</FONT>
<BR><FONT SIZE=3D2>From: Matthew Wilcox &lt;willy@debian.org&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] menu not =
available</FONT>
<BR><FONT SIZE=3D2>To: Grant Grundler =
&lt;grundler@parisc-linux.org&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: &quot;Peralta, Joseph A&quot; =
&lt;jperalta@WPI.EDU&gt;,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;20040125224040.GG11844@parcelfarce.linux.theplanet.co.uk&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; charset=3Dus-ascii</FONT>
</P>

<P><FONT SIZE=3D2>On Fri, Jan 23, 2004 at 03:11:49PM -0700, Grant =
Grundler wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; On Fri, Jan 23, 2004 at 04:47:11PM -0500, =
Peralta, Joseph A wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; When I try to install certain X-window =
managers under Debian 3.0 I get</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &quot;xxx depends on menu (&gt;&gt; =
1.5)... menu is not available&quot; How would I fix</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; this?</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Dunno...menu is available for &quot;sarge&quot; =
(aka testing) and that</FONT>
<BR><FONT SIZE=3D2>&gt; works for me. Sounds like someone wants to =
backport to Woody.</FONT>
</P>

<P><FONT SIZE=3D2>menu is not available for woody because it's written =
in a language which</FONT>
<BR><FONT SIZE=3D2>bears a passing resemblance to C++.&nbsp; someone =
rewrote it in C++ for sarge.</FONT>
</P>

<P><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>&quot;Next the statesmen will invent cheap lies, =
putting the blame upon </FONT>
<BR><FONT SIZE=3D2>the nation that is attacked, and every man will be =
glad of those</FONT>
<BR><FONT SIZE=3D2>conscience-soothing falsities, and will diligently =
study them, and refuse</FONT>
<BR><FONT SIZE=3D2>to examine any refutations of them; and thus he will =
by and by convince </FONT>
<BR><FONT SIZE=3D2>himself that the war is just, and will thank God for =
the better sleep </FONT>
<BR><FONT SIZE=3D2>he enjoys after this process of grotesque =
self-deception.&quot; -- Mark Twain</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 2</FONT>
<BR><FONT SIZE=3D2>Date: Sun, 25 Jan 2004 19:13:47 -0500 (EST)</FONT>
<BR><FONT SIZE=3D2>From: &quot;John David Anglin&quot; =
&lt;dave@hiauly1.hia.nrc.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: Re: [parisc-linux] missing barrier in =
_raw_spin_lock?</FONT>
<BR><FONT SIZE=3D2>To: arndb@onlinehome.de</FONT>
<BR><FONT SIZE=3D2>Cc: grundler@parisc-linux.org, arnd@arndb.de,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux@parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;200401260013.i0Q0Dltk013819@hiauly1.hia.nrc.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; charset=3DUS-ASCII</FONT>
</P>

<P><FONT SIZE=3D2>&gt; &gt; #define __ldcw(a) ({ \</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&nbsp;&nbsp; unsigned int =
__ret;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; \</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&nbsp;&nbsp; __asm__ =
__volatile__(&quot;ldcw =
0(%2),%0&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
\</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &quot;=3Dr&quot; (__ret), =
&quot;=3Dm&quot; (*(a)) : &quot;r&quot; =
(a));&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
\</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&nbsp;&nbsp; =
__ret;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; \</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; })</FONT>
</P>

<P><FONT SIZE=3D2>&gt; I suppose the memory operand specification is =
required here. Newer </FONT>
<BR><FONT SIZE=3D2>&gt; compilers (especially gcc-3.4) can optimize =
away local variables if you </FONT>
<BR><FONT SIZE=3D2>&gt; only access the address but not the contents. I =
think even your </FONT>
<BR><FONT SIZE=3D2>&gt; pthreads version is not really correct, because =
it specifies (*(a)) as</FONT>
<BR><FONT SIZE=3D2>&gt; output only instead of inout.</FONT>
</P>

<P><FONT SIZE=3D2>I agree.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; No, putting the barrier into __ldcw is wrong =
because it would impact all</FONT>
<BR><FONT SIZE=3D2>&gt; other uses of __ldcw that don't need the =
barrier. AFAICS, the </FONT>
</P>

<P><FONT SIZE=3D2>The only other uses for __ldcw are the SPIN_LOCK =
macro in atomic.h</FONT>
<BR><FONT SIZE=3D2>and the _raw_spin_trylock in spinlock.h (i.e., it is =
only used</FONT>
<BR><FONT SIZE=3D2>acquire locks).&nbsp; If all these need barriers, =
then it might as well</FONT>
<BR><FONT SIZE=3D2>be in __ldcw.</FONT>
</P>

<P><FONT SIZE=3D2>Dave</FONT>
<BR><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>J. David =
Anglin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dave.anglin@nrc-cnrc.gc.ca</FONT>
<BR><FONT SIZE=3D2>National Research Council of =
Canada&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; (613) 990-0752 (FAX: 952-6602)</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 3</FONT>
<BR><FONT SIZE=3D2>Date: Sun, 25 Jan 2004 21:15:09 -0500</FONT>
<BR><FONT SIZE=3D2>From: Carlos O'Donell =
&lt;carlos@baldric.uwo.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] kernel BUG at =
mm/shmem.c:585!</FONT>
<BR><FONT SIZE=3D2>To: John David Anglin =
&lt;dave@hiauly1.hia.nrc.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: grundler@parisc-linux.org, =
parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;20040126021508.GZ1060@baldric.uwo.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; charset=3Dus-ascii</FONT>
</P>

<P><FONT SIZE=3D2>On Fri, Jan 23, 2004 at 02:40:27PM -0500, John David =
Anglin wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; It appears non-fatal, and I want to blame =
the compiler :)</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I agree but the proof is in the pudding =
;-)</FONT>
</P>

<P><FONT SIZE=3D2>I told Grant, that at my current schedule, it would =
be 2006 </FONT>
<BR><FONT SIZE=3D2>before I fixed this problem :)</FONT>
</P>

<P><FONT SIZE=3D2>It looks like a reordering issue, perhaps taking a =
look at the</FONT>
<BR><FONT SIZE=3D2>respective .o objects produced by the two compilers =
might reveal the</FONT>
<BR><FONT SIZE=3D2>issue. I think that's the way we did it when the tty =
layer broke and we</FONT>
<BR><FONT SIZE=3D2>had to have that console.o compiled with 3.0.4 by =
hand? I think Randolph</FONT>
<BR><FONT SIZE=3D2>and Grant worked on that together. I might have the =
wrong names, but</FONT>
<BR><FONT SIZE=3D2>we've successfully debugged a problem like this =
before using similar</FONT>
<BR><FONT SIZE=3D2>methods.</FONT>
</P>

<P><FONT SIZE=3D2>c.</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 4</FONT>
<BR><FONT SIZE=3D2>Date: Sun, 25 Jan 2004 21:35:07 -0500 (EST)</FONT>
<BR><FONT SIZE=3D2>From: &quot;John David Anglin&quot; =
&lt;dave@hiauly1.hia.nrc.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] kernel BUG at =
mm/shmem.c:585!</FONT>
<BR><FONT SIZE=3D2>To: carlos@baldric.uwo.ca (Carlos O'Donell)</FONT>
<BR><FONT SIZE=3D2>Cc: grundler@parisc-linux.org, =
parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;200401260235.i0Q2Z783024373@hiauly1.hia.nrc.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; charset=3DUS-ASCII</FONT>
</P>

<P><FONT SIZE=3D2>&gt; On Fri, Jan 23, 2004 at 02:40:27PM -0500, John =
David Anglin wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; It appears non-fatal, and I want to =
blame the compiler :)</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; I agree but the proof is in the pudding =
;-)</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I told Grant, that at my current schedule, it =
would be 2006 </FONT>
<BR><FONT SIZE=3D2>&gt; before I fixed this problem :)</FONT>
</P>

<P><FONT SIZE=3D2>My schedule isn't much better.&nbsp; I'm off to Tokyo =
at the end of the week</FONT>
<BR><FONT SIZE=3D2>to waive the Canadian flag at the ISO LRG meetin =
next week.&nbsp; After that,</FONT>
<BR><FONT SIZE=3D2>my brother's company would like me to work on more =
firmware for a new</FONT>
<BR><FONT SIZE=3D2>project.</FONT>
</P>

<P><FONT SIZE=3D2>Is this on a SMP kernel (i.e., could this be a =
locking issue)?</FONT>
</P>

<P><FONT SIZE=3D2>Dave</FONT>
<BR><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>J. David =
Anglin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dave.anglin@nrc-cnrc.gc.ca</FONT>
<BR><FONT SIZE=3D2>National Research Council of =
Canada&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; (613) 990-0752 (FAX: 952-6602)</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 5</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 11:54:13 +0100</FONT>
<BR><FONT SIZE=3D2>From: &quot;Reinhold Flecke CCF&quot; =
&lt;reinhold.flecke@ccf-consulting.de&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: [parisc-linux] installation failed on C240 =
(fx4) workstation</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<BR><FONT SIZE=3D2>To: =
&lt;parisc-linux@lists.parisc-linux.org&gt;</FONT>
<BR><FONT SIZE=3D2>Message-ID:</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&lt;LBEMKLBEFDGDOGGAOGIKAEJPCCAA.reinhold.flecke@ccf-consulting=
de&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; =
charset=3D&quot;iso-8859-1&quot;</FONT>
</P>

<P><FONT SIZE=3D2>I downloaded the =
&quot;debian-30r2-hppa-binary-1.iso&quot; and burned it to CD. </FONT>
<BR><FONT SIZE=3D2>If I start the installation on my C240 (fx4) =
workstation&nbsp; with the command:</FONT>
<BR><FONT SIZE=3D2>bo sescsi.2.0</FONT>
</P>

<P><FONT SIZE=3D2>it seems everything ok, until I get the =
message:</FONT>
<BR><FONT SIZE=3D2>...If this is the last message you see, you may need =
to switch your console.</FONT>
<BR><FONT SIZE=3D2>&nbsp; This is a common sympton sarch the FAQ and =
mailing list at</FONT>
<BR><FONT SIZE=3D2>parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>After this nothing happens anymore.</FONT>
<BR><FONT SIZE=3D2>I searched the FAQ and mailing list but I could not =
find a solution.</FONT>
<BR><FONT SIZE=3D2>Anyone who can help?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks in advance.</FONT>
</P>

<P><FONT SIZE=3D2>Best Regards</FONT>
<BR><FONT SIZE=3D2>Reinhold Flecke</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Reinhold Flecke CCF</FONT>
<BR><FONT SIZE=3D2>Fon:&nbsp;&nbsp;&nbsp; +49 (0)5292 930601 =
(Office)</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>+49 =
(0)700 93000093 (PR)</FONT>
<BR><FONT SIZE=3D2>eMail:&nbsp; &lt;<A =
HREF=3D"mailto:Reinhold.Flecke@ccf-consulting.de">mailto:Reinhold.Flecke=
@ccf-consulting.de</A>&gt;</FONT>
</P>

<P><FONT SIZE=3D2>-------------- next part --------------</FONT>
<BR><FONT SIZE=3D2>A non-text attachment was scrubbed...</FONT>
<BR><FONT SIZE=3D2>Name: winmail.dat</FONT>
<BR><FONT SIZE=3D2>Type: application/ms-tnef</FONT>
<BR><FONT SIZE=3D2>Size: 2008 bytes</FONT>
<BR><FONT SIZE=3D2>Desc: not available</FONT>
<BR><FONT SIZE=3D2>Url : <A =
HREF=3D"http://lists.parisc-linux.org/pipermail/parisc-linux/attachments=
/20040126/13277935/winmail-0001.bin" =
TARGET=3D"_blank">http://lists.parisc-linux.org/pipermail/parisc-linux/a=
ttachments/20040126/13277935/winmail-0001.bin</A></FONT>
</P>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 6</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 12:13:22 +0100</FONT>
<BR><FONT SIZE=3D2>From: &quot;Reinhold Flecke CCF&quot; =
&lt;reinhold.flecke@ccf-consulting.de&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: [parisc-linux] help installation failed on =
C240 (fx4)</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>workstation</FONT>
<BR><FONT SIZE=3D2>To: =
&lt;parisc-linux@lists.parisc-linux.org&gt;</FONT>
<BR><FONT SIZE=3D2>Message-ID:</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&lt;LBEMKLBEFDGDOGGAOGIKOEJPCCAA.reinhold.flecke@ccf-consulting=
de&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; =
charset=3D&quot;iso-8859-1&quot;</FONT>
</P>

<P><FONT SIZE=3D2>I downloaded the =
&quot;debian-30r2-hppa-binary-1.iso&quot; and burned it to CD. </FONT>
<BR><FONT SIZE=3D2>If I start the installation on my C240 (fx4) =
workstation&nbsp; with the command:</FONT>
<BR><FONT SIZE=3D2>bo sescsi.2.0</FONT>
</P>

<P><FONT SIZE=3D2>it seems everything ok, until I get the =
message:</FONT>
<BR><FONT SIZE=3D2>...If this is the last message you see, you may need =
to switch your console.</FONT>
<BR><FONT SIZE=3D2>&nbsp; This is a common sympton sarch the FAQ and =
mailing list at</FONT>
<BR><FONT SIZE=3D2>parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>After this nothing happens anymore.</FONT>
<BR><FONT SIZE=3D2>I searched the FAQ and mailing list but I could not =
find a solution.</FONT>
<BR><FONT SIZE=3D2>Anyone who can help?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks in advance.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Best Regards</FONT>
<BR><FONT SIZE=3D2>Reinhold Flecke</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Reinhold Flecke CCF</FONT>
<BR><FONT SIZE=3D2>Auf dem Anger 18</FONT>
<BR><FONT SIZE=3D2>33165 Lichtenau-Husen</FONT>
<BR><FONT SIZE=3D2>Fon:&nbsp;&nbsp;&nbsp; +49 (0)5292 930601 =
(Office)</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>+49 =
(0)700 93000093 (PR)</FONT>
<BR><FONT SIZE=3D2>eMail:&nbsp; &lt;<A =
HREF=3D"mailto:Reinhold.Flecke@ccf-consulting.de">mailto:Reinhold.Flecke=
@ccf-consulting.de</A>&gt;</FONT>
</P>

<P><FONT SIZE=3D2>-------------- next part --------------</FONT>
<BR><FONT SIZE=3D2>A non-text attachment was scrubbed...</FONT>
<BR><FONT SIZE=3D2>Name: winmail.dat</FONT>
<BR><FONT SIZE=3D2>Type: application/ms-tnef</FONT>
<BR><FONT SIZE=3D2>Size: 2056 bytes</FONT>
<BR><FONT SIZE=3D2>Desc: not available</FONT>
<BR><FONT SIZE=3D2>Url : <A =
HREF=3D"http://lists.parisc-linux.org/pipermail/parisc-linux/attachments=
/20040126/902d4aa3/winmail-0001.bin" =
TARGET=3D"_blank">http://lists.parisc-linux.org/pipermail/parisc-linux/a=
ttachments/20040126/902d4aa3/winmail-0001.bin</A></FONT>
</P>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 7</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 08:53:56 -0700</FONT>
<BR><FONT SIZE=3D2>From: Grant Grundler =
&lt;grundler@parisc-linux.org&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] kernel BUG at =
mm/shmem.c:585!</FONT>
<BR><FONT SIZE=3D2>To: John David Anglin =
&lt;dave@hiauly1.hia.nrc.ca&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: Carlos O'Donell =
&lt;carlos@baldric.uwo.ca&gt;,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;20040126155356.GA12175@colo.lackof.org&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; charset=3Dus-ascii</FONT>
</P>

<P><FONT SIZE=3D2>On Sun, Jan 25, 2004 at 09:35:07PM -0500, John David =
Anglin wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; Is this on a SMP kernel (i.e., could this be a =
locking issue)?</FONT>
</P>

<P><FONT SIZE=3D2>no. I don't build or run SMP kernels on anything at =
the moment.</FONT>
</P>

<P><FONT SIZE=3D2>thanks,</FONT>
<BR><FONT SIZE=3D2>grant</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 8</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 09:13:16 -0700</FONT>
<BR><FONT SIZE=3D2>From: Grant Grundler =
&lt;grundler@parisc-linux.org&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] help installation failed =
on C240 (fx4)</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>workstation</FONT>
<BR><FONT SIZE=3D2>To: Reinhold Flecke CCF =
&lt;reinhold.flecke@ccf-consulting.de&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;20040126161316.GC12175@colo.lackof.org&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; charset=3Dus-ascii</FONT>
</P>

<P><FONT SIZE=3D2>On Mon, Jan 26, 2004 at 12:13:22PM +0100, Reinhold =
Flecke CCF wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; I downloaded the =
&quot;debian-30r2-hppa-binary-1.iso&quot; and burned it to CD. </FONT>
<BR><FONT SIZE=3D2>&gt; If I start the installation on my C240 (fx4) =
workstation&nbsp; with the command:</FONT>
<BR><FONT SIZE=3D2>&gt; bo sescsi.2.0</FONT>
</P>

<P><FONT SIZE=3D2>FX-4 graphics is not supported.</FONT>
<BR><FONT SIZE=3D2>Either use serial console or replace the FX4 with =
PCI FX-E.</FONT>
</P>

<P><FONT SIZE=3D2>sorry,</FONT>
<BR><FONT SIZE=3D2>grant</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 9</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 18:00:53 +0100</FONT>
<BR><FONT SIZE=3D2>From: &quot;Joel Soete&quot; =
&lt;soete.joel@tiscali.be&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: [parisc-linux] A fix for B2k and =
CONFIG_PDC_CONSOLE pb</FONT>
<BR><FONT SIZE=3D2>To: &quot;Grant Grundler&quot; =
&lt;grundler@parisc-linux.org&gt;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;Christoph Plattner&quot;</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&lt;christoph.plattner@gmx.at&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;400CB8A100004C60@ocpmta3.freegates.net&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; =
charset=3D&quot;iso-8859-1&quot;</FONT>
</P>

<P><FONT SIZE=3D2>Hi Grant, Christoph,</FONT>
</P>

<P><FONT SIZE=3D2>I find a fix for this pb. I tested successfully (I =
reach to login with a</FONT>
<BR><FONT SIZE=3D2>ttyB0 after replacing ttyS0 in inittab and telinit q =
:) ) on a 32bit 2.4</FONT>
<BR><FONT SIZE=3D2>kernel on my b2k and a 64bit (up) [also 2.4] kernel =
on my N4k.</FONT>
</P>

<P><FONT SIZE=3D2>Here is its main part:</FONT>
<BR><FONT SIZE=3D2>diff -NaurX dontdiff =
linux-2.4.24-pa0.orig/arch/parisc/kernel/firmware.c</FONT>
<BR><FONT =
SIZE=3D2>linux-2.4.24-pa0/arch/parisc/kernel/firmware.c</FONT>
<BR><FONT SIZE=3D2>--- =
linux-2.4.24-pa0.orig/arch/parisc/kernel/firmware.c 2003-10-02 =
07:30:55.000000000</FONT>
<BR><FONT SIZE=3D2>+0200</FONT>
<BR><FONT SIZE=3D2>+++ =
linux-2.4.24-pa0/arch/parisc/kernel/firmware.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 2004-01-26 16:48:23.000000000</FONT>
<BR><FONT SIZE=3D2>+0100</FONT>
<BR><FONT SIZE=3D2>@@ -871,15 +937,21 @@</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int =
status;</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bail =
if no console input device. */</FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(!PAGE0-&gt;mem_kbd.iodc_io)</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
((PAGE0-&gt;mem_cons.cl_class !=3D CL_DUPLEX) &amp;&amp; =
!PAGE0-&gt;mem_kbd.iodc_io)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* wait =
for a keyboard (rs232)-input */</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
spin_lock_irqsave(&amp;pdc_lock, flags);</FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
real32_call(PAGE0-&gt;mem_kbd.iodc_io,</FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; (unsigned =
long)PAGE0-&gt;mem_kbd.hpa, ENTRY_IO_CIN,</FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
PAGE0-&gt;mem_kbd.spa, __pa(PAGE0-&gt;mem_kbd.dp.layers), </FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(PAGE0-&gt;mem_cons.cl_class =3D=3D CL_DUPLEX)</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
real32_call(PAGE0-&gt;mem_cons.iodc_io,</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; (unsigned =
long)PAGE0-&gt;mem_cons.hpa, ENTRY_IO_CIN,</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
PAGE0-&gt;mem_cons.spa, __pa(PAGE0-&gt;mem_cons.dp.layers), </FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
real32_call(PAGE0-&gt;mem_kbd.iodc_io,</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; (unsigned =
long)PAGE0-&gt;mem_kbd.hpa, ENTRY_IO_CIN,</FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
PAGE0-&gt;mem_kbd.spa, __pa(PAGE0-&gt;mem_kbd.dp.layers), </FONT>
<BR><FONT SIZE=3D2>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ch =3D =
*iodc_dbuf;</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =
=3D *iodc_retbuf;</FONT>
<BR><FONT SIZE=3D2>diff -NaurX dontdiff =
linux-2.4.24-pa0.orig/arch/parisc/kernel/pdc_cons.c</FONT>
<BR><FONT =
SIZE=3D2>linux-2.4.24-pa0/arch/parisc/kernel/pdc_cons.c</FONT>
<BR><FONT SIZE=3D2>--- =
linux-2.4.24-pa0.orig/arch/parisc/kernel/pdc_cons.c 2004-01-19 =
07:25:46.000000000</FONT>
<BR><FONT SIZE=3D2>+0100</FONT>
<BR><FONT SIZE=3D2>+++ =
linux-2.4.24-pa0/arch/parisc/kernel/pdc_cons.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 2004-01-26 16:53:32.000000000</FONT>
<BR><FONT SIZE=3D2>+0100</FONT>
<BR><FONT SIZE=3D2>@@ -113,10 +112,6 @@</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
++pdc_console_initialized;</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If the =
console is duplex then copy the COUT parameters to CIN. */</FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(PAGE0-&gt;mem_cons.cl_class =3D=3D CL_DUPLEX)</FONT>
<BR><FONT SIZE=3D2>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
memcpy(&amp;PAGE0-&gt;mem_kbd, &amp;PAGE0-&gt;mem_cons, =
sizeof(PAGE0-&gt;mem_cons));</FONT>
<BR><FONT SIZE=3D2>-</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
register the pdc console */</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
register_console(&amp;pdc_cons);</FONT>
<BR><FONT SIZE=3D2>&nbsp;}</FONT>
<BR><FONT =
SIZE=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;&lt;=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</FONT>
</P>

<P><FONT SIZE=3D2>Can somebody else could also test it on some other =
platform to be sure I</FONT>
<BR><FONT SIZE=3D2>don't broken other stuff?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks in advance,</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; Joel</FONT>
</P>

<P><FONT SIZE=3D2>PS: Grant I join the text file of the final backport =
of 2.6 work included</FONT>
<BR><FONT SIZE=3D2>this patch. Thanks in advance for your =
attention</FONT>
</P>

<P><FONT =
SIZE=3D2>---------------------------------------------------------------=
----------</FONT>
<BR><FONT SIZE=3D2>Tiscali ADSL: 12 mois =E0 29,50 &#8364;/mois! =
L'Internet rapide, c'est pour tout</FONT>
<BR><FONT SIZE=3D2>le monde.</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"http://reg.tiscali.be/default.asp?lg=3Dfr" =
TARGET=3D"_blank">http://reg.tiscali.be/default.asp?lg=3Dfr</A></FONT>
</P>
<BR>

<P><FONT SIZE=3D2>-------------- next part --------------</FONT>
<BR><FONT SIZE=3D2>A non-text attachment was scrubbed...</FONT>
<BR><FONT SIZE=3D2>Name: pdc_console-bp+patch.diff</FONT>
<BR><FONT SIZE=3D2>Type: application/octet-stream</FONT>
<BR><FONT SIZE=3D2>Size: 23324 bytes</FONT>
<BR><FONT SIZE=3D2>Desc: not available</FONT>
<BR><FONT SIZE=3D2>Url : <A =
HREF=3D"http://lists.parisc-linux.org/pipermail/parisc-linux/attachments=
/20040126/67438867/pdc_console-bppatch.obj" =
TARGET=3D"_blank">http://lists.parisc-linux.org/pipermail/parisc-linux/a=
ttachments/20040126/67438867/pdc_console-bppatch.obj</A></FONT>
</P>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT =
SIZE=3D2>_______________________________________________</FONT>
<BR><FONT SIZE=3D2>parisc-linux mailing list</FONT>
<BR><FONT SIZE=3D2>parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"http://lists.parisc-linux.org/mailman/listinfo/parisc-linux" =
TARGET=3D"_blank">http://lists.parisc-linux.org/mailman/listinfo/parisc-=
linux</A></FONT>
</P>
<BR>

<P><FONT SIZE=3D2>End of parisc-linux Digest, Vol 2, Issue 32</FONT>
<BR><FONT SIZE=3D2>*******************************************</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_003_01C3E42E.16DEE200--
