Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 371AA4840
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 29 Jan 2004 00:29:23 -0700 (MST)
Date: Thu, 29 Jan 2004 08:28:45 +0100
Message-ID: <400CB8A100006ED8@ocpmta3.freegates.net>
In-Reply-To: <20040128231106.GC19840@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 carlos
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


>> Any way this last test set aside any pb with _my_ gcc compiler :).
>
>Undo the patch, rebuild, and see if it still fails?

I don't think it has any relation with any patch: since my first test of
2.6 I always reach to boot a 32bit kernel but never a 64bit kernel on this
b2k (that is why I hesitate a long time before trying this on the N because
suspecting a compiler pb)

>Could you explain more about the failure?

Well the pb is easy to easy:
the last messages the palo banner advising: "... If this is the last message
you see ..." then the kernel do very early a hpmc. I so try to get piminfo
but everything seems to point out of kernel :(. I so try to add some printk()
just at begining of init() (in init/main.c just before lock_kernel()) but
it seems to not even reach this point (but not quiet sure that it is a relevant
place for printk() ). 
So I suspect a pb in very early boot into head64.S or vmlinux.lds.S but here
I could insert printk() ?

Any idea?

Thanks for attention,
    Joel



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
