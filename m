Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09075482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 04:44:34 -0600 (MDT)
Date: Thu, 18 Oct 2001 10:44:29 +0000
From: Richard Allen <ra@hp.is>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc update
Message-ID: <20011018104429.J8089@hp.is>
References: <20011017122313.C4123@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017122313.C4123@tausq.org>; from randolph@tausq.org on Wed, Oct 17, 2001 at 12:23:13PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 17, 2001 at 12:23:13PM -0700, Randolph Chung wrote:
> glibc 2.2.4-3 has been uploaded to Debian's incoming direction and
> should be installed in today's archive run.
> 
> it was lightly tested by lamont and myself before upload... please do
> report any problems you find.

I did an apt-get update and apt-get upgrade and recived all the new packages on
my C360.   I then compiled todays kernel on my machine.

bofh:~# dpkg --list | grep -i libc6
ii  libc6          2.2.4-3        GNU C Library: Shared libraries and Timezone
ii  libc6-dev      2.2.4-3        GNU C Library: Development Libraries and Hea
bofh:~# uname -a
Linux bofh 2.4.9-pa57 #1 Thu Oct 18 10:12:28 UTC 2001 parisc unknown

All went well and my box seems to be functioning perfectly. :-)

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
