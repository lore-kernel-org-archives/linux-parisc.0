Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (mail.calyx.com [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id 105BE482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Apr 2002 08:09:30 -0600 (MDT)
Date: Wed, 17 Apr 2002 10:09:27 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Phil Anderson <andersop@neverland.ncssm.edu>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Missing beep... and music too
In-Reply-To: <Pine.LNX.4.33.0204041723170.28627-100000@bob.ncssm.edu>
Message-ID: <Pine.BSO.4.33.0204171004120.9608-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

For machines with the i8042 SDC tone generator (and which do not
currently have a HIL keyboard in use, as the new drivers for that
are not checked into CVS yet) implementing console beeping support using
the new hpd_sdc module should be trivial.  If anyone is interested in
doing so, contact me and I'll give some pointers.

(Sorry for the delay on HIL stuff BTW, I've just been too busy
lately to tuck all the corners and check it in.)

--
Brian S. Julin
