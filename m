From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Sun, 9 Jan 2005 16:13:56 -0800
Message-ID: <20050110001356.GO18497@tausq.org>
References: <20050105055412.68E06495698@palinux.hppa>
	<20050107095143.GN18497@tausq.org> <41E180EF.8040808@tiscali.be>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41E180EF.8040808@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> in the shift computing:
>         /* Calculate how to shift a word read at the memory operation
>            aligned srcp to make it aligned for copy.  */
>         sh_1 = 8 * (src % sizeof(unsigned int));
>         sh_2 = 8 * sizeof(unsigned int) - sh_1;
> 
> what means '8' (== 2 * word size; i.e. 2 * 32 bit because MERGE use shrpw 
> and so 2 (a pair of word)? )

no. 8 is # bits/byte. sh_1 is the number of bits to shift a 32-bit
integer.

what we are trying to achieve is that given two adjacent 32-bit numbers,
we want to extract a 32-bit number "in the middle" of the two (aligned)
32-bit values.

if you look carefully, actually the implementation of MERGE does not use
both sh_1 and sh_2. In the original implementation, MERGE was
implemented using two SHIFT operations plus an OR operation. This was
optimized to use shrpw because this PA insn can do all three operations
in a single step, so it saves a lot of cycles.

> next in
>          switch (len % 4)
>         {
> 
> is '4' because as mentioned in copy_dstalign() description this 'Handles 
> _4_ words per loop'

yes.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
