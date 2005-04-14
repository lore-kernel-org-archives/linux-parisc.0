From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] some other small bitops.h suggestion?
Date: Wed, 13 Apr 2005 23:07:27 -0600
Message-ID: <20050414050727.GA30838@colo.lackof.org>
References: <20050403143246.GE8921@tausq.org>
	<42134E6200012F70@mail-2-bnl.tiscali.it>
	<20050413174756.GA21641@colo.lackof.org>
	<20050414013105.GB17749@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <tausq@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050414013105.GB17749@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Apr 13, 2005 at 06:31:05PM -0700, Randolph Chung wrote:
> One might argue that the contents pointed to by addr can be volatile,
> but in that case shouldn't it be "unsigned long * volatile addr"?

Originally it's to make sure gcc doesn't optimize the read/modify/write
completely away if it thinks no one is using the result.

> In this case, we are doing a single operation to *addr, and this
> function is explicitly not atomic, so I am not quite sure why we need
> volatile at all.

James Bottomley dug up the original thread:
	http://marc.theaimsgroup.com/?t=108826637900003

If __set_bit() doesn't need volatile, then is the same true
for __clear_bit and __change_bit?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
