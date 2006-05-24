From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Missing POSIX_MADV_* defines in bits/mman.h
Date: Wed, 24 May 2006 08:24:20 +0200
Message-ID: <200605240824.20762.deller@gmx.de>
References: <20060524013930.c0b80171.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: Guy Martin <gmsoft@tuxicoman.be>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060524013930.c0b80171.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Guy,

On Wednesday 24 May 2006 01:39, Guy Martin wrote:
> I was wondering why does the hppa glibc misses all the POSIX_MADV_* defines from bits/mman.h and jbailey confirmed that it's a bug and shouldn't be missing.
> 
> This trivial copy/paste patch attached fix this lack.

Thanks for noticing!

But your patch misses at least the "new" madvise() parameters as well:
/* common/generic parameters */
#define MADV_REMOVE     9               /* remove these pages & resources */
#define MADV_DONTFORK   10              /* don't inherit across fork */
#define MADV_DOFORK     11              /* do inherit across fork */

See: http://cvs.parisc-linux.org/linux-2.6/include/asm-parisc/mman.h?view=markup

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
