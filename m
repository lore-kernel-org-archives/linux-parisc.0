Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id BDC8B482E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Nov 2002 01:08:48 -0700 (MST)
Message-ID: <20021123080844.32770.qmail@web12507.mail.yahoo.com>
Date: Sat, 23 Nov 2002 00:08:44 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Tulip driver fails to advertise 100baseTx media capability
To: "M. Grabert" <xam@cs.ucc.ie>, Leif Harcke <lharcke@Stanford.EDU>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0211230437370.13058-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1724874002-1038038924=:31754"
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

--0-1724874002-1038038924=:31754
Content-Type: text/plain; charset=us-ascii


In HPUX there are "conf" files used to configure the cards during the software deamon start-ups.  There are different "conf" files for the different network cards.  These conf files control half or full duplex, mac address settings, and whether autonegotiation is on or off.
 
derek
 "M. Grabert" <xam@cs.ucc.ie> wrote:On Fri, 22 Nov 2002, Leif Harcke wrote:

> Just got Debian 3.0 (woody) booted on a C240. When the Tulip driver is
> initialized by the kernel, it fails to advertise the 100baseTx media
> capability of the DS21143 chip. I think this is a kernel issue, not a
> Debian or Tulip issue.

the same for me.
It happens one out of 30 time that I get a 100mbit connection.
Usually I just get 10mbit full duplex (this machine is connected to a
10/100 Switch (not Hub), and just other 100Mbit capable network devices
are attached to it.

> Setting the PDC/firmware (v. 6.3, latest for the C240) to force the
> 100/Full duplex rate at boot time doesn't fix the problem, nor does
> issuing an "ether=0,0,[11|14],eth0" to the kernel from the PALO kernel
> parameters line.

The same for me

> I think the way Tulip is called by the kernel somehow causes only 10baseT
> to be advertised. It's easy enough to correct after the fact with a
> simple "mii-tool -A" command, but it would be nicer if the media
> advertising was properly set by the kernel at boot time. See output of
> uname, dmesg, and mii-tool below.
>
> A thousand pardons if this is the wrong list for this bug. I'll re-post
> to the debian-hppa or the tulip list if people think those are the proper
> places.

I think it more a hardware related issue. The network card in the C240
is VERY picky about 100mbit negotiation.

Maybe you are able to force to switch it to 100mbit via software,
but I'm not sure.

See also http://www.unixnerd.demon.co.uk/hp_unix.html , the FAQ at
the bottom at the page.

greetings max

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-1724874002-1038038924=:31754
Content-Type: text/html; charset=us-ascii

<P>In HPUX there are "conf" files used to configure the cards during the software deamon start-ups.&nbsp; There are different "conf" files for the different network cards.&nbsp; These conf files control half or full duplex, mac address settings, and whether autonegotiation is on or off.
<P>&nbsp;
<P>derek
<P>&nbsp;<B><I>"M. Grabert" &lt;xam@cs.ucc.ie&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">On Fri, 22 Nov 2002, Leif Harcke wrote:<BR><BR>&gt; Just got Debian 3.0 (woody) booted on a C240. When the Tulip driver is<BR>&gt; initialized by the kernel, it fails to advertise the 100baseTx media<BR>&gt; capability of the DS21143 chip. I think this is a kernel issue, not a<BR>&gt; Debian or Tulip issue.<BR><BR>the same for me.<BR>It happens one out of 30 time that I get a 100mbit connection.<BR>Usually I just get 10mbit full duplex (this machine is connected to a<BR>10/100 Switch (not Hub), and just other 100Mbit capable network devices<BR>are attached to it.<BR><BR>&gt; Setting the PDC/firmware (v. 6.3, latest for the C240) to force the<BR>&gt; 100/Full duplex rate at boot time doesn't fix the problem, nor does<BR>&gt; issuing an "ether=0,0,[11|14],eth0" to the kernel from the PALO kernel<BR>&gt; parameters line.<BR><BR>The same for me<BR><BR>&gt; I think the way Tulip is called by the kernel somehow causes only 10baseT<BR>&gt; to be advertised. It's easy enough to correct after the fact with a<BR>&gt; simple "mii-tool -A" command, but it would be nicer if the media<BR>&gt; advertising was properly set by the kernel at boot time. See output of<BR>&gt; uname, dmesg, and mii-tool below.<BR>&gt;<BR>&gt; A thousand pardons if this is the wrong list for this bug. I'll re-post<BR>&gt; to the debian-hppa or the tulip list if people think those are the proper<BR>&gt; places.<BR><BR>I think it more a hardware related issue. The network card in the C240<BR>is VERY picky about 100mbit negotiation.<BR><BR>Maybe you are able to force to switch it to 100mbit via software,<BR>but I'm not sure.<BR><BR>See also http://www.unixnerd.demon.co.uk/hp_unix.html , the FAQ at<BR>the bottom at the page.<BR><BR>greetings max<BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-1724874002-1038038924=:31754--
