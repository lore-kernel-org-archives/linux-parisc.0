Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from abyssinian.sleepycat.com (abyssinian.sleepycat.com [199.103.242.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF907482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Sep 2002 19:43:18 -0600 (MDT)
Date: Mon, 9 Sep 2002 21:43:03 -0400 (EDT)
From: Keith Bostic <bostic@sleepycat.com>
Message-Id: <200209100143.g8A1h3F17414@abyssinian.sleepycat.com>
To: jochen@scram.de
Cc: parisc-linux@lists.parisc-linux.org, support@sleepycat.com
Subject: [parisc-linux] Re: db3/db4 patch for Linux/HPPA [#6581]
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

Hi, my name is Keith Bostic and I'm with Sleepycat Software.
I'll own your Support Request for now.

Please copy "support@sleepycat.com" on any email you send,
and include the tag [#6581] in your email Subject lines.
That allows us to track the email discussion and for you to
get prompt replies even if I am not in the office.

> the same applies to 4.0.14, as well.

Thanks for finding this one!  I used a slightly different fix,
since MUTEX_UNSET isn't supposed to return a value.  Here's what
I ended up using, please let me know if you disagree with this
change.

	*** include/mutex.h	2002/08/15 06:42:38	11.70
	--- include/mutex.h	2002/09/10 01:36:48	11.71
	***************
	*** 435,441 ****
	  })
	  
	  #define	MUTEX_UNSET(tsl)	(*(tsl) = -1)
	! #define	MUTEX_INIT(tsl)		MUTEX_UNSET(tsl)
	  #endif
	  #endif
	  
	--- 435,441 ----
	  })
	  
	  #define	MUTEX_UNSET(tsl)	(*(tsl) = -1)
	! #define	MUTEX_INIT(tsl)		(MUTEX_UNSET(tsl), 0)
	  #endif
	  #endif
  
Regards,
--keith

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Keith Bostic
Sleepycat Software Inc.		bostic@sleepycat.com
118 Tower Rd.			+1-781-259-3139
Lincoln, MA 01773		http://www.sleepycat.com
