Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 20 Sep 2003 23:35:55 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "Stephen C. Tweedie" <sct@redhat.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Ranjith Sudarsanan <ranjith_sudarsanan@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [Fwd: [parisc-linux] Problems with raw interface.]
Message-ID: <20030921053555.GA5312@dsl2.external.hp.com>
References: <1063919293.16536.2.camel@dhcp23.swansea.linux.org.uk> <1063989244.2834.48.camel@sisko.scot.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1063989244.2834.48.camel@sisko.scot.redhat.com>
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

On Fri, Sep 19, 2003 at 05:34:04PM +0100, Stephen C. Tweedie wrote:
> Do you _ever_ get valid output, or is raw always failing?
> There may well be a cache coherency point being missed.

2.6.0-test5 (-pa9) produced incorrect output 3 for 3.
But it's NOT identical for all three runs.
I think you are correct.

BTW, kernel and user space will alias to different cachelines
for the same 32-bit "offset" because of "Space Registers"
(form of segmented addressing).

I grabbed 128k data off the beginning of the disk.
Reading 8 blocks from raw1 was only showing all zeros.

I'll guess 2.4.22 has same bug since beginning out "output"
was also all zero's. Getting longer runs from 2.4.22
would be useful...something for tomorrow or monday.

I used:
  ion:/tmp# dd if=/dev/sda of=/tmp/sda.block1 count=512
and
  ion:/tmp# dd if=/dev/raw/raw1 of=/tmp/sda.raw1 count=512

grundler@ion:/tmp$ cksum *
1803524181 262144 sda.block1
1803524181 262144 sda.block2
1803524181 262144 sda.block3
3975907619 262144 sda.raw1
3975907619 262144 sda.raw2
2757932476 262144 sda.raw3

/ is on /dev/sdh

Output files are on ftp://gsyprf10.external.hp.com/pub/raw-pa9/

I just added 2MB files (2MB since 1.5MB dcache) which show more
of the same.

od -Ax -tx /tmp/sda.raw3 | less
000000 00000000 00000000 00000000 00000000
*
02b290 30000000 70000000 00000000 00000500
02b2a0 56000000 18000100 2d000000 00000100
02b2b0 fa040f98 0127c101 082c1698 0127c101
02b2c0 00000000 00000000 00000000 00000000
*
02b490 30000000 70000000 00000000 00000500
02b4a0 56000000 18000100 2d000000 00000100
02b4b0 fa040f98 0127c101 082c1698 0127c101
02b4c0 00000000 00000000 00000000 00000000
*
...

I think sda contains random data from a previous life in a test environment.

ion:/tmp# od -Ax -tx /tmp/sda.block1 | less
000000 33c08ed0 bc007cfb 5007501f fcbe1b7c
000010 bf1b0650 57b9e501 f3a4cbbd be07b104
000020 386e007c 09751383 c510e2f4 cd188bf5
000030 83c61049 7419382c 74f6a0b5 07b4078b
000040 f0ac3c00 74fcbb07 00b40ecd 10ebf288
000050 4e10e846 00732afe 4610807e 040b740b
000060 807e040c 7405a0b6 0775d280 46020683
...


> The key places are rw_raw_dev(), where we set up the virtual address to
> physical page mappings, and brw_kiovec(), where the actual physical page
> IO is done.

I can look, but willy or jejb have much better chance of finding
something...

cheers,
grant
