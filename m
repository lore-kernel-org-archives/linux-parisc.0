Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12501.mail.yahoo.com (web12501.mail.yahoo.com [216.136.173.193])
	by dsl2.external.hp.com (Postfix) with SMTP id 405B44839
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 May 2003 10:15:34 -0600 (MDT)
Message-ID: <20030504161533.44634.qmail@web12501.mail.yahoo.com>
Date: Sun, 4 May 2003 09:15:33 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] {kinda OT] A4947A applicability? and FC driver work
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200305041008.49439.b.gunreben@web.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-177053345-1052064933=:44529"
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

--0-177053345-1052064933=:44529
Content-Type: text/plain; charset=us-ascii

You are also going to have a problem with the serial number, product number, and software ID on the board.  They have to be set in the EEPROM of the new board and only an HP engineer can program those item in the new board.  The program we use to set those items is not licensed to anyone, including channel partners that fix some of our workstations.  Without these items set the machine may complete selftest, but will not boot.  More than likely it will complain at the BCH about not having a valid serial number or SWID.  They are right about the power supply too, the C240 has a bigger power supply.  The I/O backplane on the C240 is WSE and not HVD like the C180.  I really think you would have problems trying to do this upgrade yourself.  The memory would transfer over even though the C200-C360 use a 50ns memory and the C110-C180 use 60ns memery. derek

Berthold Gunreben <b.gunreben@web.de> wrote:Am Sonntag, 4. Mai 2003 06:17 schrieb Matthew Wilcox:
> On Sat, May 03, 2003 at 07:54:57PM -0800, Tom wrote:
> > I found one of these kits on eBay - C200 to C240 upgrade, CPU on
> > mainboard. Do any of the HP techs around here know if it'll also fit a
> > C180? It'd be nice to drop a large performance upgrade into it for not
> > much cash...
>
> Well... it'll _fit_. Whether firmware will work properly is anyone's
> guess. There's various differences between the C180 and C200 that
> make this combination not sure to succeed. My personal opinion (and
> not speaking on behalf of my emplyer) is that it's going to work 90%.

I don´t think you will be very happy with it. One of the bigger problems will 
be your power supply. The C240 has a much stronger power supply (at least the 
one that I have) than the C180. 

> Maybe the onboard scsi controller won't be initialised properly.
> Maybe the missing bit of init won't make any difference to Linux or
> maybe it'll start corrupting data. It's a bit of a gamble.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

---------------------------------
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
--0-177053345-1052064933=:44529
Content-Type: text/html; charset=us-ascii

<DIV>You are also going to have a problem with the serial number, product number, and software ID on the board.&nbsp; They have to be set in the EEPROM of the new board and only an HP engineer can program those item in the new board.&nbsp; The program we use to set those items is not licensed to anyone, including channel partners that fix some of our workstations.&nbsp; Without these items set the machine may complete selftest, but will not boot.&nbsp; More than likely it will complain at the BCH about not having a valid serial number or SWID.&nbsp; They are right about the power supply too, the C240 has a bigger power supply.&nbsp; The I/O backplane on the C240 is WSE and not HVD like the C180.&nbsp; I really think you would have problems trying to do this upgrade yourself.&nbsp; The memory would transfer over even though the C200-C360 use a 50ns memory and the C110-C180 use 60ns memery.</DIV>
<DIV>&nbsp;</DIV>
<DIV>derek<BR><BR><B><I>Berthold Gunreben &lt;b.gunreben@web.de&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">Am Sonntag, 4. Mai 2003 06:17 schrieb Matthew Wilcox:<BR>&gt; On Sat, May 03, 2003 at 07:54:57PM -0800, Tom wrote:<BR>&gt; &gt; I found one of these kits on eBay - C200 to C240 upgrade, CPU on<BR>&gt; &gt; mainboard. Do any of the HP techs around here know if it'll also fit a<BR>&gt; &gt; C180? It'd be nice to drop a large performance upgrade into it for not<BR>&gt; &gt; much cash...<BR>&gt;<BR>&gt; Well... it'll _fit_. Whether firmware will work properly is anyone's<BR>&gt; guess. There's various differences between the C180 and C200 that<BR>&gt; make this combination not sure to succeed. My personal opinion (and<BR>&gt; not speaking on behalf of my emplyer) is that it's going to work 90%.<BR><BR>I don´t think you will be very happy with it. One of the bigger problems will <BR>be your power supply. The C240 has a much stronger power supply (at least the <BR>one that I have) than the C180. <BR><BR>&gt; Maybe the onboard scsi controller won't be initialised properly.<BR>&gt; Maybe the missing bit of init won't make any difference to Linux or<BR>&gt; maybe it'll start corrupting data. It's a bit of a gamble.<BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/search/mailsig/*http://search.yahoo.com">The New Yahoo! Search</a> - Faster. Easier. Bingo.
--0-177053345-1052064933=:44529--
