Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DA1B4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Jun 2003 16:04:39 -0600 (MDT)
Date: Sat, 7 Jun 2003 23:04:36 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EE25DEC.1040105@tiscali.be>
Message-ID: <Pine.LNX.4.44.0306072257080.30116-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: compiler & kernel (2)
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

On Sat, 7 Jun 2003, Joel Soete wrote:

> Max,
>
> I will so have a more detail look in your config.
>
> (the other server I can use is a N model with 2Mb wich I do not see used
> more than 1.7 Mb and so not need to swap :-) ; OTC my 256Mb (or less)
> boxes usualy need swap. Let see)

I think you are talking about GB here, not MB ;)

> PS: Do you still encounter starvation pb?

I'm not sure, I've to check the /var/log/messages* files more closely.
When I was browsing through them last time (when I sent the dmesg to the
list) it didn't seem so (the 'beast' is now up almost 2 weeks).
So if there are 'target is suffering tag starvation' messages at all,
there are at least so few you can hardly spot them ;)

Max
