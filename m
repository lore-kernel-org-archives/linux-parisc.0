Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03FFB482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 09:58:18 -0600 (MDT)
Message-Id: <200210221558.g9MFwDJj020555@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: EWOULDBLOCK vs. EAGAIN
To: jsm@udlkern.fc.hp.com (John Marvin)
Date: Tue, 22 Oct 2002 11:58:12 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200210221534.JAA28679@udlkern.fc.hp.com> from "John Marvin" at Oct 22, 2002 09:34:55 am
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

> Yes, to be completely portable across other Unix flavors, you should
> check for both EAGAIN and EWOULDBLOCK. But it would appear that
> Gnu C library documentation says they should be the same, and they
> ARE the same on all other Linux architectures. So, in my opinion,
> we are broken, not the apps.

I just looked at expect.  It uses 

#ifdef EAGAIN
        case EAGAIN: return "resource temporarily unavailable";
#endif
...
#if defined(EDEADLK) && (!defined(EWOULDBLOCK) || (EDEADLK != EWOULDBLOCK))
        case EDEADLK: return "resource deadlock avoided";
#endif
#if defined(EDEADLOCK) && (!defined(EDEADLK) || (EDEADLOCK != EDEADLK))
	case EDEADLOCK: return "resource deadlock avoided";
#endif
...
#if defined(EWOULDBLOCK) && (!defined(EAGAIN) || (EWOULDBLOCK != EAGAIN))
        case EWOULDBLOCK: return "operation would block";
#endif

This seems portable to me.

I agree that the definition of EWOULDBLOCK should be the same as on
other Linux architectures.  However, I think that apps should work
irrespective of whether they are the same or not.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
