Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from myware.akkadia.org (cpe-24-221-190-179.ca.sprintbbd.net [24.221.190.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id 247974829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Dec 2002 15:55:48 -0700 (MST)
Message-ID: <3DF3CDE5.6070008@redhat.com>
Date: Sun, 08 Dec 2002 14:55:33 -0800
From: Ulrich Drepper <drepper@redhat.com>
MIME-Version: 1.0
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
References: <20021208220918.GC32062@systemhalted>
In-Reply-To: <20021208220918.GC32062@systemhalted>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: [PATCH] Add SHMLBA define to shm.h (HPPA).
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

Carlos O'Donell wrote:

> 2002-12-07  Carlos O'Donell  <carlos@baldric.uwo.ca>
> 
> 	* sysdeps/unix/sysv/linux/hppa/bits/shm.h: Added SHMLBA define.

I've added the patch.  Thanks,

-- 
--------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
