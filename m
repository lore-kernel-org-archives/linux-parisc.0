Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (ns1.goquest.com [12.18.108.6])
	by dsl2.external.hp.com (Postfix) with SMTP id C1D87482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Mar 2003 15:52:59 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
Reply-To: mszick@goquest.com
To: Matthew Wilcox <willy@debian.org>,
	Joel Soete <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Sun, 16 Mar 2003 16:52:19 -0600
Cc: parisc-linux@lists.parisc-linux.org
References: <3E68A24B00000CC9@ocpmta6.freegates.net> <3E6C78E100001649@ocpmta2.freegates.net> <20030314131757.GF29631@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030314131757.GF29631@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <03031616521900.01171@wolf466>
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

On Friday 14 March 2003 07:17 am, Matthew Wilcox wrote:
> On Fri, Mar 14, 2003 at 01:48:59PM +0100, Joel Soete wrote:
> > net/network.o(.text.rtnetlink_rcv+0x84): In function `rtnetlink_rcv':
> > : undefined reference to `rtnetlink_rcv_skb'
> >
> > make: *** [vmlinux] Error 1
> >
> > (with gcc-3.2 with same src && same .config there was no pb)
>
> You've just hit the gcc thinks it's smarter than you are bug.
>
> net/core/rtnetlink.c:extern __inline__ int rtnetlink_rcv_skb(struct sk_buff
> *skb)
>
> gcc 3.3 decides to not believe you want this function inlined.  probably
> the right fix for this is to make this function static inline (you can
> drop the `__' around inline, it's not necessary).  This is also the case
> for linux 2.5.

Stolen from the GCC thread on 3.x.x inlining...
- - - - GCC - - - - -
For the record, the kernel doesn't need this any more.  Go check 2.5;
new versions of <linux/compiler.h> contain this line:
#define inline          __inline__ __attribute__((always_inline))
- - - - - - - - - - - -
That forces GCC to ignore its changed inline metrics and simply inline
the function.

Mike
