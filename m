Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12501.mail.yahoo.com (web12501.mail.yahoo.com [216.136.173.193])
	by dsl2.external.hp.com (Postfix) with SMTP id 652114829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 18:53:54 -0700 (MST)
Message-ID: <20030310015353.95148.qmail@web12501.mail.yahoo.com>
Date: Sun, 9 Mar 2003 17:53:53 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <00A4E35DD053BF42A83513384737721604283785@noaadc-mxu12.noa.alcoa.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1036393159-1047261233=:94916"
Subject: [parisc-linux] trouble loading from netinst ISO on B2000
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

--0-1036393159-1047261233=:94916
Content-Type: text/plain; charset=us-ascii


Basically my B2000 with the A4977A PCI EG graphics card starts up and allows me to load all the way until making the system bootable.  Then I get an error saying PALO won't load and then dumps me all the way back to the "choose a language" screen.  It's so weird because the card and the disks hanging off of the card are out of my C360 and functioned great with it.  I think I will blow away the the LUN in the array that I'm using, format it and try again starting with the disk partitioning.  It does seem to want to use the EG graphics card though.  As a side note, I think it's cool that the front LCD screen tells me I'm running Linux and the current kernel revision.  Any ideas?
derek
 "Copeland, Daniel" <Daniel.Copeland@alcoa.com> wrote:Thanks. The latest netinst iso worked...

-----Original Message-----
From: Thibaut VARENE [mailto:varenet@esiee.fr]
Sent: Thursday, February 27, 2003 6:51 PM
To: Copeland, Daniel
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: question about pa-risc linux on hp b2600 workstation


On Thu, 27 Feb 2003 10:40:42 -0500
"Copeland, Daniel" wrote:

> Hello,
> 
> Did you have to get special usb drivers to be able to install? I
downloaded
> the debian v. 3.0 iso and it boots fine, I just can't acknowledge w/ my
> keyboard...

perhaps you should read the section related to b2600 on this page:
http://pateam.esiee.fr/list.html

the mailing-list archive:
http://www.fr.parisc-linux.org/mailing-lists/

eventually the FAQ (there's an entry about USB keyboards)
http://www.fr.parisc-linux.org/faq/

and the Boot HOWTO
http://pateam.esiee.fr/doc.html

everything is explained there.

you need one of the latest netinst isos to install your box:
http://pateam.esiee.fr/download.html

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

(mail CC'd to the m-l to feed the archive)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, and more
--0-1036393159-1047261233=:94916
Content-Type: text/html; charset=us-ascii

<P>Basically my B2000 with the A4977A PCI EG graphics card starts up and allows me to load all the way until making the system bootable.&nbsp; Then I get an error saying PALO won't load and then dumps me all the way back to the "choose a language" screen.&nbsp; It's so weird because the card and the disks hanging off of the card are out of my C360 and functioned great with it.&nbsp; I think I will blow away the the LUN in the array that I'm using, format it and try again starting with the disk partitioning.&nbsp; It does seem to want to use the EG graphics card though.&nbsp; As a side note, I think it's cool that the front LCD screen tells me I'm running Linux and the current kernel revision.&nbsp; Any ideas?
<P>derek
<P>&nbsp;<B><I>"Copeland, Daniel" &lt;Daniel.Copeland@alcoa.com&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">Thanks. The latest netinst iso worked...<BR><BR>-----Original Message-----<BR>From: Thibaut VARENE [mailto:varenet@esiee.fr]<BR>Sent: Thursday, February 27, 2003 6:51 PM<BR>To: Copeland, Daniel<BR>Cc: parisc-linux@lists.parisc-linux.org<BR>Subject: Re: question about pa-risc linux on hp b2600 workstation<BR><BR><BR>On Thu, 27 Feb 2003 10:40:42 -0500<BR>"Copeland, Daniel" <DANIEL.COPELAND@ALCOA.COM>wrote:<BR><BR>&gt; Hello,<BR>&gt; <BR>&gt; Did you have to get special usb drivers to be able to install? I<BR>downloaded<BR>&gt; the debian v. 3.0 iso and it boots fine, I just can't acknowledge w/ my<BR>&gt; keyboard...<BR><BR>perhaps you should read the section related to b2600 on this page:<BR>http://pateam.esiee.fr/list.html<BR><BR>the mailing-list archive:<BR>http://www.fr.parisc-linux.org/mailing-lists/<BR><BR>eventually the FAQ (there's an entry about USB keyboards)<BR>http://www.fr.parisc-linux.org/faq/<BR><BR>and the Boot HOWTO<BR>http://pateam.esiee.fr/doc.html<BR><BR>everything is explained there.<BR><BR>you need one of the latest netinst isos to install your box:<BR>http://pateam.esiee.fr/download.html<BR><BR>HTH,<BR><BR><BR>Thibaut VARENE<BR>The PA/Linux ESIEE Team<BR>http://pateam.esiee.fr/<BR><BR>(mail CC'd to the m-l to feed the archive)<BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/finance/mailtagline/*http://taxes.yahoo.com/">Yahoo! Tax Center</a> - forms, calculators, tips, and more
--0-1036393159-1047261233=:94916--
