Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61F27482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Nov 2001 12:25:52 -0700 (MST)
Message-Id: <200111251921.MAA02216@puffin.external.hp.com>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power button on 712 
In-Reply-To: Message from Jan-Benedict Glaw <jbglaw@lug-owl.de>
   of "Thu, 22 Nov 2001 14:53:04 +0100." <20011122145304.F23305@lug-owl.de>
Date: Sun, 25 Nov 2001 12:21:23 -0700
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

Jan-Benedict Glaw wrote:
> But, after the OS was started,
> it's not such a good idea to allow an user to simply fiddle with
> the BRS (-> big red switch).

While that's true, the intent of the "soft-power" switch was in fact
to let a normal user safely power off the system. THe system needs
to poll the status of the switch and at some point decide it's
time to power off the box. I don't think docs for "soft power"
have been published. I have passed necessary information to
a few folks who've signed NDAs.

grant
