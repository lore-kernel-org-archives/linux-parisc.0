Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12502.mail.yahoo.com (web12502.mail.yahoo.com [216.136.173.194])
	by dsl2.external.hp.com (Postfix) with SMTP id CC743482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 07:47:50 -0700 (MST)
Message-ID: <20021125144746.76741.qmail@web12502.mail.yahoo.com>
Date: Mon, 25 Nov 2002 06:47:46 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: RE: [parisc-linux] Disk problems
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <02Nov25.113607cet.119049@ns.hiscom.nl>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-592852036-1038235666=:76312"
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

--0-592852036-1038235666=:76312
Content-Type: text/plain; charset=us-ascii


I had a 712/100 at work that we (ok I) modified to take 2 internal disks and it ran well even though it got extremely hot inside since the 712 wasn't designed for efficiant cooling.  I was using 2 C2490s in it, but quit doing so because of the heat and also moved one of the disks to an external chassis.  The mod was done by using the internal SCSI cable of a 715 and removing the floppy drive.  Not a recommended solution, but the 712 power supply seemed to be able to keep up.
 "Beerse,_Corné" <c.beerse@torex-hiscom.nl> wrote:
> -----Original Message----- 
> From: James Smith [mailto:james@compusmithllc.com] 
> I just got a pile of 712/60's - $80 for 10 of em :) 

I got mine (1 and a half) for free ;-) 

> i've set one up & now i'm going through the disks one at a time & 
> cloning them as its quicker than going through the install each time 
> i've hit one disk that gives me this whenever i try to fdisk it 
> 
> sixty:~# fdisk /dev/sdb 
> 
> Unable to read /dev/sdb 
> 
> 
> when i tried to zero the disk, i got this.... 
> 
> sixty:~# dd if=/dev/zero of=/dev/sdb count=1 bs=512 
> dd: writing `/dev/sdb': Input/output error 
> 1+0 records in 
> 0+0 records out 

So you cannot read and cannot write to it. 

> 
> the console sees the disk when i use search 
> 
> does this indicate a dead disk? 
> 
> the disk was ok until i put it into a mac...... 

What where the results on the mac? Can you clone the disks using a mac? If so, what are the results? 

My experience: the 712 I have at home was my workhorse for over 5 years. It never failed on me. Occasional reboots for obvious reasons never had any problems. However, after being down for a couple of weeks, the harddisk does not spin properly. It was reported with several of those older systems. The ioscan and other tools that only access the firmware of the drive report no problems. Actual access of the disk is a problem since (in my case) the disk does not spin at all.

 

****This is exactly why we as HP techs don't shutdown any external disks while trouble shooting unless absolutely necessary.  Disks failing to spin back up after being run for so long is a very comman occurance.  Usually its due to the disk being heat soaked after the system fans shut off.  Even though the disks stop producing heat after the power is off the fans stop cooling them.  The resulting heat soak can sometimes prevent the drive from spinning up.

****If you do have access to an HPUX system, a diskinfo -v /dev/rdsk/cXtXdX command would probably be better to use than an ioscan.  If the diskinfo comes back with something like "cannot access," then the drive controller board is dead.  If it comes back with a response with Obytes for the drive size than it means the drive controller is working, but the drive has stopped spinning.

 

derek



---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-592852036-1038235666=:76312
Content-Type: text/html; charset=us-ascii

<P>I had a 712/100 at work that we (ok I) modified to take 2 internal disks and it ran well even though it got extremely hot inside since the 712 wasn't designed for efficiant cooling.&nbsp; I was using 2 C2490s in it, but quit doing so because of the heat and also moved one of the disks to an external chassis.&nbsp; The mod was done by using the internal SCSI cable of a 715 and removing the floppy drive.&nbsp; Not a recommended solution, but the 712 power supply seemed to be able to keep up.
<P>&nbsp;<B><I>"Beerse,_Corné" &lt;c.beerse@torex-hiscom.nl&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<META content="MS Exchange Server version 5.5.2654.45" name=Generator>
<P><FONT size=2>&gt; -----Original Message-----</FONT> <BR><FONT size=2>&gt; From: James Smith [<A href="mailto:james@compusmithllc.com">mailto:james@compusmithllc.com</A>]</FONT> <BR><FONT size=2>&gt; I just got a pile of 712/60's - $80 for 10 of em :)</FONT> </P>
<P><FONT size=2>I got mine (1 and a half) for free ;-)</FONT> </P>
<P><FONT size=2>&gt; i've set one up &amp; now i'm going through the disks one at a time &amp;</FONT> <BR><FONT size=2>&gt; cloning them as its quicker than going through the install each time</FONT> <BR><FONT size=2>&gt; i've hit one disk that gives me this whenever i try to fdisk it </FONT><BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; sixty:~# fdisk /dev/sdb</FONT> <BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; Unable to read /dev/sdb</FONT> <BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; when i tried to zero the disk, i got this....</FONT> <BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; sixty:~# dd if=/dev/zero of=/dev/sdb count=1 bs=512 </FONT><BR><FONT size=2>&gt; dd: writing `/dev/sdb': Input/output error</FONT> <BR><FONT size=2>&gt; 1+0 records in</FONT> <BR><FONT size=2>&gt; 0+0 records out</FONT> </P>
<P><FONT size=2>So you cannot read and cannot write to it.</FONT> </P>
<P><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; the console sees the disk when i use search </FONT><BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; does this indicate a dead disk?</FONT> <BR><FONT size=2>&gt; </FONT><BR><FONT size=2>&gt; the disk was ok until i put it into a mac......</FONT> </P>
<P><FONT size=2>What where the results on the mac? Can you clone the disks using a mac? If so, what are the results?</FONT> </P>
<P><FONT size=2>My experience: the 712 I have at home was my workhorse for over 5 years. It never failed on me. Occasional reboots for obvious reasons never had any problems. However, after being down for a couple of weeks, the harddisk does not spin properly. It was reported with several of those older systems. The ioscan and other tools that only access the firmware of the drive report no problems. Actual access of the disk is a problem since (in my case) the disk does not spin at all.</FONT></P>
<P>&nbsp;</P>
<P>****This is exactly why we as HP techs don't shutdown any external disks while trouble shooting unless absolutely necessary.&nbsp; Disks failing to spin back up after being run for so long is a very comman occurance.&nbsp; Usually its due to the disk being heat soaked after the system fans shut off.&nbsp; Even though the disks stop producing heat after the power is off the fans stop cooling them.&nbsp; The resulting heat soak can sometimes prevent the drive from spinning up.</P>
<P>****If you do have access to an HPUX system, a diskinfo -v /dev/rdsk/cXtXdX command would probably be better to use than an ioscan.&nbsp; If the diskinfo comes back with something like "cannot access," then the drive controller board is dead.&nbsp; If it comes back with a response with Obytes for the drive size than it means the drive controller is working, but the drive has stopped spinning.</P>
<P>&nbsp;</P>
<P>derek</P></BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-592852036-1038235666=:76312--
