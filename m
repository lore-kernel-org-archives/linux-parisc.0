Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12501.mail.yahoo.com (web12501.mail.yahoo.com [216.136.173.193])
	by dsl2.external.hp.com (Postfix) with SMTP id 60CA54872
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Nov 2002 08:56:47 -0700 (MST)
Message-ID: <20021127155642.49054.qmail@web12501.mail.yahoo.com>
Date: Wed, 27 Nov 2002 07:56:42 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Dual Video Cards?
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021127104008.GB11322@aurinko.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2046837841-1038412602=:48983"
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

--0-2046837841-1038412602=:48983
Content-Type: text/plain; charset=us-ascii


Well that's going to be my exact setup...I have one PCI EG card on the way and it came with a GSC EG card that I'm using now.  This machine dual boots HPUX and Linux of a Model 12 Autoraid with 2 LUNS on it.  I guess I'll get it working with HPUX first then tackle the Linux side.  I do have access to a serial console and that's how I got the original GSC graphics card configured to work.  Right now the GSC card is the default console and it works fine.  I found it interesting that the new palinux-2.4.19-pa24-PDC-20021106-netinst.iso doesn't exhibit the long bus walk times that I've been hearing about unless I have my kernal versions confused.  Like others here I, my network won't hook up to the switch at 100FD only 10FD.  The more interesting thing is that it hooks up at 100FD during the install phase of Linux for the netinst CD, but not after it's running on it's own kernal.  I do believe someone wrote a patch for this though.
derek
 Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com> wrote:On Mon, Nov 25, 2002 at 08:09:20PM -0800, ext Derek Engelhaupt wrote:

> Anyone running dual displays on a C Class? And if so how? I 
> understand it needs two video cards or one card with dual output. 
> Thanks.....

Well, I have both a VIS-EG/PCI and a VIS-EG/GSC in a C360, but it's 
running HP-UX and not Linux. 

Hardware-wise it isn't a problem, even though the GSC card isn't 
officially supported in a C360. You might want to check the boot 
consols config though, diagnosing display problems with that during boot 
isn't fun without a serial console. And if you want to have a graphics 
console, do mind the slot designations ... I wouldn't try to make the GSC 
card the console in the C360, for example.

Don't know how you'd go about configuring those in Linux though. In HP-UX 
it's rather simple but that doesn't help much...


-- 
Mikko Nahkola 
Tre-IN sysadmin 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-2046837841-1038412602=:48983
Content-Type: text/html; charset=us-ascii

<P>Well that's going to be my exact setup...I have one PCI EG card on the way and it came with a GSC EG card that I'm using now.&nbsp; This machine dual boots HPUX and Linux of a Model 12 Autoraid with 2 LUNS on it.&nbsp; I guess I'll get it working with HPUX first then tackle the Linux side.&nbsp; I do have access to a serial console and that's how I got the original GSC graphics card configured to work.&nbsp; Right now the GSC card is the default console and it works fine.&nbsp; I found it interesting that the new palinux-2.4.19-pa24-PDC-20021106-netinst.iso doesn't exhibit the long bus walk times that I've been hearing about unless I have my kernal versions confused.&nbsp; Like others here I, my network won't hook up to the switch at 100FD only 10FD.&nbsp; The more interesting thing is that it hooks up at 100FD during the install phase of Linux for the netinst CD, but not after it's running on it's own kernal.&nbsp; I do believe someone wrote a patch for this though.
<P>derek
<P>&nbsp;<B><I>Nahkola Mikko &lt;mnahkola@trinms01.ntc.nokia.com&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">On Mon, Nov 25, 2002 at 08:09:20PM -0800, ext Derek Engelhaupt wrote:<BR><BR>&gt; Anyone running dual displays on a C Class? And if so how? I <BR>&gt; understand it needs two video cards or one card with dual output. <BR>&gt; Thanks.....<BR><BR>Well, I have both a VIS-EG/PCI and a VIS-EG/GSC in a C360, but it's <BR>running HP-UX and not Linux. <BR><BR>Hardware-wise it isn't a problem, even though the GSC card isn't <BR>officially supported in a C360. You might want to check the boot <BR>consols config though, diagnosing display problems with that during boot <BR>isn't fun without a serial console. And if you want to have a graphics <BR>console, do mind the slot designations ... I wouldn't try to make the GSC <BR>card the console in the C360, for example.<BR><BR>Don't know how you'd go about configuring those in Linux though. In HP-UX <BR>it's rather simple but that doesn't help much...<BR><BR><BR>-- <BR>Mikko Nahkola <MIKKO.NAHKOLA@NOKIA.COM><BR>Tre-IN sysadmin <MNAHKOLA@TREIN.NTC.NOKIA.COM><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-2046837841-1038412602=:48983--
