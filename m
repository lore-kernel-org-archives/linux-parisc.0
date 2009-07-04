From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sat, 4 Jul 2009 15:52:16 -0400 (EDT)
Message-ID: <20090704195218.1E7B4514A@hiauly1.hia.nrc.ca>
References: <20090703185756.GA323@roeckx.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: kurt@roeckx.be (Kurt Roeckx)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090703185756.GA323@roeckx.be> from "Kurt Roeckx" at Jul 3, 2009 08:57:56 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> And then there is glob2 that fails with:
> /usr/bin/ld: libgag/src/libgag.a(FileManager.o)(.text+0x2fc8): cannot reach 0000f9bf_memcpy@@GLIBC_2.2+0, recompile with -ffunction-sections
> /usr/bin/ld: libgag/src/libgag.a(FileManager.o)(.text+0x2fc8): cannot handle R_PARISC_PCREL17F for memcpy@@GLIBC_2.2
> /usr/bin/ld: final link failed: Bad value
> collect2: ld returned 1 exit status

I couldn't duplicate the problem with binutils 2.19.1-1 and gcc-4.3
4.3.3-10, or with my own binutils build on two different systems.

The above shouldn't happen as the text size of FileManager.o is well below
the size where a 17-bit branch can't reach the stub table.  Possibly, the
stub table is full.  On the otherhand, the "0000f9bf_memcpy@@GLIBC_2.2+0"
string looks garbled.  So, this may be another form of the SMP memory
corruption that causes the segvs, particularly if it isn't reproducible
on the build system.

The suggestion to "recompile with -ffunction-sections" is somewhat
misleading.  While -ffunction-sections may help sometimes, in other
cases it may be necessary to play with the ld --stub-group-size=N
option, or to compile with -mlong-calls.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
