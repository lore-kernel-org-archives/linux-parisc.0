Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C54684840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Nov 2003 11:29:57 -0700 (MST)
Date: Thu, 27 Nov 2003 19:29:44 +0100
Message-ID: <3FB265EC000096AD@ocpmta3.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0311270423120.9783@sal.ucc.ie>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] C3000 and 2.6 - need config help
To: "M. Grabert" <xam@cs.ucc.ie>,
	"Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi all,

> > I've seen a config option 'DUMMY_CONSOLE' in .config, but I don't find
> > how to select it in 'make menuconfig' or any description in Documentation/.
> >
> > I have several machines that run headless - I use serial console then.
> >
>But I never had a situation where I didn't even have serial console ...
>
> yeah - the real problem is init sequence completely changed in 2.6 (vs
2.4).
> We haven't reworked all the same quirks from 2.4 into 2.6 yet.

> So is there current a way to get 2.6 working *without* serial console or
STI ?

I rebuild a k 2.6.0-test11 with my gcc-3.3.2 64bits without SUPERIO and PDC
console. No pb to rebuild but it failled to boot on the b2k :( (and no console
meana no mean to analyse :( ). 

Sorry to have no more help, but for such kind of pb I read (some time ago
on lwn) that some one was working on a 'network' console for 2.6 (suporting
at this time tulipe's nic among others iirc). I try to contact him but never
get any feedback. Is somebody known the status of this patch in 2.6?

Thanks,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
