Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D24D8487E
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Mar 2004 18:04:01 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B2K2q-00028j-Lp; Sun, 14 Mar 2004 01:04:00 +0000
Date: Sun, 14 Mar 2004 01:04:00 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.4-pa2 panic on c110 :(
Message-ID: <20040314010400.GB26705@parcelfarce.linux.theplanet.co.uk>
References: <405397F3.1050406@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <405397F3.1050406@tiscali.be>
Sender: <willy@www.linux.org.uk>
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Mar 13, 2004 at 11:23:31PM +0000, Joel Soete wrote:
> I just compile successfully (with defconfig) and seems to boot fine the 
> last 2.6.4-pa2 kernel on my C110.
> But as I was starting a rm -rf glibc it panics with console message:
> arq->state 2
> Badness in as_requeue_request at drivers/block/as-iosched.c:1479
> Kernel addresses on the stack:
> [<10125de8>] printk+0x188/0x1c8
> [<10105938>] dump_stack+0x18/0x24
> [<10229688>] as_requeue_request+0x64/0x10c
> [<102205b0>] elv_requeue_request+0x2c/0x38
> [<102232bc>] blk_insert_request+0xfc/0x104
> [<1024cd30>] scsi_queue_insert+0x68/0x9c
> [<102491ec>] scsi_softirq+0xfc/0x11c
> [<10170560>] sys_select+0x1d0/0x3b8
> [<101299c8>] do_softirq+0xf4/0xf8
> [<1010c1e4>] syscall_do_softirq+0x8/0x10
> [<1010b088>] intr_check_sig+0x0/0xc 

That's not good.  First, is this reproducable?
Second, can you back down to 2.6.4-pa1 and see if that fixes your problem?

Your C110 uses the lasi710 and zalon drivers, right?  sym2's not involved
at all, is it?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
