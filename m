Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 29 Jun 2003 12:33:13 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] byte swapping redux
Message-ID: <20030629183313.GB21094@dsl2.external.hp.com>
References: <20030629181415.GA21094@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030629181415.GA21094@dsl2.external.hp.com>
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

On Sun, Jun 29, 2003 at 12:14:15PM -0600, Grant Grundler wrote:
> #if !defined(__STRICT_ANSI__) || defined(__KERNEL__)
> #  define __BYTEORDER_HAS_U64__
> #  define __SWAB_64_THRU_32__
> #endif
> 
> vs include/asm-sparc64/byeorder.h:
> #define __BYTEORDER_HAS_U64__

BTW, I forgot to mention parisc is picking generic 64-bit swap macros.
Instead of 4 cycles, we are talking 30 or so.

grant
