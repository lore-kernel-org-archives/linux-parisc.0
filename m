Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 028D1482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 10:57:53 -0700 (MST)
Date: Mon, 10 Feb 2003 18:57:49 +0100
Message-ID: <3E476CFE00000819@ocpmta3.freegates.net>
In-Reply-To: <20030210161304.GT11363@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] pppd, pthread and hppa-linux question?
To: "Randolph Chung" <randolph@tausq.org>
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


>> All seems to work fine, never the less I notice some pppd messages which
>> I do not noticed on my i386 Debian GNU/Linux box:
>> ...
>> Feb 10 17:34:57 fw01 pppd[1543]: read: Resource temporarily unavailable
>> Feb 10 17:34:57 fw01 pppd[1543]: read /dev/ppp: Resource temporarily unavailable
>
>this probably comes from apps that assume EAGAIN==EWOULDBLOCK. we need
>to probably fix this in glibc.... let's add it to Carlos' todo list! :-)
>

Hmm just: a quick look in src and effectively in mainly pppd/sys-linux.c
test errno != EWOULDBLOCK (for sys-sunos4.c we met more (errno != EAGAIN
&& errno != EWOULDBLOCK) 
I am curious if some change occurs about this in cvs?

Thanks,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
