Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA20246
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Nov 2000 13:28:29 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13v3iu-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Sun, 12 Nov 2000 13:27:32 -0700 (MST)
Message-Id: <m13v3iu-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc build fails / bash bug
In-reply-to: Your message of "Sun, 12 Nov 2000 11:06:38 MST."
             <20001112110638.A1005@tausq.org>
Date: Sun, 12 Nov 2000 13:27:32 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= After a lot of digging, I *think* what is at fault is actually bash.

Bash has a bunch of 'set' options, some shell variables, and probably
some compile-time configure options, which affect its behavior, so I'd
compare all those.  One possibility is that the bash configure script on
hppa configures bash to be more like Posix, since that's what hp-ux shell
users expect.

The construct in question:

	echo "a b c
		1 2 3" | while read x1 x2 x3

*depends* on the way echo breaks or doesn't break lines, and the way
read parses them.  Often scripts like that also depend on whether
the shell actually makes a new subprocess for the 'while' or it doesn't,
because that determines whether variables set in the loop will still be
set on exit from the loop.  While I didn't find a way to make the
construction fail, a safer method (when you get a choice) is to use 'set':

	set -- a b c \
		1 2 3

	while [ $# != 0 ]
	do
	    echo $1 $2 $3
	    shift 3
	done

	-Paul "too much shell programming" Bame
