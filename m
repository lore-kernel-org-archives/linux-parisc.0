Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA18569
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Aug 2000 10:43:54 -0600
Message-Id: <200008281647.JAA15988@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Cc: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
Subject: Re: [parisc-linux] problems compiling..
Date: Mon, 28 Aug 2000 09:47:01 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Joe,
I've forwarded your mail to "parisc-linux" instead of "parisc-linux-request".

I think you just need get an internet connection for the box and update the
CVS archive you are working from.

Also, AFAIK, the --target should be "hppa-linux" or "hppa1.1-linux".
Not sure where MACH fits into that.
I haven't rebuilt the tool chain in quite a while...but I suggest
you look at build-tools/README and build-tools/palinux-autobuilder.

grant

------- Forwarded Message

Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD86AD@epixch003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
To: "'parisc-linux-request@thepuffingroup.com'" <parisc-linux-request@thepuffingroup.com>,
        "'grundler@cup.hp.com'" <grundler@cup.hp.com>
Subject: Re: [parisc-linux] problems compiling..
Date: Mon, 28 Aug 2000 09:24:47 +0200
MIME-Version: 1.0
X-Mailer: Internet Mail Service (5.5.2650.21)
Content-Type: text/plain;
	charset="iso-8859-1"

Dear Grant,

I downloaded the last gcc in date of 2000-08-24 and I tried to compile gcc
on a HP workstation C110 (9000/777) with hp-ux 11.00  and gcc 2.95.2 from
The HPUX Software Porting and Archive Center. (I need to recompile the
kernel because I have to safely use the graphical port as console)

As explain in the recipe, I tried to run ./contrib/gcc_update but failed
because no internet connection is available on this server.

Assuming at this moment that the archive is up to date, I tried to go
further and launch the configure process.
(MACH=hppa-hpux ; DEST=/opt/puffin)
configure failed because "hppa-hp-hpux" is not a supported platform?
Fortunately, I still have a paper copy of the previous release of recipe
which reveal me that MACH must be hppa1.1-hpux.
Then configure was successfully completed.

But the make failed on the same error as encountered by Jeff Towarnicki in
the message:
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/07-Jul/0105.ht
ml.
Thanks in advance for help,
	Joel

------- End of Forwarded Message
