From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Re: [PATCH] Generic compat_sys_sysinfo
Date: Fri, 24 Nov 2006 21:00:48 -0700
Message-ID: <20061125040047.GG14076@parisc-linux.org>
References: <20061125014313.GD11643@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 linux-arch@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061125014313.GD11643@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Nov 24, 2006 at 08:43:13PM -0500, Kyle McMartin wrote:
> Some architectures were missing the u16 pad, however, I'm going to
> guess that a u16 is aligned on a u32 boundary and thus the padding is
> implied there...

It's more that a u32 gets aligned to a u32 boundary rather than a u16.
This is true except for m68k, which doesn't have compat.

Acked-by: Matthew Wilcox <matthew@wil.cx>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
