Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A6934840
	for <parisc-linux@parisc-linux.org>; Sun, 23 Nov 2003 22:05:37 -0700 (MST)
Date: Sun, 23 Nov 2003 22:05:35 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sym-2.1.18i backport?
Message-ID: <20031124050535.GD23224@colo.lackof.org>
References: <3FC12C9A.9050903@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FC12C9A.9050903@tiscali.be>
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

On Sun, Nov 23, 2003 at 09:54:34PM +0000, Joel Soete wrote:
> Hi Matthew and all,
> 
> Did you foreseen to backport your great patch (sym-2.1.18i) to 2.4?
> (well some part wouldn't have to be applied (as __init change) but many
> stuff would be interesting?)

I'm considereing do that backport once willy feels the code is "stable".
We have to sort out the u160 support - it's not very clear how it is
supposed to work and it doesn't seem to.

> Is there some interest? faisible?

yes and eventually.

thanks,
grant
