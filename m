Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (ns1.goquest.com [12.18.108.6])
	by dsl2.external.hp.com (Postfix) with SMTP id 345A1482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Mar 2003 16:17:47 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
Reply-To: mszick@goquest.com
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Sun, 16 Mar 2003 17:17:16 -0600
Cc: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
References: <3E68A24B00000CC9@ocpmta6.freegates.net> <03031616521900.01171@wolf466> <20030316230611.GS29631@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030316230611.GS29631@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <03031617171601.01171@wolf466>
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

On Sunday 16 March 2003 05:06 pm, Matthew Wilcox wrote:
> On Sun, Mar 16, 2003 at 04:52:19PM -0600, Michael S. Zick wrote:
> > On Friday 14 March 2003 07:17 am, Matthew Wilcox wrote:
> > > net/core/rtnetlink.c:extern __inline__ int rtnetlink_rcv_skb(struct
> > > sk_buff *skb)
> >
> > Stolen from the GCC thread on 3.x.x inlining...
> > - - - - GCC - - - - -
> > For the record, the kernel doesn't need this any more.  Go check 2.5;
> > new versions of <linux/compiler.h> contain this line:
> > #define inline          __inline__ __attribute__((always_inline))
> > - - - - - - - - - - - -
> > That forces GCC to ignore its changed inline metrics and simply inline
> > the function.
>
> Yes, but...
>
>  * Joel's using 2.4, not 2.5
Exactly why I mentioned it.

>  * #define inline doesn't help functions which are marked as __inline__
If he follows your suggestion of dropping the "__" around "inline" it will.

>
> This isn't a function which absolutely needs to be inlined.  It can
> be `static inline' and gcc can do whatever it likes then.
The subject is getting a lot of discussion on the GCC list.  I only mentioned
this one workaround so that Joel could get on with his work before the issue
is settled on the GCC list.

Mike
