Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F2904829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Dec 2002 09:52:43 -0700 (MST)
Message-Id: <200212121652.gBCGqbQQ023486@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Solved: Kernel crash when loggin in via ssh
To: randolph@tausq.org
Date: Thu, 12 Dec 2002 11:52:36 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: xam@cs.ucc.ie, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021212073215.GA1141@tausq.org> from "Randolph Chung" at Dec 11, 2002 11:32:15 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> $ ssh -p 1022 -2 tausq@gsyprf10.external.hp.com
> tausq@a500:~$ dmesg|grep gcc
> Linux version 2.4.20-pa13 (tausq@a500) (gcc version 3.2.2 20021202 (Debian prerelease)) #12 SMP Wed Dec 11 23:02:01 PST 2002

I plan to change BIGGEST_ALIGNMENT back to 64 bits on the 32 branch today
assuming that testing is successful.  The main branch was changed yesterday.
This affects the alignment of long doubles under hpux and possibly the
alignment of __atomic_lock_t types parisc-linux linux.

I have been testing revised glibc locking code.  It only requires integer
alignment for __atomic_lock_t types.  I am convinced this is the
correct solution.  The __attribute__ ((aligned(16))) doesn't always
do what you want.  Specifically, it doesn't work for stack locals, or
malloc'd data.  

There is still one gcc pthread test failure (pthread6) under investigation.
