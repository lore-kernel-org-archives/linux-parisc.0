Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id C72774829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Sep 2002 00:04:20 -0600 (MDT)
Subject: Re: [parisc-linux] SMP problems
From: Ryan Bradetich <rbradetich@uswest.net>
To: Arto Jantunen <viiru@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020912054834.GA32209@www1.dt-link.fi>
References: <20020912054834.GA32209@www1.dt-link.fi>
Content-Type: text/plain
Date: 12 Sep 2002 00:04:18 -0600
Message-Id: <1031810658.9835.60.camel@beavis>
Mime-Version: 1.0
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

Hello Arto,

I have also seen this problem on the K460 when running SMP, where as
the UP kernel works fine.  I have started to debug this problem once,
but I got side tracked and have not gotten back to finish debugging
this problem. I do not think I will have time to look at it before
next week, but I will see what I can find next week.

Thanks,

- Ryan.

P.S. When talking with Richard Hirst about this problem, we thought it
might be a Copy On Write problem, since the problem appears to be with
apt-get.  Last time (a couple of months ago) I tried it dpkg -i <pkg>
worked fine.



On Wed, 2002-09-11 at 23:48, Arto Jantunen wrote:
> This is a HP9000/R390 machine, or atleast the previous owner
> said so. It has two PA8200 cpu's running at 240Mhz, but I have
> disabled the second cpu for debuging this problem. As you can see
> from the attached minicom capture, if running an SMP kernel with
> only one cpu, it crashes. It also crashes when running on two cpu's,
> which is why I am reporting this. This proves that the problem has
> nothing to do with the two cpu's stepping on each others toes or
> anything. The machine runs perfectly stable on an UP kernel. Any
> comments, suggestions of things that I could do to help someone
> debug it and anything else is welcome. Please CC me on replies,
> I'm not on the list.
> 
> --
> Arto Jantunen
> ----
> 
