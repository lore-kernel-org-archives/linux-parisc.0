Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12501.mail.yahoo.com (web12501.mail.yahoo.com [216.136.173.193])
	by dsl2.external.hp.com (Postfix) with SMTP id 3FC55482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Mar 2003 11:20:21 -0700 (MST)
Message-ID: <20030310182020.92986.qmail@web12501.mail.yahoo.com>
Date: Mon, 10 Mar 2003 10:20:20 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E68A24B000005A2@ocpmta6.freegates.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-449751268-1047320420=:92762"
Subject: [parisc-linux] Re: [parisc-linux]RESOLVED: trouble loading from netinst ISO on B2000
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

--0-449751268-1047320420=:92762
Content-Type: text/plain; charset=us-ascii


Sometimes I really amaze myself at how moronic I can be at times.  My problem with PALO was that I didn't set the /boot partition to f0 as the files system type during the disk partitioning.  Of course PALO didn't know what to do with that.  Duh.....I feel like an idiot....  
derek
 
Joel Soete <jsoe0708@tiscali.be> wrote:Hello Derek,

I also install a b2k with the help of a netinstall image (but a long time
ago :) ).

If I well understand your system is basically installed on your partitionned
disk (excepted that palo failled to completly install)?

Could you give us more details on those disk and its partitions?

By the way, in the install menu there is an option to 'execute a shell'
(IIRC).

Always IIRC, cfdisk should be install on your netinstall image and would
allow you to printout those details in the shell you just launch as above?

Before you exist this shell, can you still give us the content of palo.conf
installed on your disk?

Well, I do not yet test usb stuff on this b2k (as for the interanl gfx there
is not yet support I only use serial console) but IMHO there is no relation
with the failure of the palo install.

Joel


