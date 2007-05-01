From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Tue, 1 May 2007 16:59:45 -0400 (EDT)
Message-ID: <200705012059.l41Kxj21011265__42340.585779357$1416624345$gmane$org@hiauly1.hia.nrc.ca>
References: <46379E8A.8080705@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: aurelien@aurel32.net (Aurelien Jarno)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46379E8A.8080705@aurel32.net> from "Aurelien Jarno" at May 1,
	2007 10:09:46 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Carlos O'Donell a écrit :
> > On 5/1/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >> We have just switched to a glibc 2.5 using LT + TLS in Debian. This
> >> causes unaligned memory access when using bash:
> >>
> >> bash(19279): unaligned access to 0x000e1bb2 at ip=0x407cb76b
> > 
> > Why doesn't this ip match the runtime disassembly you have below?
> 
> Well I don't really now. The address return by the kernel is not
> aligned, so that's strange. Note that this does not correspond to the
> same execution. I run it once to get the entry in the kernel log, and
> once with unaligned=signal to get the SIGBUS in gdb.

The two least significant bits in ip contain the priviledge level
of the executing code.  They have to be masked off to get the address
of a faulting instruction.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
