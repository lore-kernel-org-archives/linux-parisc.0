Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12506.mail.yahoo.com (web12506.mail.yahoo.com [216.136.173.198])
	by dsl2.external.hp.com (Postfix) with SMTP id 7D41E4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 23:13:11 -0700 (MST)
Message-ID: <20030402061310.20117.qmail@web12506.mail.yahoo.com>
Date: Tue, 1 Apr 2003 22:13:10 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <25C4C6009B5BD5118FF30003470BF7F503501C63@xboi04.boi.hp.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1458837042-1049263990=:18068"
Subject: [parisc-linux] RAID issues on my C3000
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

--0-1458837042-1049263990=:18068
Content-Type: text/plain; charset=us-ascii


Hey all,
I was just following the RAID HOWTO posted awile back and I ran into a few problems.  I've gotten all the way through creating my RAID partitions and copying the data over via tar, making it bootable (after upgrading my PALO from source - it is now 1.2), editing all the files on the new md devices, and then rebooting.  When I try to boot from the new degraded RAID disk I get that the device is hard booted (with PALO 1.0 not 1.2), displays my patition info (but displays the partitions as "unknown" and not RAID probably due to the Palo 1.0 version), and spits out "Selected kernal: /vmlinux from partition 2" then "Error: Partition 2 must be ext2".  I've created 4 primary partitions on the drive in the following order PALO, boot, swap, and root.  Both Palo and boot are with the first 2GB.  I have tried to stop the arrays and reconfigure them as ext2 with no luck.  Any help would be appreciated.
Thanks,
derek



---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
--0-1458837042-1049263990=:18068
Content-Type: text/html; charset=us-ascii

<P>Hey all,
<P>I was just following the RAID HOWTO posted awile back and I ran into a few problems.&nbsp; I've gotten all the way through creating my RAID partitions and copying the data over via tar, making it bootable (after upgrading my PALO from source - it is now 1.2), editing all the files on the new md devices, and then rebooting.&nbsp; When I try to boot from the new degraded RAID disk I get that the device is hard booted (with PALO 1.0 not 1.2), displays my patition info (but displays the partitions as "unknown" and not RAID probably due to the Palo 1.0 version), and spits out "Selected kernal: /vmlinux from partition 2" then "Error: Partition 2 must be ext2".&nbsp; I've created 4 primary partitions on the drive in the following order PALO, boot, swap, and root.&nbsp; Both Palo and boot are with the first 2GB.&nbsp; I have tried to stop the arrays and reconfigure them as ext2 with no luck.&nbsp; Any help would be appreciated.
<P>Thanks,
<P>derek</P><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/finance/mailsig/*http://tax.yahoo.com">Yahoo! Tax Center</a> - File online, calculators, forms, and more
--0-1458837042-1049263990=:18068--
