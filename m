From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux]
	Re: Gcc bug or I missunderstand? [ftsd %fr22, 56(%sr0,
	%r20) failed to build?]
Date: Wed, 15 Dec 2004 08:39:07 -0800
Message-ID: <20041215163907.GZ29171@tausq.org>
References: <418A80250000FC28@mail-2-bnl.tiscali.it>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: dave@hiauly1.hia.nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A80250000FC28@mail-2-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> it failed to build because:
> 
> gcc -save-temps -o tmset5 tmset5.c
> tmset5.s: Assembler messages:
> tmset5.s:122: Error: Invalid operands
> tmset5.s:130: Error: Invalid operands
> tmset5.s:138: Error: Invalid operands
> tmset5.s:146: Error: Invalid operands
> tmset5.s:154: Error: Invalid operands
> tmset5.s:162: Error: Invalid operands
[...]
> it seems that if d>8 there is a pb?
> Did I miss something?

No, this is a known bug with binutils; nobody has bothered to look
into/fix it yet :(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
