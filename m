Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98BE84829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 07:47:34 -0600 (MDT)
Date: Mon, 21 Oct 2002 16:43:20 +0200
Message-ID: <3DA56CAE00003DB5@ocpmta8.be.tiscali.com>
In-Reply-To: <20021020034403.AF4F14829@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22 
To: "Grant Grundler" <grundler@dsl2.external.hp.com>,
	"Joel Soete" <joel.soete@freebel.net>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Oooh,...

>
>Joel Soete wrote:
>> The very first patch 2.4.19 I still have was pa5 and the same problem
occur.
>> It seems definitely that JFS and STI FB in 2.4.19 are incompatible.
>> Where do I have to start my investigation?
>...
>> Really no idea?
>
>Sorry. I don't. And until 2.4.19 boots on the A500-6X,
>I'm not interested in chasing the JFS/STI issue.
>
>My advice is to start adding printk's in the main vfs_ops entry
>points to JFS until you can narrow down which entry point is
>having problems. Then start looking STI to see if anything
>in the JFS code uses the same services or something.
>

it sounds like a gcc bug:

simply adding "printk("VC: %s: %d\n", __FUNCTION__, __LINE__);" some where
in the middle of take_over_console (to check the way) and the problem is
solved???

I met a similar problem in a evms tools where there was two solutions:
a. changing -O2 to -O0 or -O1
b. using gcc-3.2

But here gcc-3.2 produce well a bootable kernel but afaik there is still
a network connection problem (I try to hack this but the only think I reach
to find is that the last called function was show_stack and that was riht
:-))) )

Hmm I currious to try -O0 on the only console part (if possible)?

Regards,
    Joel
