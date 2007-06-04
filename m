From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 21:43:13 -0400
Message-ID: <20070604014313.GB2075__12233.7032844827$1416624386$gmane$org@fattire.cabal.ca>
References: <200706040123.l541Nnc1022459@hiauly1.hia.nrc.ca> <200706040137.l541bCmm022707@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200706040137.l541bCmm022707@hiauly1.hia.nrc.ca>
Resent-Message-ID: <crpKO.A.MUH.uL3YGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Sun, Jun 03, 2007 at 09:37:12PM -0400, John David Anglin wrote:
> Running svn cleanup with strace, these are the last few syscalls:
> 
> lstat64("libgcc/config/ia64/.svn/tmp/propsbase", 0xc02b6f08) = -1 ENOENT (No such file or directory)
> gettimeofday({1180920486, 457857}, NULL) = 0
> _newselect(0, NULL, NULL, NULL, {0, 642143}) = 0 (Timeout)
> write(2, "svn: Can\'t read directory \'libgc"..., 112svn: Can't read directory 'libgcc/config/ia64/.svn/tmp': Partial results are valid but processing is incomplete
> ) = 112
> close(3)                                = 0
> brk(0x80000)                            = 0x80000
> exit_group(1)                           = ?
> Process 1357 detached
> 

I don't suppose you could strace in a chroot with a older working glibc
and see what syscalls are there?

I don't see anything offhand that would have changed about this here.

Cheers,
	Kyle


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
