Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9C8C484A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 10:24:19 -0600 (MDT)
Message-Id: <200206251624.g5PGODww009592@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] The compiler failed to link application, request for help
To: raffo@neuronet.pitt.edu (Rafael E. Herrera)
Date: Tue, 25 Jun 2002 12:24:13 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D1894AA.6020504@neuronet.pitt.edu> from "Rafael E. Herrera" at Jun 25, 2002 12:04:58 pm
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

> In trying to compile a utility here, I end up with a linker error:
> 
> $ gcc -w -o pvmtalk pvmtalk.o dom_x.o usleep.o 
> -L/home/neuro/contrib/pvm3.3.11/lib/LINUX -lpvm3 -lgpvm3 
> -L/usr/X11R6/lib ../xvertext.5.0/libXrot.a -lX11 -lm
> /home/neuro/contrib/pvm3.3.11/lib/LINUX/libpvm3.a(lpvm.o): In function 
> `pvmbeatask':
> lpvm.o(.text+0x29cf): the use of `tmpnam' is dangerous, better use `mkstemp'
> /usr/bin/ld: can not size stub section: Bad value
> /usr/bin/ld: BFD 2.12.90.0.1 20020307 Debian/GNU Linux internal error, 
> aborting at ../../bfd/elf32-hppa.c line 4038 in elf32_hppa_relocate_section
> 
> /usr/bin/ld: Please report this bug.
> 
> collect2: ld returned 1 exit status
> 
> We have gcc 3.0.4. The sources compile with just some warnings.
> 
> Can someone offer any suggestion as to what this means and how we can 
> solve it?

Usually, in this type of error, there is a message just prior to the "size
stub section" message about a symbol that is too far to perform the required
relocation.  It may help to compile your objects with optimization (e.g, -O2)
and/or use the "-ffunction-sections" compilation option.  There is a bug in
gcc 3.0.4 regarding the type of branch used for long calls under hppa-linux.
This is fixed in 3.2, so as a last resort you might try building 3.2
(I would also use the current cvs source for binutils) and building
your package with it.

It's possible that your problem isn't the long call issue.  In that
case, you can try to debug it yourself or submit a report to the
binutils list.  However, there no longer is an active maintainer for
hppa problems since Alan Modra moved to ibm.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
