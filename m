Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pokey.513erich.iwaynet.net (router.513erich.iwaynet.net [206.244.44.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF2424A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Mar 2001 11:40:45 -0700 (MST)
Received: from localhost (localhost.localnet [127.0.0.1])
	by pokey.513erich.iwaynet.net (8.9.3/8.9.3) with ESMTP id NAA17404
	for <parisc-linux@lists.parisc-linux.org>; Tue, 6 Mar 2001 13:45:01 -0500
Date: Tue, 6 Mar 2001 13:45:01 -0500 (EST)
From: herrold <herrold@owlriver.com>
Sender: <herrold@513erich.iwaynet.net>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.30.0103061332440.16778-100000@pokey.513erich.iwaynet.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] [HPADM] SUMMARY: firmware questions
List-ID: <linux-parisc.vger.kernel.org>

This crossed the HP-UX admin list in summary form today -- it is
somewhat longish, but it got me to thinking about firmware version
issues.

I was left with a couple of unanswerable (to me) questions:

Predicate: An arbitrary HP chassis, found on ebay or cast off at
work, will have no maintenance records, and be in an unknown state
as to firmware version.

1.  For porters:  I would infer that some of the code is
re-inventing firmware-fixpacks and firmware-state detection code
[consciously or not] for problems which have already been
indentified and perhaps solved, by HP.  Is this being well or
episodically addressed, and could it be done better?


2.  For HP-ers:  Is HP-corporate ameanable to general release and
application of fixpacks to the general population of HP-chassis
owners?  This answer may vary by host class -- i.e., if the
provision of fixpacks is a maintenance contract benefit, it may be
sensible only from HP's point of view to release only older
'end-of-life'd' class hosts without charge (they are no longer a
revenue stream item) -vs- release them all, recognizing that the GPL
feedback might provide a fix for an indentified but un-addressed
fixpack open issue.

I have left the HPUX-admin trailer intact for subscribers here
unaware of that list -- beware if subscribing -- lurk to learn their
ways

-- Russ Herrold



---------- Forwarded message ----------
Date: Tue, 06 Mar 2001 09:49:50 -0800
From: Tom Lieuallen <toml@engr.orst.edu>
To: hpux-admin@dutchworks.nl
Subject: [HPADM] SUMMARY: firmware questions


As usual, there were a number of quick and knowledgeable answers...
Thanks to:
  Henry Helfenbein
  Paul Alberts
  Eef Hartman
  Bill Hassell
  Jeff Cleverley

> A couple questions about HP workstation firmware:
>
> * If we have no problems with a workstation, should we leave it well
>   enough alone?  Or, should we be proactive and update them?
>
>   For reference, we're dealing with models like 712/80, C160, B132+, etc.
>
>   They're on their way out of our environment, in the next year or two,
>   so I'm not really _looking_ to do unnecessary work.
>

There wasn't concenus on this.

henry> It doesn't sound like you are experiencing any problems, so I wouldn't
henry> screw with it.

paul> You never know when budget issues might compel you to depend on
paul> these longer than expected.  I would update the firmware when it is
paul> convenient.

eef> We always let well alone. Especially as it concerns older models,
eef> so you probably won't be upgrading to the newest HP-UX 11 version
eef> either.  HP-UX 10.20 will never be needing that newer firmware...

bill>  HP does not release patches just to fill up disk space.
bill>  There are critical patches that should be installed and
bill>  they are sent automatically every two months (assuming you
bill>  have a support contract).  A sysadmin's job is to prevent
bill>  problems rather than react when mistakes are discovered.

bill>  A workstation is often less visible to an IT department as
bill>  "it's only one user" so patches get ignored along with
bill>  disk space management.  There are thousands of customers
bill>  still running versions of HP-UX that are not Y2K compliant
bill>  and the scary thought is that they won't know that some
bill>  reports and even regular backups are not working correctly
bill>  because the failures are silent--unless the sysadmin
bill>  checks every single cron job every day, and verifies every
bill>  line of data in the databases every day, there is likely
bill>  no way to know if something is not working right.

jeff> If it's not broke, don't fix it.

> * The various firmware patches/updates mention writing the firmware to
>   tape and booting from the tape.  Seems archaic.  :-)  Are there
>   alternative options such as loading the firmware in /stand or
>   somewhere on a network boot area?

henry> I administer about 20 C-class workstations that I haven't touched the
henry> firmware on yet. I upgraded the firware on a K580 here going from 39.11
henry> to 39.43 without any issues, but if you download the wrong model you
henry> can render the system useless. I saw something on this mailing list a
henry> few months back where somebody did just that. It sounded ugly!

henry> I downloaded my patch from HP's ITRC and put it on DDS DAT tape. No
henry> problems. I don't know of any other way to do it, since I only did that
henry> once just recently.

bill>  Not archaic at all.  The operating system is a massive
bill>  piece of software that isolates the hardware from the
bill>  software and it must always be running even to read a
bill>  simple file.  Updating processor firmware (the basic
bill>  instructions of the machine itself) must essentially stop
bill>  all execution of the opsystem while the changes are made.
bill>  But since the file with the firmware cannot be accessed
bill>  without the opsystem running, it's a Catch-22.  A tape is
bill>  a dumb device so the procssor ROMs just issue a simple
bill>  read and provide an I/O address.

eef> The problem is, while updating the firmware you are NOT running Unix,
eef> so you don't have a filesystem, nor networking.  The update program is
eef> total standalone, needs direct hardware access (which Unix normally
eef> reserves for the kernel ONLY).

eef> Even the "/stand" access for booting doesn't come out of the firmware
eef> but out of the "hpux" util in the IPL (which is soft-loaded onto the
eef> disk).  hpux-admin@dutchworks.nl

jeff> I don't know if it will work, but you could try putting it in /stand
jeff> and try booting like it was an alternate kernel.  We always did ours
jeff> from tape on the occasions we needed to do it.


> I'll summarize.

So, it sounds like the tape is the only way to go.  And, there are
conflicting opinions -- either "if isn't broke; don't fix it"
vs "HP knows best -- be proactive".

I believe I'll be updating firmware as convenient, starting with the
models that will be around the longest. :-)

thanks

Tom Lieuallen
Oregon State University

--
             ---> Please post QUESTIONS and SUMMARIES only!! <---
        To subscribe/unsubscribe to this list, contact majordomo@dutchworks.nl
       Name: hpux-admin@dutchworks.nl     Owner: owner-hpux-admin@dutchworks.nl

 Archives:  ftp.dutchworks.nl:/pub/digests/hpux-admin       (FTP, browse only)
            http://www.dutchworks.nl/htbin/hpsysadmin   (Web, browse & search)
