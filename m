Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hp (IP-213157009128.dialin.heagmedianet.de [213.157.9.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id 554864829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 14:57:47 -0600 (MDT)
Received: from crayboook.dreamind ([192.168.1.20] helo=craybook)
	by hp with asmtp (Exim 3.36 #1 (Debian))
	id 17mhDd-00059h-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 04 Sep 2002 22:57:45 +0200
Received: from dreamind by craybook with local (Exim 3.36 #1 (Debian))
	id 17mhDd-0007kI-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 04 Sep 2002 22:57:45 +0200
Date: Wed, 4 Sep 2002 22:57:44 +0200
From: Stefan Pfetzing <dreamind@dreamind.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFS - blkgetsize64
Message-ID: <20020904205744.GA29749@dreamind.de>
References: <20020904143013.GC4386@dreamind.de> <20020904165147.A33FC4829@dsl2.external.hp.com> <20020904182814.GA17156@dreamind.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020904182814.GA17156@dreamind.de>
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

Hum, replying to myself...

* Stefan Pfetzing <dreamind@dreamind.de> [020904 20:28]:
> * Grant Grundler <grundler@dsl2.external.hp.com> [020904 18:51]:
> > Stefan Pfetzing wrote:
> [snip]
> > > P.S.: I'm using 2.4.19-pa9 with a self made diff from vanilla 2.4.19 against
> > > XFS CVS. (the patch did in nearly cleanly)
> > 
> > Are you running 32-bit or 64-bit kernel?
> > I want to know if arch/parisc/kernel/sys_parisc32.c might be the problem.
> I'm running a 32bit kernel, since some time ago I had problems with 64bit and
> cdrecord.

I just got a blkgetsize* testprogram...
(https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=62038)

---snip---
root@hp:~# ./blkgetsizetester /dev/sda2
Device size is 83968 blocks (42991616 bytes)
Device size per BLKGETSIZE64 is 12345 bytes
root@hp:~# ./blkgetsizetester /dev/sda5 
Device size is 1026016 blocks (525320192 bytes)
Device size per BLKGETSIZE64 is 12345 bytes
root@hp:~#
---snip---

I think thats the problem with xfs... well at least blkgetsize64 should report
an error, if its not working correctly.

bye

Stefan

-- 
        http://www.dreamind.de/
Oroborus and Debian GNU/Linux Developer.
