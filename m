Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83FDE482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 10:42:30 -0700 (MST)
Date: Wed, 16 Jan 2002 18:40:52 +0100
From: Martin Schulze <joey@infodrom.org>
To: phi 4369 <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20020116174052.GV9244@finlandia.infodrom.north.de>
References: <1011117789.3c446eddddc77@webmail.tiscali.be> <20020115181518.F19567@parcelfarce.linux.theplanet.co.uk> <1011169636.3c453964624af@webmail.tiscali.be> <3C454208.C1F66E59@hpfrcu81.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3C454208.C1F66E59@hpfrcu81.france.hp.com>
Subject: [parisc-linux] Re: rlogin --> Connection closed.
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

phi 4369 wrote:
> Hi All,
> 
> On my freshly installed 712 palinux when trying to rlogin into it I got this
> 
> iws1pb05:/home/phi> rlogin iws1pb02
> Connection closed.
> iws1pb05:/home/phi>

did you check /var/log/syslog on the remote machine iws1pb02?  Non-matching
name-ip pairs could probably cause this.  If your /etc/hosts.deny contains
the following entry, a non-match will result in a dropped connection:

ALL: PARANOID

Regards,

	Joey

-- 
Life is too short to run proprietary software.  -- Bdale Garbee
