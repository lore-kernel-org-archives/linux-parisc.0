Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 18 Dec 2002 16:59:15 -0700
To: Joerg Steindlberger <j@steindlberger.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] still problems with PCI IDE controller
Message-ID: <20021218235915.GH17944@dsl2.external.hp.com>
References: <200212160609.XAA18500@udlkern.fc.hp.com> <courier.3E00E3ED.000010DA@server01> <20021218212455.GG17944@dsl2.external.hp.com> <courier.3E00F419.0000601B@server01>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <courier.3E00F419.0000601B@server01>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Wed, Dec 18, 2002 at 11:18:14PM +0100, Joerg Steindlberger wrote:
...
> Okay. I now set hdparm -c 1 /dev/... and hdparm -d 1 /dev/... -- before 
> starting the softwareRAID. The RAID1 is syncing this moment with about 2 
> Mbyte/s.

Excellent!
TBH, I wasn't expecting that to work.

> I think I'll stop it now and mount the shorter 80pin cable again and 
> play with some speed settings. My earlier problem with DMA was, that the 
> kernal crashed when setting the CONFIG_IDEDMA_AUTO=y.

My guess is the IDE code is poking at registers that don't exist.
Did you post console output from the crash?
I'm just curious if it was an HPMC or kernel trap (data page fault).

> > Nope. IDE is EEEeevil ;^)
> Yes, I know. But what would You pay for two 80 GB disks?

The pro/cons of both are well documented.
I'm not going to re-hash them here.  :^)

grant

ps. To answer your question: Nothing. I collect 20 or so 9GB 10K rpm SCSI
drives from the scrap area and setup raid0/1 as needed. ;^)
