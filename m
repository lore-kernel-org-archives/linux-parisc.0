Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id B78DB4874
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 16:51:04 -0600 (MDT)
Date: Fri, 21 Jun 2002 23:51:01 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA8000 modutils problems
In-Reply-To: <200206212125.g5LLP37O028451@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.44.0206212339430.5644-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 21 Jun 2002, John David Anglin wrote:

> > I tried pa35 (32bit), which caused unaligned address traps during boot
> > (IIRC it was e2fsck).
> > I rebooted with pa20, which worked (but has the known IO problems,
> > i.e. copying a full CD to hard disk with lock up the machine).
> > Later I tried compiling pa39 (32bit), but depmod reported
> > "unhandled relocation of type 74" for each function in each module.
> > Compiling 64bit with the (quite old) unofficial debs worked however,
> > but there are some "unresolved symbols" in a few (=4) modules,
> > each time the symbol is "__xchg64". I'm quite sure that in former times
> > all modules worked. Since these modules are not important to me
> > (smbfs and some ipv6 netfilter modules) there is no hurry ;)

I think the unsresolve symbols are just simple programmers bugs which
will 'autmagically' be fixed in later kernels. At least this happened to
me quite a few times (on different platforms, different kernels & modules)

> Depmod does it own limited handling of relocations.  You probably
> need to stick with the recommended compiler (debian 3.0.4 and binutils)
> to be compatible with the relocation capability of depmod.  The
> alignment issues also are likely a result of using 3.1.  BIGGEST_ALIGNMENT
> was changed last Feb. to 128 bits to allow struct alignment suitable
> for the ldcw semaphore insn.  I believe the deb version of gcc was
> patched to do this as well.

I forgot to mention that I used 'gcc' (thus 3.0) to compile -pa39
(32bit, and 'hppa64-gcc' for 64bit). I'm quite sure about that.

However I'm have to agree that I used gcc-3.1 for the not
correctly working -pa35 (unaligned address). That's the reason why
I chose to use the default gcc for compiling -pa39!

Therefore the depmod issue is IMHO due to some other error ...

> Now, there is a known issue with PA2.0 code generation.  It affects
> floating point loads from symbolic memory locations using the 32-bit
> elf tools.  As a result, the code generation default is still PA1.1.
> I'm planning to change this to PA2.0 for PA2.0 machines when the
> assembler bug is fixed.

So what is the point in choosing the PA8000 anyway ? ;)
Oh, I forgot; to be able to select 64bit kernel!

Thanks alot for the quick answer!

Greeting max

-- 
I am the "ILOVEGNU" signature virus. Just copy me to your signature.
This email was infected under the terms of the GNU General Public License.
