Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E51E483B
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jul 2003 10:00:46 -0600 (MDT)
Date: Mon, 7 Jul 2003 18:00:43 +0200
Message-ID: <3F03A42100000903@ocpmta1.freegates.net>
In-Reply-To: <1056732728.4348.52.camel@dhcp22.swansea.linux.org.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] warning: minor abi change
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: "Matthew Wilcox" <willy@debian.org>,
	"HPPA List" <parisc-linux@parisc-linux.org>
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

Hi Alan,

> >On Gwe, 2003-06-27 at 17:21, Joel Soete wrote:
> > which interfere with your:
> >  	KERN_HPPA_PWRSW=57,	/* int: hppa soft-power enable */
> >  	KERN_HPPA_UNALIGNED=58,	/* int: hppa unaligned-trap enable */
> > };
> > 
> > What to do?
> 
> Get the HP ones into 2.5 then they are fixed "right" values

Ok but now in 2.4.22-pre3:
[...]
  	KERN_EXCEPTION_TRACE=58,	/* boolean: exception trace */
[...]

Thanks for further advise,
    Joel




------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
