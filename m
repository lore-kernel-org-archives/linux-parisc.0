Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id A8A00482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 14:18:42 -0600 (MDT)
Received: from hasw (hasw.swt [192.168.0.10])
	by server1.swt (8.12.0/8.12.0) with ESMTP id g3G55gNA001232
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Apr 2002 04:05:42 -0100
From: se.witt@gmx.net
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 15 Apr 2002 21:51:51 +0200
MIME-Version: 1.0
Message-ID: <3CBB4B77.22708.1CA4625@localhost>
Content-type: text/plain; charset=US-ASCII
Subject: [parisc-linux] 2.4.18-pa17 and pppd 2.4.1 : Resource temporarily unavaiable
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

Hi,

I have a 715/100 with kernel 2.4.18-pa17 and pppd 2.4.1.
When pppd is startet:

pppd[314]: read: Resource temporarily unavailable
pppd[314]: read /dev/ppp: Resource temporarily unavailable

I have found something about this in the Archive and
created a dummy hotplug script, but this changes nothing.
The connecting works but is very slow (high latency, unstable).
The log ist flooded with this message.

ppp_generic, ppp_async, etc. are modules.

Have somebody a suggestion?

Thanks,
Sebastian
 
