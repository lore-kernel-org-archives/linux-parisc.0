Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 415DB4837
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 14:55:05 -0700 (MST)
Message-Id: <200202182154.g1ILswsp013554@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: doko@cs.tu-berlin.de (Matthias Klose)
Date: Mon, 18 Feb 2002 16:54:58 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jso@europay.com, carlos@baldric.uwo.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <15473.30343.730737.301690@gargle.gargle.HOWL> from "Matthias Klose" at Feb 18, 2002 10:47:51 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> The snapshot packages doesn't build automatically. I had to restart
> the build due to bash problems (the same you saw as well).

The bash problem can be fixed by building bash with --without-bash-malloc.
Been running that way for more than a week and no more bash problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
