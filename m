Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5139B483E
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 13:04:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A19Vx-0007OR-6X; Sun, 21 Sep 2003 20:04:57 +0100
Date: Sun, 21 Sep 2003 20:04:57 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Joel Soete <soete.joel@tiscali.be>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] warning: long unsigned int format, time_t arg
Message-ID: <20030921190457.GI13172@parcelfarce.linux.theplanet.co.uk>
References: <3F6DE716.4030104@tiscali.be> <200309211846.h8LIkKwp011274@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309211846.h8LIkKwp011274@hiauly1.hia.nrc.ca>
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

On Sun, Sep 21, 2003 at 02:46:20PM -0400, John David Anglin wrote:
> >                  rc = snprintf(out_ptr, out_end - out_ptr,
> > -                          "%lu", tv.tv_sec);
> > +                          "%lu", (unsigned long int)tv.tv_sec);
> 
> This looks ok to me, although you don't need the extra "int".

I'd rather not add these.  They are only warnings, after all.

> I noticed in include/asm-parisc/posix_types.h we have:
> 
> /* Note these change from narrow to wide kernels */
> #ifdef __LP64__
> typedef unsigned long           __kernel_size_t;
> typedef long                    __kernel_ssize_t;
> typedef long                    __kernel_ptrdiff_t;
> typedef long                    __kernel_time_t;
> #else
> typedef unsigned int            __kernel_size_t;
> typedef int                     __kernel_ssize_t;
> typedef int                     __kernel_ptrdiff_t;
> typedef int                     __kernel_time_t;
> #endif
> 
> On narrow kernels, int and long are the same.  So, why not use long
> for both narrow and wide?  Then, the ifdef can be eliminated.

I think it's because gcc complains ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
