Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C513E4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 Jan 2003 09:18:19 -0700 (MST)
Date: Fri, 17 Jan 2003 08:15:05 -0800
From: Randolph Chung <tausq@debian.org>
To: Zwane Mwaikambo <zwane@holomorphy.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH][2.5] smp_call_function_on_cpu for PARISC
Message-ID: <20030117161505.GD10121@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <Pine.LNX.4.44.0301170440560.24250-100000@montezuma.mastecende.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0301170440560.24250-100000@montezuma.mastecende.com>
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

In reference to a message from Zwane Mwaikambo, dated Jan 17:
> One thing though, where is hweight64 on parisc?

it wasn't defined yet... but it is now (in cvs) :-)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
