Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12508.mail.yahoo.com (web12508.mail.yahoo.com [216.136.173.200])
	by dsl2.external.hp.com (Postfix) with SMTP id CC822483D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 09:44:16 -0700 (MST)
Message-ID: <20030221164415.16374.qmail@web12508.mail.yahoo.com>
Date: Fri, 21 Feb 2003 08:44:15 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] boot console wrong.
To: Rod Smart <snaketails@optushome.com.au>,
	PARISC Linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3E56B2AC.DCC46120@optushome.com.au>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1952554905-1045845855=:13981"
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

--0-1952554905-1045845855=:13981
Content-Type: text/plain; charset=us-ascii


Slot 3 alone is single port.  Slot 3a would be port one of a dual monitor port card and slot 3b would be the second monitor port of that dual monitor port card.
derek
 Rod Smart <snaketails@optushome.com.au> wrote:Ok, my graphics card is installed in Slot 3, so whats the differance between
3a and 3b ??

> Possible paths are:
> GRAPHICS(0)
> GRAPHICS(1a)
> GRAPHICS(1b)
> GRAPHICS(2a)
> GRAPHICS(2b)
> GRAPHICS(3a)
> GRAPHICS(3b)
> GRAPHICS(4a)
> GRAPHICS(4b)
> PCI3
> PCI4
> SERIAL_1
> SERIAL_2
>
Nahkola Mikko wrote:

> On Fri, Feb 21, 2003 at 06:26:47AM -0900, ext Tom wrote:
> > > > On Fri, Feb 21, 2003 at 03:58:52AM +0000, ext Rod Smart wrote:
>
> > > > > Console path: SERIAL_1.9600.8.none
> > > > I have installed Debian through this console, and would like to play
> > > > with it the usual way now ;o)
>
> > > Um ... "path console graphics" could be a good starting point. It
> > > probably tells you that "graphics" isn't a good path and shows a list of
> > > what could be, but that's almost as good.
>
> > "path console graphics(0)" sets the console to the built-in video on my
> > C180; graphics(x) (where x is the slot number as printed on the back of
> > the case) sets it to the video card in that slot...
>
> Well ... yes. (I just had to set a B180L to mode 12 on graphics(0)
> manually from the serial console as that seems to be the only way to make
> it work with an A4033A with the usual 3-BNC cable.)
>
> Now that I think about it ... I probably had to use pci(4) or some such
> once on a C360 but then again that one didn't have a built-in adapter.
>
> Oh, and really, my Linux-running C240 still has the console on serial -
> _and_ X and a bunch of virtual terminals also available on the graphics
> card.
>
> --
> Mikko Nahkola 
> Tre-IN sysadmin 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, and more
--0-1952554905-1045845855=:13981
Content-Type: text/html; charset=us-ascii

<P>Slot 3 alone is single port.&nbsp; Slot 3a would be port one of a dual monitor port card and slot 3b would be the second monitor port of that dual monitor port card.
<P>derek
<P>&nbsp;<B><I>Rod Smart &lt;snaketails@optushome.com.au&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">Ok, my graphics card is installed in Slot 3, so whats the differance between<BR>3a and 3b ??<BR><BR>&gt; Possible paths are:<BR>&gt; GRAPHICS(0)<BR>&gt; GRAPHICS(1a)<BR>&gt; GRAPHICS(1b)<BR>&gt; GRAPHICS(2a)<BR>&gt; GRAPHICS(2b)<BR>&gt; GRAPHICS(3a)<BR>&gt; GRAPHICS(3b)<BR>&gt; GRAPHICS(4a)<BR>&gt; GRAPHICS(4b)<BR>&gt; PCI3<BR>&gt; PCI4<BR>&gt; SERIAL_1<BR>&gt; SERIAL_2<BR>&gt;<BR>Nahkola Mikko wrote:<BR><BR>&gt; On Fri, Feb 21, 2003 at 06:26:47AM -0900, ext Tom wrote:<BR>&gt; &gt; &gt; &gt; On Fri, Feb 21, 2003 at 03:58:52AM +0000, ext Rod Smart wrote:<BR>&gt;<BR>&gt; &gt; &gt; &gt; &gt; Console path: SERIAL_1.9600.8.none<BR>&gt; &gt; &gt; &gt; I have installed Debian through this console, and would like to play<BR>&gt; &gt; &gt; &gt; with it the usual way now ;o)<BR>&gt;<BR>&gt; &gt; &gt; Um ... "path console graphics" could be a good starting point. It<BR>&gt; &gt; &gt; probably tells you that "graphics" isn't a good path and shows a list of<BR>&gt; &gt; &gt; what could be, but that's almost as good.<BR>&gt;<BR>&gt; &gt; "path console graphics(0)" sets the console to the built-in video on my<BR>&gt; &gt; C180; graphics(x) (where x is the slot number as printed on the back of<BR>&gt; &gt; the case) sets it to the video card in that slot...<BR>&gt;<BR>&gt; Well ... yes. (I just had to set a B180L to mode 12 on graphics(0)<BR>&gt; manually from the serial console as that seems to be the only way to make<BR>&gt; it work with an A4033A with the usual 3-BNC cable.)<BR>&gt;<BR>&gt; Now that I think about it ... I probably had to use pci(4) or some such<BR>&gt; once on a C360 but then again that one didn't have a built-in adapter.<BR>&gt;<BR>&gt; Oh, and really, my Linux-running C240 still has the console on serial -<BR>&gt; _and_ X and a bunch of virtual terminals also available on the graphics<BR>&gt; card.<BR>&gt;<BR>&gt; --<BR>&gt; Mikko Nahkola <MIKKO.NAHKOLA@NOKIA.COM><BR>&gt; Tre-IN sysadmin <MNAHKOLA@TREIN.NTC.NOKIA.COM><BR>&gt; _______________________________________________<BR>&gt; parisc-linux mailing list<BR>&gt; parisc-linux@lists.parisc-linux.org<BR>&gt; http://lists.parisc-linux.org/mailman/listinfo/parisc-linux<BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/finance/mailtagline/*http://taxes.yahoo.com/">Yahoo! Tax Center</a> - forms, calculators, tips, and more
--0-1952554905-1045845855=:13981--
