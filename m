Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44474482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 06:23:45 -0700 (MST)
Date: Tue, 28 Jan 2003 14:23:40 +0100
Message-ID: <3E35C8BE0000020C@ocpmta6.freegates.net>
In-Reply-To: <20030128050823.57726.qmail@web12507.mail.yahoo.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] kernel hang.
To: "Derek Engelhaupt" <derekengelhaupt@rocketmail.com>,
	"Sir Ace" <chandler@nateng.com>, parisc-linux@lists.parisc-linux.org
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

Hi Derek,

>
>
>How long did you let it wait?  Some of the machines prior to the C200 (my
>C360 doesn't do it either) seem to hang, but after 20 mins take off.  It's
>a bus walk issue that takes forever.  There was a patch for this that was
>posted recently to see if it resolved this issue.  Let it sit there for
awile
>and see if it eventually starts booting.

Afaik this a seperated patch (not yet check into our stream):

see <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018980.html>

as well as successfull first test (so I presume will be ci soon)

<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/019015.html>

Good luck,
    Joel

PS: I also test it and it doesn't broken b2k and b180; so I think it could
be safely tested

*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
