Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92A9F482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 00:04:32 -0700 (MST)
Message-Id: <200111160700.AAA18727@puffin.external.hp.com>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240 Graphics, 64bit kernel and more) 
In-Reply-To: Message from Jurriaan on Alpha <thunder7@xs4all.nl>
   of "Fri, 16 Nov 2001 07:34:18 +0100." <20011116073418.A15527@alpha.of.nowhere>
Date: Fri, 16 Nov 2001 00:00:16 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Jurriaan on Alpha wrote:
> The results are shocking; the C200+ is twice as slow, and uses 3 times as
> much system time.

I'm not surprised by the result.
1) We've done nearly zero tuning kernel.  Alpha port is much more mature.
2) gcc is poorly tuned for hppa as well.
   ie compare perf of gcc vs acc on HPUX. Up to 2x difference in some cases.
3) gcc is int intensive. Ie clock speed matters more and the alpha
   has 2.5x advantage here.

grant
