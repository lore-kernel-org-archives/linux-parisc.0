Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 8 Aug 2003 09:55:50 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel BUG at include/linux/skbuff.h:834!
Message-ID: <20030808155550.GE28214@dsl2.external.hp.com>
References: <20030806143219.GC30797@dsl2.external.hp.com> <20030806145700.GU22222@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030806145700.GU22222@parcelfarce.linux.theplanet.co.uk>
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

On Wed, Aug 06, 2003 at 03:57:00PM +0100, Matthew Wilcox wrote:
> "I don't believe you" ;-)

Well, I just copied what the kernel posted to the console.
Maybe the stack trace was from the wrong stack? (kernel vs user space)

> The first BUG is in skb_put() and the second BUG is in skb_pull().  Neither
> are called from netif_receive_skb(), nor net_rx_action().  

yup - I see that now too. 
The stack info is crap unless the calls to skb_* are hidden
in macros or other inline function calls.

...
> So none of these addresses make any sense ;-(

ok. :^(

Hopefully this is reproducible.

grant
