From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] List of things that are known no to work on
	Linux/PA
Date: Fri, 17 Jun 2005 12:46:07 -0500
Message-ID: <1119030367.5049.45.camel__24469.5430541926$1416624549$gmane$org@mulgrave>
References: <e6eae02905061709187feef001@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: debian-hppa@lists.debian.org,
 Linux/PA <parisc-linux@parisc-linux.org>
To: Max Grabert <parisc@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e6eae02905061709187feef001@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-06-17 at 17:18 +0100, Max Grabert wrote:
> - 64bit userland is not yet supported

Actually, the kernel supports it quite happily.  There's a 64 bit mini
library that will build static ELF64 user binaries that I used to debug
support when I added it.

What's missing is:

- 64 bit gcc that will build DSO's
- 64 bit glibc

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
