Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 083944840
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 10:33:20 -0700 (MST)
Date: Fri, 21 Nov 2003 10:33:15 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [BUG] dcopserver: ICE Connection rejected!
Message-ID: <20031121173315.GA23972@colo.lackof.org>
References: <20031121005838.GC13007@colo.lackof.org> <20031121024339.GR30485@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031121024339.GR30485@parcelfarce.linux.theplanet.co.uk>
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

On Fri, Nov 21, 2003 at 02:43:39AM +0000, Matthew Wilcox wrote:
> The obvious question ... what're the ownership/permissions on
> your /tmp/.ICE-unix?  Mine are:
> 
> drwxrwxrwt    2 root     root         4096 Nov  9 18:24 .ICE-unix

I have tried "chown root /tmp/.ICE-unix" but the default appears
to be:
grundler@debian:~$ ls -ld /tmp/.ICE-unix/
drwxrwxrwx    2 grundler grundler     4096 Nov 20 17:42 /tmp/.ICE-unix//

I set the ownership/permissions to match yours still get the same
error messages back (sans error about ownership).

root@debian:~# ls -ld /tmp/.ICE-unix/
drwxrwxrwt    2 root     root         4096 Nov 20 17:42 /tmp/.ICE-unix/

> Inside it, I have:
> 
> srwxrwxrwx    1 willy    willy           0 Nov  9 18:24 578

ok. I'll at least know when I have it working.

thanks,
grant
