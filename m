Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7946F482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Apr 2003 00:45:00 -0600 (MDT)
Date: Sat, 19 Apr 2003 23:40:31 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] floating point calling convention on pa
Message-ID: <20030420064031.GD25257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030420011256.GC25257@tausq.org> <200304200149.h3K1njWm004550@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304200149.h3K1njWm004550@hiauly1.hia.nrc.ca>
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

Hi Dave,

Thanks for the quick reply.

I thought I understood it, but this one baffles me:

static int floating(int a, float b, double c, long double d, int e)

i would have guessed this mapped to:

a -> gr26   (sp-36)
b -> fr4L   (sp-40)
c -> fr7    (sp-48)
d -> sp-56
e -> sp-64

but according to gcc, e is at sp-60.

How come?

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
