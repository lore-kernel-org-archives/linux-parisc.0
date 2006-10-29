From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c
Date: Sun, 29 Oct 2006 15:48:05 -0500 (EST)
Message-ID: <200610292048.k9TKm6lG001929__457.945574498986$1416624202$gmane$org@hiauly1.hia.nrc.ca>
References: <1162132391.5690.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: jbailey@raspberryginger.com (Jeff Bailey)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1162132391.5690.13.camel@localhost.localdomain> from "Jeff
	Bailey" at Oct 29, 2006 09:33:11 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> It looks like the best thing to do is to support the -march parameter,
> similar to gcc.  gcc supports:
> 
> -march={1.0,1.1,2.0}
> 
> Should I add 2.0w to this for 64bit?  Talking about it with Randolph on
> IRC, he pointed out that hppa2.0w-hp-hpux11.11 targets a 32 bit
> userspace on a wide kernel.

Right.  The convention is that the first hunk refers to the kernel
architecture.  Back in the old days, the tools only supported a 32-bit
userspace.  When the 64-bit tools were developed, a way to select the
64-bit userspace was needed.  hppa64 was chosen for 64-bit userspace.
So, config.guess now changes hppa2.0w to hppa64 if it detects ${CC}
is generating 64-bit code.

This was obviously the easy way forward and probably hppa64 should
never have been invented.  However, it was, so I think we are stuck
with it.  If merging archs can be done, then it will just become
a synonym for hppa2.0w.  The downside in doing this is that the
arch needs to be specified when packages are configured.

I think that adding -march={1.0, 1.1, 2.0, 2.0w} to the command
line options is reasonable.  This together with .level could be
used to select output format and arch.  I think .level overrides
the command line option (warning needed).  .level should appear
before any other directives.  If we need to become more specific
about the ABI, then an -mabi option could be added.

The tricky part is handling both som and elf64 for hpux, and elf32
and elf64 for linux.  It will take a fair bit of work to merge the
bfd stuff.  It may be difficult to do this in a clean manner given
that the elf and som targets are quite different.

I think the best plan would be to do the various merges before
adding the option to select the arch at runtime.

> HP/UX as supports the syntax:
> 
> +DAarchitecture
> 
> But I'd rather stick with something that feels more like the rest of the
> arches and toolchain.

The big problem in supporting multiple ABIs lies in GCC.  The som and
elf64 targets are essentially incompatible.  There are a number of macros
which change GCC's behavior depending on whether they are defined or not
defined.  We have a number of macros that need to be defined in one case
and not in the other.  Jeff Law used to say it wasn't worth the effort
to merge the two ports.  I think the same problem is present in binutils
and gdb.

The GMP package has an ABI configure option.  I don't really like it but
for performance reasons they want to use 64-bit registers with the 32-bit
som runtime and a wide kernel.  This works since the kernel saves the
full 64-bit context.  However, we don't try this in GCC since the upper
32-bits aren't preserved across calls.

HP compilers also have a +DDdata_model option to generate code for
the ILP32 and ILP64 data models.  This option overlaps to some extent
the +DA option.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
