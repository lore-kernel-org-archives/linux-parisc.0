Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A155F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 May 2002 08:42:37 -0600 (MDT)
Message-Id: <200205171442.g4HEgNbk029843@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] parsic function calling convention
To: randolph@tausq.org
Date: Fri, 17 May 2002 10:42:22 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: james@massive.com.au, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020517063657.GZ30370@tausq.org> from "Randolph Chung" at May 16, 2002 11:36:57 pm
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

> > I'm not aware of any authoritative, detailed documentation for PA1.1 ELF.
> > Since PA1.1 (32-bit) ELF is hack from the existing 64-bit ELF, 
> > You could start by looking at PA2.0 calling convention for HPUX.
> > Either docs.hp.com or www.parisc-linux.org should have that specification.
> > Otherwise, just write something in 'C' and see what gcc produces.
> 
>  From what I have seen, the 32-bit elf conventions are quite similar to
>  the 32-bit som conventions. the biggest difference i know off the top
>  of my head is that we don't do fp argument relocation.

Yes, that's the main difference.  For the most part, argument relocation
does not affect the code generated except in special situations (e.g.,
varargs).  Further, there are no differences in the calling conventions
for PA1.0, PA1.1 and PA2.0 in either runtime.

For embedded products, you should be aware of TARGET_PORTABLE_RUNTIME.
This affects the type of branch used for calls.  It could be specified
under hpux or linux but I have no idea whether it would work.

I have wondered if parisc-linux actually supports the PA2.0 architecture
in the ELF32 runtime.  I think that's there is more in the compiler that
could be done to take advantage of the 64-bit general registers and 64-bit
operations available under PA2.0.

There are some subtle differences between the SOM and ELF32 runtimes that
arise because of the different capabilities of the linkers.  Long calls
are more likely to be needed with the GNU linker because it places stubs
at the beginning of translation units unless you compile with
-ffunction-sections.

There are differences in the assembly language output from the compiler
for hpux and linux.  These mainly involve different directives.  The linux
directives are similar to those for the i386 linux port.

You will probably need to understand stub generation to implement libffi
if I recall correctly.

Hpux uses a segmented memory model.  Linux uses a flat model.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
