From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Fri, 14 Mar 2003 13:17:57 +0000
Message-ID: <20030314131757.GF29631__49172.8318077095$1416622285$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <3E68A24B00000CC9@ocpmta6.freegates.net> <3E6C78E100001649@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>,
	Matthias Klose <doko@cs.tu-berlin.de>, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-net@vger.kernel.org
To: Joel Soete <jsoe0708@tiscali.be>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E6C78E100001649@ocpmta2.freegates.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Mar 14, 2003 at 01:48:59PM +0100, Joel Soete wrote:
> net/network.o(.text.rtnetlink_rcv+0x84): In function `rtnetlink_rcv':
> : undefined reference to `rtnetlink_rcv_skb'
> make: *** [vmlinux] Error 1
> 
> (with gcc-3.2 with same src && same .config there was no pb)

You've just hit the gcc thinks it's smarter than you are bug.

net/core/rtnetlink.c:extern __inline__ int rtnetlink_rcv_skb(struct sk_buff *skb)

gcc 3.3 decides to not believe you want this function inlined.  probably
the right fix for this is to make this function static inline (you can
drop the `__' around inline, it's not necessary).  This is also the case
for linux 2.5.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
