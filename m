From: Joel Soete <soete.joel@tiscali.be>
Subject: *lcul and memory granularity question[Was: [parisc-linux]
	2.6.10-rc1-pa11 profile data]
Date: Fri, 03 Dec 2004 15:00:33 +0000
Message-ID: <41B07F91.9000000@tiscali.be>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111081154.GR15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

Randolph Chung wrote:
> - *lclu* can be rewritten to do better than 1-byte at a time

I have an additional question about parisc alignment and this remark:
a char type var is 1byte align; ... but what's about a 3, 5, 7 and more bytes struct size?

My idea is that a 3bytes could be align as a 32bites word and clearing such struct could be done by clearing all the word;
the same for 5 and 7 bytes if aligned as 2*32bites and so on for an unrolled loop of the max cache size (128 bytes iirc);
and btw using a case define as we use for __put/get__user/kernel_asm?

Or the memory management is more complex then I imagine and I would really consider a 3bytes as 2+1 bytes (5=2*2+1, ...)?

Thanks a lot,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
