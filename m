From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Trying to install ...bian-31r1a-hppa on a C200
Date: Tue, 31 Jan 2006 09:02:30 -0700
Message-ID: <20060131160230.GA17042__36739.800804253$1416624002$gmane$org@colo.lackof.org>
References: <004b01c62550$59414920$040aa8c0@local> <43DDCD29.8080800@bizzi.org>
	<001101c6263d$06e3f0e0$040aa8c0@local>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: ???????????? <support@datatek.co.kr>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <001101c6263d$06e3f0e0$040aa8c0@local>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 31, 2006 at 05:04:57PM +0900, ???????????? wrote:
> Creating ext3 file system for / in partition #1 of SCSI1 (0,5,0)
> (sda)...Kernel panic: drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O MMU
> is out of mapping resources.

sorry - this is a well known problem.
Here are two previous emails on the topic:
	http://lists.parisc-linux.org/pipermail/parisc-linux/2003-October/021244.html
	http://lists.parisc-linux.org/hypermail/parisc-linux/1686.html

If you want more info, Start here:
	http://www.parisc-linux.org/mailing-lists/index.html

and search for "ccio_alloc_range ccio_mem_ratio out of mapping"

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
