Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12506.mail.yahoo.com (web12506.mail.yahoo.com [216.136.173.198])
	by dsl2.external.hp.com (Postfix) with SMTP id 357B24829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 10:04:34 -0700 (MST)
Message-ID: <20030126170432.44906.qmail@web12506.mail.yahoo.com>
Date: Sun, 26 Jan 2003 09:04:32 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Boot warning 80F5.
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030126165854.42e05146.varenet@esiee.fr>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2142683236-1043600672=:44839"
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

--0-2142683236-1043600672=:44839
Content-Type: text/plain; charset=us-ascii


An "init -4" is basically saying that the machine couldn't find a boot sector on the drive you tried to boot from.  In the case of a hard drive it means the drive is dead or the BDRA is corrupted.  In the case of your CD, it could mean that it wasn't burned correctly or like Thibaut said it was the wrong image file.  Heck you could even have a dead CDROM.  Some of the older CDROMs won't read burned CDs.  Since the K100 is pretty old you may be having a problem reading burned CDs.  When I tried to load from a burned CD on my E55's caddy load CDROM it wouldn't boot.  I then loaded the CD into an external HP DVD and it booted just fine.  So then I put the HPUX CD in the old CDROM and it boots and loads just fine.
derek
 Thibaut VARENE <varenet@esiee.fr> wrote:On Sun, 26 Jan 2003 18:36:49 +0300
"Max" wrote:

> Hi,
> 
> I have HP 9000/809/k100. When my box boot from Debian 3.0r1 hppa CD
> ( Interact with IPL (Y or N)?> Y ), i've got message "Cannot find ENTRY
> TEST Status= -4" and WARN 80F5 on LCD panel status. What is that means?
> What do I do?
> Where can I find other WARN description ?
Read the PA/Linux boot HOWTO
http://pateam.esiee.fr/doc.html

and search the mailing-list for K-class PDC console issues
http://www.fr.parisc-linux.org/mailing-lists/

The message you see can be the result of several problems.

Most likely the kernel shipped with 3.0r1 doesn't support K's MUX.

You'll need a '-PDC-' image from
http://pateam.esiee.fr/cd-images/testing/

see http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017846.html


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-2142683236-1043600672=:44839
Content-Type: text/html; charset=us-ascii

<P>An "init -4" is basically saying that the machine couldn't find a boot sector on the drive you tried to boot from.&nbsp; In the case of a hard drive it means the drive is dead or the BDRA is corrupted.&nbsp; In the case of your CD, it could mean that it wasn't burned correctly or like Thibaut said it was the wrong image file.&nbsp; Heck you could even have a dead CDROM.&nbsp; Some of the older CDROMs won't read burned CDs.&nbsp; Since the K100 is pretty old you may be having a problem reading burned CDs.&nbsp; When I tried to load from a burned CD on my E55's caddy load CDROM it wouldn't boot.&nbsp; I then loaded the CD into an external HP DVD and it booted just fine.&nbsp; So then I put the HPUX CD in the old CDROM and it boots and loads just fine.
<P>derek
<P>&nbsp;<B><I>Thibaut VARENE &lt;<A href="mailto:varenet@esiee.fr">varenet@esiee.fr</A>&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">On Sun, 26 Jan 2003 18:36:49 +0300<BR>"Max" <MAX@AVTLG.RU>wrote:<BR><BR>&gt; Hi,<BR>&gt; <BR>&gt; I have HP 9000/809/k100. When my box boot from Debian 3.0r1 hppa CD<BR>&gt; ( Interact with IPL (Y or N)?&gt; Y ), i've got message "Cannot find ENTRY<BR>&gt; TEST Status= -4" and WARN 80F5 on LCD panel status. What is that means?<BR>&gt; What do I do?<BR>&gt; Where can I find other WARN description ?<BR>Read the PA/Linux boot HOWTO<BR><A href="http://pateam.esiee.fr/doc.html">http://pateam.esiee.fr/doc.html</A><BR><BR>and search the mailing-list for K-class PDC console issues<BR><A href="http://www.fr.parisc-linux.org/mailing-lists/">http://www.fr.parisc-linux.org/mailing-lists/</A><BR><BR>The message you see can be the result of several problems.<BR><BR>Most likely the kernel shipped with 3.0r1 doesn't support K's MUX.<BR><BR>You'll need a '-PDC-' image from<BR><A href="http://pateam.esiee.fr/cd-images/testing/">http://pateam.esiee.fr/cd-images/testing/</A><BR><BR>see <A href="http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017846.html">http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017846.html</A><BR><BR><BR>Thibaut VARENE<BR>The PA/Linux ESIEE Team<BR><A href="http://pateam.esiee.fr/">http://pateam.esiee.fr/</A><BR>_______________________________________________<BR>parisc-linux mailing list<BR><A href="mailto:parisc-linux@lists.parisc-linux.org">parisc-linux@lists.parisc-linux.org</A><BR><A href="http://lists.parisc-linux.org/mailman/listinfo/parisc-linux">http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</A></BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-2142683236-1043600672=:44839--
