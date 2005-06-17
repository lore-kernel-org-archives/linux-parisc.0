From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] List of things that are known no to work on Linux/PA
Date: Fri, 17 Jun 2005 13:49:15 -0400
Message-ID: <20050617174915.GM4229__29941.7133363479$1416624549$gmane$org@systemhalted.org>
References: <e6eae02905061709187feef001@mail.gmail.com> <1119030367.5049.45.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Max Grabert <parisc@gmail.com>,
 debian-hppa@lists.debian.org,
 Linux/PA <parisc-linux@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <1119030367.5049.45.camel@mulgrave>
Resent-Message-ID: <oi9LjD.A.c7E.k0wsCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Fri, Jun 17, 2005 at 12:46:07PM -0500, James Bottomley wrote:
> On Fri, 2005-06-17 at 17:18 +0100, Max Grabert wrote:
> > - 64bit userland is not yet supported
> 
> Actually, the kernel supports it quite happily.  There's a 64 bit mini
> library that will build static ELF64 user binaries that I used to debug
> support when I added it.
> 
> What's missing is:
> 
> - 64 bit gcc that will build DSO's
> - 64 bit glibc

I forgot perhaps we should add:

  - Multiple stub sections for the 64-bit linker.

Which will probably be the next project after TLS/NPTL/FUTEX.
Binutils elf64-hppa needs a good cleanup.

c.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
