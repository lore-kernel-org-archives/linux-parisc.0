Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 901954840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 09:54:01 -0600 (MDT)
Date: Mon, 20 Oct 2003 17:53:52 +0200
Message-ID: <3F8A272E00004778@ocpmta3.freegates.net>
In-Reply-To: <3F937482.1060302@hrzpub.tu-darmstadt.de>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] menu: update-menus failled on hppa?
To: "Ruediger Scholz" <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
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

Hi Ruediger,

Yes I see, that was common to all system at my disposal (b180, b2k, c110).

Thanks for advise,
    Joel

>-- Original Message --
>Date: Mon, 20 Oct 2003 07:37:06 +0200
>From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
>To: Joel Soete <soete.joel@tiscali.be>, parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] menu: update-menus failled on hppa?
>
>
>Hi Joel,

Joel Soete schrieb:

> Hi pa,
>
> I noticed from a certain time that (but always forget to report, sorry):
> update-menus[1098]: Cannot lock /var/run/update-menus.pid: Resource 
> temporarily unavailable Aborting.
>
> Is anybody els
> encounter also this pb (with debian/unstable at least)? 

I also encounter this problem on my 715 running debian unstable. I think

running update-menus during upgrade takes too much time, so dpkg thinks 
it isn't corresponding anymore. When runni
>g update-menus from prompt I 
don't get any error messages.

>
>
> Joel
>
Ruediger




-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
