From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 11:13:48 -0500 (EST)
Message-ID: <200701271613.l0RGDmXX008512__25184.3144222677$1416624268$gmane$org@hiauly1.hia.nrc.ca>
References: <200701270509.50109.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: vapier@gentoo.org (Mike Frysinger)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701270509.50109.vapier@gentoo.org> from "Mike Frysinger" at
	Jan 27, 2007 05:09:49 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> after upgrading from 2.17.50.0.9 to 2.17.50.0.10 (.11 too), ld seems unable=
>  to=20
> do anything remotely basic ... is there something basic i'm missing here ? =
>  i=20
> verified that it isnt caused by the Gentoo patchsets as a vanilla build=20
> exhibits the issue as well

There's been very few hppa changes to binutils in the past several
months.  I can't duplicate the problem, so maybe there's something
wrong with your libc setup.

> $ cat test.c
> int main() { fopen(); }
> $ gcc test.c
> /usr/hppa2.0-unknown-linux-gnu/binutils-bin/2.17.50.0.10/ld: /tmp/ccpL4Tbn.=
> o(.text+0x10):=20
> cannot handle R_PARISC_PCREL17F for fopen@@GLIBC_2.2
> /usr/hppa2.0-unknown-linux-gnu/binutils-bin/2.17.50.0.10/ld: final link=20
> failed: Bad value
> collect2: ld returned 1 exit status

You might try adding "-Wl,-v -Wl,--trace -Wl,--trace-symbol=fopen" to the
above gcc command and see what it shows.  This should show the command
used to link test and details of the lookup for the the symbol fopen.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
