Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0460482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Apr 2003 10:50:13 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h3UGoC604421
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Apr 2003 17:50:12 +0100
Date: Wed, 30 Apr 2003 17:50:11 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0304301730410.21749-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Presicionbook keyboard under console
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

I tried to figure out why some keys on my Presicionbook are messed up
when using the console (it works on X). As it turns out, 'showkey -k'
shows the 'keycode 86' for the following keys:

ESC, F2 .. F12, Ins, Del, AltL, AltR, MetaL, MetaR, | and \ (same key),
Scroll lock, PgDn, PgUp, Home, PrSc, Pause, End and the four arrow keys.

Since they all share the keycode 86, and obviously this keycode is
assigned to '\', all the above mentioned keys produce '\' as an output.

showkey -s produces the following output for all the above mentioned keys:
pressing key: 0x7f release: 0xff


Any clue what might be wrong?

Thanks, Max


PS: I still have the problem that X currently just works when I use the
external monitor; using the internal LCD it boots fine, but doesn't show
anything ...
