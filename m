Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 85B50482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jul 2003 00:52:22 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: How to enable LCD screen on K-class?
Message-ID: <1057906340.3f0e5ea4d6fcf@clients.latnet.lv>
Date: Fri, 11 Jul 2003 09:52:20 +0300 (EEST)
From: Mihails Nikitins <nikitins@latnet.lv>
References: <1057826587.3f0d271b5b81a@clients.latnet.lv> <20030710160617.GA30482@dsl2.external.hp.com> <200307102123.40780.deller@gmx.de> <20030710221215.GA6200@dsl2.external.hp.com>
In-Reply-To: <20030710221215.GA6200@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
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

> On Thu, Jul 10, 2003 at 09:23:40PM +0200, Helge Deller wrote:
> > I think Mihails talks about the small panel LCD display on the
> > front of the chassis, 
> 
> doh! yes, I think you are right.
> 
> grant
> 

Yes, I tried to explain it as 'status LCD screen'. You're right, it's better to
call it LCD panel. :-) I ask people having D, K, J classes if LCD panels should
work.

I see that panel normal  is being overwritten with black rectangles while
loading Linux. I hope my question is clear now.

BR,
Mihails

P.S. I don't know if you still want to see this.



# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 1.1c
cpu             : PA7200 (PCX-T')
cpu MHz         : 120.000000
model           : 9000/839/K210
model name      : KittyHawk DC3-120 (K210)
hversion        : 0x00005810
sversion        : 0x00000491
I-cache         : 256 KB
D-cache         : 258 KB (WB)
ITLB entries    : 120
DTLB entries    : 120 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (16 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 119.60
software id     : 1200801362

processor       : 1
cpu family      : PA-RISC 1.1c
cpu             : PA7200 (PCX-T')
cpu MHz         : 120.000000
model           : 9000/839/K210
model name      : KittyHawk DC3-120 (K210)
hversion        : 0x00005810
sversion        : 0x00000491
I-cache         : 256 KB
D-cache         : 258 KB (WB)
ITLB entries    : 120
DTLB entries    : 120 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (16 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 119.60
software id     : 1200801362
