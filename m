Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: =?iso-8859-1?q?Hinrich=20Aue?= <hinrich_aue@yahoo.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe 
In-Reply-To: Message from =?iso-8859-1?q?Hinrich=20Aue?= <hinrich_aue@yahoo.de>
   of "Fri, 28 Dec 2001 13:43:34 +0100." <20011228124334.96741.qmail@web21207.mail.yahoo.com>
References: <20011228124334.96741.qmail@web21207.mail.yahoo.com> 
Date: Fri, 28 Dec 2001 22:01:03 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011229050103.54069482A@dsl2.external.hp.com>
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

=?iso-8859-1?q?Hinrich=20Aue?= wrote:
> I found out, that you (Grant Grundler) already had the
> same? Problem. There already was a submitted Bug.
> Has somebody tried to fix that?

Either Richard Hirst or Thomas Bogendoerf already fixed that.
132 should be closed since last I tried, I was able to use pppd
with the dialup modem. Sorry about that - I should have closed it.


> I'll post the stackdump later today, from syslog.

The "trap 15" is a kernel crash. That doesn't get logged
to syslog (afaik). Are you sure it's the same symptom?

grant