>-- Original Message --
>From: Derek Engelhaupt 
>Subject: Re: [parisc-linux] trouble loading from netinst ISO on B2000
>To: parisc-linux@lists.parisc-linux.org
>Date: Mon, 10 Mar 2003 07:15:59 -0800 (PST)
>
>
>
>Well all efforts have failed. I now tried to use an internal drive in
the
>B2000 totally bypassing the card and the array with the same results.
It
>still won't load PALO. The whole install goes well, but no PALO. Is there
>a newer version of PALO that isn't on the 2.4.20-32 release that I could
>try?
>derek
> Derek Engelhaupt wrote:
>Basically my B2000 with the A4977A PCI EG graphics card starts up and allows
>me to load all the way until making the system bootable. Then I get an
error
>saying PALO won't load and then dumps me all the way back to the "choose
>a language" screen. It's so weird because the card and the disks hanging
>off of the card are out of my C360 and functioned great with it. I think
>I will blow away the the LUN in the array that I'm using, format it and
try
>again starting with the disk partitioning. It does seem to want to use
the
>EG graphics card though. As a side note, I think it's cool that the front
>LCD screen tells me I'm running Linux and the current kernel revision.
Any
>ideas?
>derek
> "Copeland, Daniel" wrote: Thanks. The latest
>netinst iso worked...
>
>-----Original Message-----
>From: Thibaut VARENE [mailto:varenet@esiee.fr]
>Sent: Thursday, February 27, 2003 6:51 PM
>To: Copeland, Daniel
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: Re: question about pa-risc linux on hp b2600 workstation
>
>
>On Thu, 27 Feb 2003 10:40:42 -0500
>"Copeland, Daniel" wrote:
>
>> Hello,
>>
>> Did you have to get special usb drivers to be able to install? I
>downloaded
>> the debian v. 3.0 iso and it boots fine, I just can't acknowledge w/
my
>> keyboard...
>
>perhaps you should read the section related to b2600 on this page:
>http://pateam.esiee.fr/list.html
>
>the mailing-list archive:
>http://www.fr.parisc-linux.org/mailing-lists/
>
>eventually the FAQ (there's an entry about USB keyboards)
>http://www.fr.paris c-linux.org/faq/
>
>and the Boot HOWTO
>http://pateam.esiee.fr/doc.html
>
>everything is explained there.
>
>you need one of the latest netinst isos to install your box:
>http://pateam.esiee.fr/download.html
>
>HTH,
>
>
>Thibaut VARENE
>The PA/Linux ESIEE Team
>http://pateam.esiee.fr/
>
>(mail CC'd to the m-l to feed the archive)
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
>---------------------------------
>Do you Yahoo!?
>Yahoo! Tax Center - forms, calculators, tips, and more
>
>
>---------------------------------
>Do you Yahoo!?
>Yahoo! Tax Center - forms, calculators, tips, and more



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be




---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, and more
--0-449751268-1047320420=:92762
Content-Type: text/html; charset=us-ascii

<P><B><I>Sometimes I really amaze myself at how moronic I can be at times.&nbsp; My problem with PALO was that I didn't set the /boot partition to f0 as the files system type during the disk partitioning.&nbsp; Of course PALO didn't know what to do with that.&nbsp; Duh.....I feel like an idiot....&nbsp; </I></B>
<P><STRONG><EM>derek</EM></STRONG>
<P><B><I></I></B>&nbsp;
<P><B><I>Joel Soete &lt;jsoe0708@tiscali.be&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">Hello Derek,<BR><BR>I also install a b2k with the help of a netinstall image (but a long time<BR>ago :) ).<BR><BR>If I well understand your system is basically installed on your partitionned<BR>disk (excepted that palo failled to completly install)?<BR><BR>Could you give us more details on those disk and its partitions?<BR><BR>By the way, in the install menu there is an option to 'execute a shell'<BR>(IIRC).<BR><BR>Always IIRC, cfdisk should be install on your netinstall image and would<BR>allow you to printout those details in the shell you just launch as above?<BR><BR>Before you exist this shell, can you still give us the content of palo.conf<BR>installed on your disk?<BR><BR>Well, I do not yet test usb stuff on this b2k (as for the interanl gfx there<BR>is not yet support I only use serial console) but IMHO there is no relation<BR>with the failure of the palo install.<BR><BR>Joel<BR><BR><BR>&gt;-- Original Message --<BR>&gt;From: Derek Engelhaupt <DEREKENGELHAUPT@ROCKETMAIL.COM><BR>&gt;Subject: Re: [parisc-linux] trouble loading from netinst ISO on B2000<BR>&gt;To: parisc-linux@lists.parisc-linux.org<BR>&gt;Date: Mon, 10 Mar 2003 07:15:59 -0800 (PST)<BR>&gt;<BR>&gt;<BR>&gt;<BR>&gt;Well all efforts have failed. I now tried to use an internal drive in<BR>the<BR>&gt;B2000 totally bypassing the card and the array with the same results.<BR>It<BR>&gt;still won't load PALO. The whole install goes well, but no PALO. Is there<BR>&gt;a newer version of PALO that isn't on the 2.4.20-32 release that I could<BR>&gt;try?<BR>&gt;derek<BR>&gt; Derek Engelhaupt <DEREKENGELHAUPT@ROCKETMAIL.COM>wrote:<BR>&gt;Basically my B2000 with the A4977A PCI EG graphics card starts up and allows<BR>&gt;me to load all the way until making the system bootable. Then I get an<BR>error<BR>&gt;saying PALO won't load and then dumps me all the way back to the "choose<BR>&gt;a language" screen. It's so weird because the card and the disks hanging<BR>&gt;off of the card are out of my C360 and functioned great with it. I think<BR>&gt;I will blow away the the LUN in the array that I'm using, format it and<BR>try<BR>&gt;again starting with the disk partitioning. It does seem to want to use<BR>the<BR>&gt;EG graphics card though. As a side note, I think it's cool that the front<BR>&gt;LCD screen tells me I'm running Linux and the current kernel revision.<BR>Any<BR>&gt;ideas?<BR>&gt;derek<BR>&gt; "Copeland, Daniel" <DANIEL.COPELAND@ALCOA.COM>wrote: Thanks. The latest<BR>&gt;netinst iso worked...<BR>&gt;<BR>&gt;-----Original Message-----<BR>&gt;From: Thibaut VARENE [mailto:varenet@esiee.fr]<BR>&gt;Sent: Thursday, February 27, 2003 6:51 PM<BR>&gt;To: Copeland, Daniel<BR>&gt;Cc: parisc-linux@lists.parisc-linux.org<BR>&gt;Subject: Re: question about pa-risc linux on hp b2600 workstation<BR>&gt;<BR>&gt;<BR>&gt;On Thu, 27 Feb 2003 10:40:42 -0500<BR>&gt;"Copeland, Daniel" wrote:<BR>&gt;<BR>&gt;&gt; Hello,<BR>&gt;&gt;<BR>&gt;&gt; Did you have to get special usb drivers to be able to install? I<BR>&gt;downloaded<BR>&gt;&gt; the debian v. 3.0 iso and it boots fine, I just can't acknowledge w/<BR>my<BR>&gt;&gt; keyboard...<BR>&gt;<BR>&gt;perhaps you should read the section related to b2600 on this page:<BR>&gt;http://pateam.esiee.fr/list.html<BR>&gt;<BR>&gt;the mailing-list archive:<BR>&gt;http://www.fr.parisc-linux.org/mailing-lists/<BR>&gt;<BR>&gt;eventually the FAQ (there's an entry about USB keyboards)<BR>&gt;http://www.fr.paris c-linux.org/faq/<BR>&gt;<BR>&gt;and the Boot HOWTO<BR>&gt;http://pateam.esiee.fr/doc.html<BR>&gt;<BR>&gt;everything is explained there.<BR>&gt;<BR>&gt;you need one of the latest netinst isos to install your box:<BR>&gt;http://pateam.esiee.fr/download.html<BR>&gt;<BR>&gt;HTH,<BR>&gt;<BR>&gt;<BR>&gt;Thibaut VARENE<BR>&gt;The PA/Linux ESIEE Team<BR>&gt;http://pateam.esiee.fr/<BR>&gt;<BR>&gt;(mail CC'd to the m-l to feed the archive)<BR>&gt;_______________________________________________<BR>&gt;parisc-linux mailing list<BR>&gt;parisc-linux@lists.parisc-linux.org<BR>&gt;http://lists.parisc-linux.org/mailman/listinfo/parisc-linux<BR>&gt;<BR>&gt;<BR>&gt;---------------------------------<BR>&gt;Do you Yahoo!?<BR>&gt;Yahoo! Tax Center - forms, calculators, tips, and more<BR>&gt;<BR>&gt;<BR>&gt;---------------------------------<BR>&gt;Do you Yahoo!?<BR>&gt;Yahoo! Tax Center - forms, calculators, tips, and more<BR><BR><BR><BR>---------------------------------<BR>Vous surfez avec une ligne classique ?<BR>Faites des economies avec Tiscali Complete<BR>... Plus d'info sur http://complete.tiscali.be<BR><BR></BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/finance/mailtagline/*http://taxes.yahoo.com/">Yahoo! Tax Center</a> - forms, calculators, tips, and more
--0-449751268-1047320420=:92762--
