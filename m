Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12501.mail.yahoo.com (web12501.mail.yahoo.com [216.136.173.193])
	by dsl2.external.hp.com (Postfix) with SMTP id 5ED64482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 18:52:42 -0700 (MST)
Message-ID: <20021123015234.15604.qmail@web12501.mail.yahoo.com>
Date: Fri, 22 Nov 2002 17:52:34 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Disk problems
To: James Smith <james@compusmithllc.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <1038000560.444.9.camel@seventy>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-296138104-1038016354=:15527"
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

--0-296138104-1038016354=:15527
Content-Type: text/plain; charset=us-ascii


Well quit putting them in those darn macs....just kidding.  Who makes the disk?  IBM has certain tools like their drive fitness tests that has saved me a few times.  Seagate and others probably have similar tools.  Check their support sites and it may just be a matter of the wrong block size written by your mac.  IBM drives are especially notorious for having weird block sizes and such.
derek
 James Smith <james@compusmithllc.com> wrote:I just got a pile of 712/60's - $80 for 10 of em :)


i've set one up & now i'm going through the disks one at a time &
cloning them as its quicker than going through the install each time


i've hit one disk that gives me this whenever i try to fdisk it 


sixty:~# fdisk /dev/sdb

Unable to read /dev/sdb


when i tried to zero the disk, i got this....

sixty:~# dd if=/dev/zero of=/dev/sdb count=1 bs=512 
dd: writing `/dev/sdb': Input/output error
1+0 records in
0+0 records out

the console sees the disk when i use search 

does this indicate a dead disk?

the disk was ok until i put it into a mac......

James S



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-296138104-1038016354=:15527
Content-Type: text/html; charset=us-ascii

<P>Well quit putting them in those darn macs....just kidding.&nbsp; Who makes the disk?&nbsp; IBM has certain tools like their drive fitness tests that has saved me a few times.&nbsp; Seagate and others probably have similar tools.&nbsp; Check their support sites and it may just be a matter of the wrong block size written by your mac.&nbsp; IBM drives are especially notorious for having weird block sizes and such.
<P>derek
<P>&nbsp;<B><I>James Smith &lt;james@compusmithllc.com&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">I just got a pile of 712/60's - $80 for 10 of em :)<BR><BR><BR>i've set one up &amp; now i'm going through the disks one at a time &amp;<BR>cloning them as its quicker than going through the install each time<BR><BR><BR>i've hit one disk that gives me this whenever i try to fdisk it <BR><BR><BR>sixty:~# fdisk /dev/sdb<BR><BR>Unable to read /dev/sdb<BR><BR><BR>when i tried to zero the disk, i got this....<BR><BR>sixty:~# dd if=/dev/zero of=/dev/sdb count=1 bs=512 <BR>dd: writing `/dev/sdb': Input/output error<BR>1+0 records in<BR>0+0 records out<BR><BR>the console sees the disk when i use search <BR><BR>does this indicate a dead disk?<BR><BR>the disk was ok until i put it into a mac......<BR><BR>James S<BR><BR><BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-296138104-1038016354=:15527--
