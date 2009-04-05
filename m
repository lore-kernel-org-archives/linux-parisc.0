From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] Remove casts from atomic macros
Date: Sun, 05 Apr 2009 13:42:38 -0500
Message-ID: <1238956958.6954.2.camel@mulgrave.int.hansenpartnership.com>
References: <20090404205426.GA27225@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc@vger.kernel.org
To: Bastian Blank <waldi@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090404205426.GA27225@wavehammer.waldi.eu.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2009-04-04 at 22:54 +0200, Bastian Blank wrote:
> The atomic operations on parisc are defined as macros. The macros
> includes casts which disallows the use of some syntax elements and
> produces error like this:
> 
> net/phonet/pep.c: In function 'pipe_rcv_status':
> net/phonet/pep.c:262: error: lvalue required as left operand of assignment
> 
> The patch removes this superfluous casts.

Actually, it's not the casts that are the problem, it's the fact that
they apply to an unbacketed macro argument.  The actual fix is here:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=47e669ce10901dc92960096653d6b22990b5188f

James


