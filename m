Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C8C248ED
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 23:36:46 -0600 (MDT)
Message-ID: <3F937482.1060302@hrzpub.tu-darmstadt.de>
Date: Mon, 20 Oct 2003 07:37:06 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] menu: update-menus failled on hppa?
References: <3F92ED0A.3010806@tiscali.be>
In-Reply-To: <3F92ED0A.3010806@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Joel,

Joel Soete schrieb:

> Hi pa,
>
> I noticed from a certain time that (but always forget to report, sorry):
> update-menus[1098]: Cannot lock /var/run/update-menus.pid: Resource 
> temporarily unavailable Aborting.
>
> Is anybody else encounter also this pb (with debian/unstable at least)? 

I also encounter this problem on my 715 running debian unstable. I think 
running update-menus during upgrade takes too much time, so dpkg thinks 
it isn't corresponding anymore. When running update-menus from prompt I 
don't get any error messages.

>
>
> Joel
>
Ruediger
