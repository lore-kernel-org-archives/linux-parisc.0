Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92BB2482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 10:09:18 -0700 (MST)
Date: Mon, 10 Feb 2003 08:13:04 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pppd, pthread and hppa-linux question?
Message-ID: <20030210161304.GT11363@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E476CFE000007AD@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E476CFE000007AD@ocpmta3.freegates.net>
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

> All seems to work fine, never the less I notice some pppd messages which
> I do not noticed on my i386 Debian GNU/Linux box:
> ...
> Feb 10 17:34:57 fw01 pppd[1543]: read: Resource temporarily unavailable
> Feb 10 17:34:57 fw01 pppd[1543]: read /dev/ppp: Resource temporarily unavailable

this probably comes from apps that assume EAGAIN==EWOULDBLOCK. we need
to probably fix this in glibc.... let's add it to Carlos' todo list! :-)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
