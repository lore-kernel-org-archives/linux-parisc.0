Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA22721
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Mar 2000 03:15:25 -0700
Received: from proxy.ats.nld.alcatel.nl (proxy.ats.nld.alcatel.nl [138.203.176.252])
	by btmplq.god.bel.alcatel.be (8.9.3+Sun/8.9.1) with ESMTP id KAA03895
	for <parisc-linux@thepuffingroup.com>; Mon, 13 Mar 2000 10:16:26 +0100 (MET)
Received: from nlsols1.ats.nld.alcatel.nl (nlsolnfs [138.203.176.15])
	by proxy.ats.nld.alcatel.nl (8.8.8/8.8.8) with ESMTP id KAA23750
	for <parisc-linux@thepuffingroup.com>; Mon, 13 Mar 2000 10:13:07 +0100 (MET)
Sender: beerse@ats.nld.alcatel.nl
Message-ID: <38CCAEB4.122DB61D@ats.nld.alcatel.nl>
Date: Mon, 13 Mar 2000 10:02:44 +0100
From: Corne Beerse <beerse@ats.nld.alcatel.nl>
MIME-Version: 1.0
To: Steven Pritchard <steve@silug.org>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX application support?
References: <200003120236.UAA10891@osiris.silug.org>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Steven Pritchard wrote:
> MEYER,ALAN C. \(HP-FtCollins,ex1\) said:
> > Also, I am assuming the install model will be to simply copy files from an
> > HP-UX system over to a PA/Linux system.  In particular, I have heard of no
> > plans to support HP-UX packages bundled in "SD" format.  Right?
> 
> The SD depot files are just tar files.  Supporting them would be
> trivial.  You can always untar it, move everything to the appropriate
> location, and run the scripts.  Making that automated (maybe with
> alien) probably wouldn't be at all difficult...

It's verry easy to hack something yourself: untar the file and have a look
at directories you don't think they belong to the tool. Have a look, they
are scripts and textfiles which contain information what to do. It is verry
easy to write a script (if you need it) for installation. The only question
is if your script is complete. The origional should run in GOD mode (root)
so yours must do so if other users need to use the commands you install.

CB

-- 
Everything should be as simple as possible but not simpler - A. Einstein
Corne' Beerse					| Alcatel Telecom Nederland
mailto:beerse@ats.nld.alcatel.nl		| Postbus 3292
talkto:+31(70)3079108 faxto:+31(70)3079191	| NL-2280 GG  Rijswijk
