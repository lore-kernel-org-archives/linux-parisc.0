From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Mon, 10 Jan 2005 20:02:18 +0000
Message-ID: <20050110200218.GA4595@ntlworld.com>
References: <20050110085446.GS18497@tausq.org>
	<41DE941900000C83@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41DE941900000C83@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 10, 2005 at 06:12:24PM +0100, Joel Soete wrote:
> I still trying to understand the previous formula I found somewhere :
> 	; NOTE: If a null char. exists, return 0.
> 	; if ((x - 0x01010101) & ~x & 0x80808080)
> 	;     return 0;
> (here it comes from m32r/lib/useropcy.c)

It's subtracting one from each byte and checking for overflow.  If the
most significant bit is set in x - 1, but not in x, then x must be 0.
The & with ~x is used to mask out the most significant bit in each
byte, if it was already set in x.

If a byte is equal to 0, bytes to the "left" of it will be affected by
the overflow, but that doesn't matter.  Quite a neat trick, really.
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
