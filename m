Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC9A8482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Sep 2002 16:04:05 -0600 (MDT)
Date: Mon, 9 Sep 2002 15:04:49 -0700
From: Randolph Chung <randolph@tausq.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] definition of EWOULDBLOCK in /usr/include/asm/errno.h
Message-ID: <20020909220448.GP17893@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.44.0209092343150.2394-100000@alpha.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0209092343150.2394-100000@alpha.bocc.de>
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

> because of the unusual definition of EWOULDBLOCK, zebra currently doesn't
> work (zebra checks for EWOULDBLOCK in zebra/rt_netlink.c and will loop if
> it gets EAGAIN instead and both are not the same).
> 
> I'm not sure what's the correct fix for this, change errno.h to match the
> definition of the other archs or change zebra to check for EAGAIN as
> well...

I assume you are refering to this bit of code:

      status = recvmsg (nl->sock, &msg, 0);

      if (status < 0)
        {
          if (errno == EINTR)
            continue;
          if (errno == EWOULDBLOCK)
            break;
          zlog (NULL, LOG_ERR, "%s recvmsg overrun", nl->name);
          continue;
        }

On some SysV systems EAGAIN != EWOULDBLOCK. I think we inherited the
errno definitions from HPUX...

glibc's documentation says:

Portability Note: In many older Unix systems, this condition was indicated by EWOULDBLOCK, which was a distinct error code different from EAGAIN. To make your program portable, you should check for both codes and treat them the same. 

sounds like good advice to me.. :-)

it does say, however, that for glibc EWOULDBLOCK and EAGAIN should have
the same value though, so i guess ours is wrong... i wonder if we'll
break things if we changed it.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
