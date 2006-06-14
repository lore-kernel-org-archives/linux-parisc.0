From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Wed, 14 Jun 2006 16:02:10 +0800
Message-ID: <448FC282.80402@tausq.org>
References: <200606052020.52908.kmh@sonic.net>	<200606060349.k563n4ST023145@hiauly1.hia.nrc.ca>
	<7d01f9f00606060551n2aabd3e9p908745991df33a2f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <varenet@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00606060551n2aabd3e9p908745991df33a2f@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> A number of kernel modules fail to load nowadays on parisc. That
> includes xfs, netfilter, ipv6... Some are known bloated big ones, but
> others are quite surprising. In any case that's clearly a problem we
> want to fix at some point.
> 
> I remember Randolph saying that might indeed be a kernel loader
> issue... Randolph, any thought?

ok, several things:

- I looked at fixing this in binutils, which is really the "right" place
to fix this; unfortunately the changes required are very extensive, so I
gave up

- I looked at using -mlong-calls to address this issue. I've added the
missing relocation that was reported in a previous message on this
thread, but there are other problems - with modules compiled with
-mlong-call I am seeing rather bizarre crashes that I have not had time
to debug further. I do not yet know why they are happening, although I
suspect it has to do with bve clobbering r31. I'm not yet sure if this
is a kernel problem or a gcc problem.

- As to "small" modules causing the out of bounds problem - I haven't
really looked at any modules other than ipv6. If there's a particular
one that is "surprising", I can take a look. Usually it's quite obvious
where the out of bounds problem is.

- As an aside, while looking at the module loading problem, I've
convinced myself that the 64-bit module loader is wrong. OTOH, it seems
to work in most cases, so there's clearly something that I don't yet
understand.....

The module loader has a hard coded limit for the number of GOT entries.
We can exceed this rather easily in some cases when we are using long calls.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
