From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Sun, 22 May 2005 19:40:53 -0600
Message-ID: <20050523014053.GB8960@colo.lackof.org>
References: <4282FEEE00003164@mail-6-bnl.tiscali.it>
	<20050520151542.GA22835@colo.lackof.org>
	<428F3D4A.6000200@tiscali.be>
	<20050522015619.GB2733@colo.lackof.org>
	<429083BB.6010506@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <429083BB.6010506@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 22, 2005 at 01:06:03PM +0000, Joel Soete wrote:
> linux-2.6.12-rc4-pa5-050522.tar               100%  207MB 881.1KB/s   04:00
...
> mmm the builtin nic of the c110 is only 10M/half duplex, I presume that's 
> why there was no improvement or may be another more relevant test?

Both actually.

If possible, connect the C110 with 100BT NIC to *any* other 100BT with
a cross-over cable or to switch. I think you need a card-mode DINO card
(EISA form factor) for C110 since it doesn't have PCI.
Then run pktgen (kernel psuedo-driver). This script needs some adjusting
but should get you started:
	http://iou.parisc-linux.org/ols2004/documents/pktgen-testing/pktgen-single

If you can plug in multiple 100BT (or gige NICs),
look at some of the other scripts in the same directory.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
