Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A9BA482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 12:14:32 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [127.0.0.1] (may be forged))
	by hiauly1.hia.nrc.ca (8.12.9/8.12.9) with ESMTP id h4EIEUgL012638
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 14:14:31 -0400 (EDT)
Message-Id: <200305141801.h4EI1ca3012585@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] RE: Dump module patche.
To: jsoe0708@tiscali.be (Joel Soete)
Date: Wed, 14 May 2003 14:01:37 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bruno_vidal@hpfrcu03.france.hp.com,
	grundler@dsl2.external.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EC0FF2300000638@ocpmta7.freegates.net> from "Joel Soete" at May 14, 2003 01:47:19 pm
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

> >Attachment: dump_modules-2.4.20-pa32.patch2
> >
> I apply it against last 2.4.20-pa35 (do not have any more pa22 :( ) (just
> 2 hunk to remove). Unfortunately it failed to compile with following message:
> `gcc-3.0 -print-libgcc-file-name` /usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/arch/parisc/lib/lib.a
> /usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/lib/lib.a  \
> 	--end-group \
> 	-o vmlinux
> fs/fs.o(.debug_info+0x6fbaf): undefined reference to `.L1225'
> make: *** [vmlinux] Error 1
> 
> (Sorry I already met this kind of pb but do not remember how to solve :()

At first glance, this would appear to be a GCC bug.  If I was to guess,
it's a problem with a label for a jump table being deleted.

You might be able to avoid the problem by compiling fs.o with a different
optimization.  The problem could be investigated further by generating
the assember output for the routine with -g.  Search for the above label.
The debug information in the file will allow finding the source line.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
