Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA00353
	for <parisc-linux@puffin.external.hp.com>; Fri, 20 Oct 2000 09:24:00 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 20 Oct 2000 15:25:21 -0000
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Bug in shared libraries
References: <200010201437.IAA06649@udlkern.fc.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 20 Oct 2000 11:20:35 -0400
In-Reply-To: John Marvin's message of "Fri, 20 Oct 2000 08:37:54 -0600 (MDT)"
Message-ID: <8766mn1qv0.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John Marvin <jsm@udlkern.fc.hp.com> writes:

> Here is a partial dump from ld-2.1.94.so. The instruction at offset 3c60
> below, "stw r6,0(r7)", is the first faulting instruction that is attempting
> to write into its own .rodata section. Once this is fixed, there may
> be others.

Yes, I know what this is now.  The problem is that the compiler places
static PLABELs in .rodata instead of .data.  This doesn't cause any
problems for static executables since all the relocations on these
PLABELs will be resolved in the final link.  However when building
shared objects they will get emitted as dynamic relocations.

That's actually not supposed to make the dynamic linker crash though,
because the linker will set a flag (and create a dynamic tag) to
indicate that the read-only segments in the object should be remapped
read-write during relocation processing.

I wonder if the problem is actually that the call to mprotect() that
ld.so makes in order to remap its text segment read-write is failing,
or not having the desired effect.

Still it is wrong to be putting relocatable stuff in the text segment
(duh :) I'd meant to fix this eventually but it never affected us
before, so I sort of ignored it.  Too bad we didn't have a working
page fault handler earlier... it would really have been nice to catch
it early.

I guess I will "fix" the compiler to put them in .data instead for the
ELF32 target.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
