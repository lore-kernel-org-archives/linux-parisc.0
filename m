From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] [PATCH] New error codes for Alpha, MIPS,
	PA-RISC, Sparc & Sparc64
Date: Tue, 31 Aug 2004 18:00:15 +0100
Message-ID: <1093971614.599.20.camel__43122.3073778257$1416624471$gmane$org@localhost.localdomain>
References: <20040830232445.0b5aad79.akpm@osdl.org>
	<13071.1093965134@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@osdl.org>,
 linux-mips@linux-mips.org,
 sparclinux@vger.kernel.org,
 rth@twiddle.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 HPPA List <parisc-linux@parisc-linux.org>
To: David Howells <dhowells@redhat.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <13071.1093965134@redhat.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Maw, 2004-08-31 at 16:12, David Howells wrote:
> The attached patch adds the new error codes I added for key-related errors to
> those archs that don't make use of <asm-generic/errno.h>, including Alpha,
> MIPS, PA-RISC, Sparc and Sparc64. This is required to compile with CONFIG_KEYS
> on those platforms.

The patch seems to be mixing the fixups for remapping these error codes
into sparc, hpux, osf/1 and other compatibility layers on the platforms

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
