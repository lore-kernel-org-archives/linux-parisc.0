Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A4CC482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Mar 2003 16:06:13 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18uhCl-00062m-Ue; Sun, 16 Mar 2003 23:06:11 +0000
Date: Sun, 16 Mar 2003 23:06:11 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Michael S. Zick" <mszick@goquest.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Joel Soete <jsoe0708@tiscali.be>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Message-ID: <20030316230611.GS29631@parcelfarce.linux.theplanet.co.uk>
References: <3E68A24B00000CC9@ocpmta6.freegates.net> <3E6C78E100001649@ocpmta2.freegates.net> <20030314131757.GF29631@parcelfarce.linux.theplanet.co.uk> <03031616521900.01171@wolf466>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <03031616521900.01171@wolf466>
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

On Sun, Mar 16, 2003 at 04:52:19PM -0600, Michael S. Zick wrote:
> On Friday 14 March 2003 07:17 am, Matthew Wilcox wrote:
> > net/core/rtnetlink.c:extern __inline__ int rtnetlink_rcv_skb(struct sk_buff
> > *skb)
> Stolen from the GCC thread on 3.x.x inlining...
> - - - - GCC - - - - -
> For the record, the kernel doesn't need this any more.  Go check 2.5;
> new versions of <linux/compiler.h> contain this line:
> #define inline          __inline__ __attribute__((always_inline))
> - - - - - - - - - - - -
> That forces GCC to ignore its changed inline metrics and simply inline
> the function.

Yes, but...

 * Joel's using 2.4, not 2.5
 * #define inline doesn't help functions which are marked as __inline__

This isn't a function which absolutely needs to be inlined.  It can
be `static inline' and gcc can do whatever it likes then.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
