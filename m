Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3F99483E
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 12:46:22 -0600 (MDT)
Message-Id: <200309211846.h8LIkKwp011274@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] warning: long unsigned int format, time_t arg
To: soete.joel@tiscali.be (Joel Soete)
Date: Sun, 21 Sep 2003 14:46:20 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <3F6DE716.4030104@tiscali.be> from "Joel Soete" at Sep 21, 2003 05:59:50 pm
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

>                  rc = snprintf(out_ptr, out_end - out_ptr,
> -                          "%lu", tv.tv_sec);
> +                          "%lu", (unsigned long int)tv.tv_sec);

This looks ok to me, although you don't need the extra "int".

I noticed in include/asm-parisc/posix_types.h we have:

/* Note these change from narrow to wide kernels */
#ifdef __LP64__
typedef unsigned long           __kernel_size_t;
typedef long                    __kernel_ssize_t;
typedef long                    __kernel_ptrdiff_t;
typedef long                    __kernel_time_t;
#else
typedef unsigned int            __kernel_size_t;
typedef int                     __kernel_ssize_t;
typedef int                     __kernel_ptrdiff_t;
typedef int                     __kernel_time_t;
#endif

On narrow kernels, int and long are the same.  So, why not use long
for both narrow and wide?  Then, the ifdef can be eliminated.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
