Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mouse stops working when exiting KDE 
In-Reply-To: Message from Derek Engelhaupt <derekengelhaupt@rocketmail.com>
   of "Sat, 21 Sep 2002 15:03:17 PDT." <20020921220317.3256.qmail@web12502.mail.yahoo.com>
References: <20020921220317.3256.qmail@web12502.mail.yahoo.com> 
Date: Sat, 21 Sep 2002 16:42:28 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020921224229.EE9AB4829@dsl2.external.hp.com>
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

Derek Engelhaupt wrote:
> Currently when my system boots up the X11 login window starts up
> automatically and I can log in and use it normally, but when I log out
> the mouse quits working.  The X11 login window appears again, but the
> mouse won't move anymore.  I'm just using a standard PS/2 HP 3 button
> mouse - nothing fancy on my C180.

Known problem. I don't know if this bug is parisc specific.

> Also, why is it that Konqueror won't do https sites? 
> And if it will what could possibly be the problem with that?  Thanks.

apt-get install kdebase-crypto

(IIRC, it was Ryan Murray of debian.org who told me that)

grant
