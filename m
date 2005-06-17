From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] List of things that are known no to work on
	Linux/PA
Date: Fri, 17 Jun 2005 19:05:08 +0100
Message-ID: <e6eae02905061711053b72fb5__47654.9845225692$1416624549$gmane$org@mail.gmail.com>
References: <e6eae02905061709187feef001@mail.gmail.com>
	<1119030367.5049.45.camel@mulgrave>
	<20050617174915.GM4229@systemhalted.org>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 Linux/PA <parisc-linux@parisc-linux.org>,
 debian-hppa@lists.debian.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050617174915.GM4229@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/17/05, Carlos O'Donell <carlos@systemhalted.org> wrote:
> On Fri, Jun 17, 2005 at 12:46:07PM -0500, James Bottomley wrote:
> > On Fri, 2005-06-17 at 17:18 +0100, Max Grabert wrote:
> > > - 64bit userland is not yet supported
> >
> > Actually, the kernel supports it quite happily.  There's a 64 bit mini
> > library that will build static ELF64 user binaries that I used to debug
> > support when I added it.
> >
> > What's missing is:
> >
> > - 64 bit gcc that will build DSO's
> > - 64 bit glibc
>=20
> I forgot perhaps we should add:
>=20
>   - Multiple stub sections for the 64-bit linker.
>=20
> Which will probably be the next project after TLS/NPTL/FUTEX.
> Binutils elf64-hppa needs a good cleanup.

Thank you all (Carlos, James, Kyle etc.) for your input!

I'll add a wiki page in the next couple of days that will
contain a (hopefully regulary updated) list of things that
are "known broken", "being worked on" and
"probably never supported" in the p-l kernel.

   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
