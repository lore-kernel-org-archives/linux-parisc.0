Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay.uni-heidelberg.de (relay.uni-heidelberg.de [129.206.100.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0CF54847
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 07:32:57 -0600 (MDT)
Received: from fsmath.zbt.uni-heidelberg.de (mail@fsmath.zbt.uni-heidelberg.de [129.206.91.26])
	by relay.uni-heidelberg.de (8.12.1/8.12.1) with ESMTP id g5HDWfOY004789
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 15:32:41 +0200 (MET DST)
Received: from kujaku by fsmath.zbt.uni-heidelberg.de with local (Exim 3.35 #1 (Debian))
	id 17Jwcb-00024i-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 15:32:41 +0200
Date: Mon, 17 Jun 2002 15:32:41 +0200
From: Martin Hettich <kujaku@fsmath.zbt.uni-heidelberg.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mke2fs odd number:
Message-ID: <20020617133241.GA7833@mathphys.fsk.uni-heidelberg.de>
References: <20020617095042.GE1177@tykepenguin.com> <1024316831.3d0dd59f20e61@webmail.tiscalinet.be> <20020617130211.GJ1177@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020617130211.GJ1177@tykepenguin.com>
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

On Mon, Jun 17, 2002 at 02:02:11PM +0100, Patrick Caulfield wrote:
> On Mon, Jun 17, 2002 at 02:27:11PM +0200, joel.soete@freebel.net wrote:
> > Quoting Patrick Caulfield <patrick@tykepenguin.com>:
> > 
> > > Does anyone else get with from mke2fs:
> > > 
> > > This filesystem will be automatically checked every 22 mounts or
> > > 1.23076e-312 days, whichever comes first.  Use tune2fs -c or -i to
> > > override.

Hi,
I got to a similar weird number of days, just a few hours ago, when
I did a "sudo tune2fs -j /dev/sda3". Its so ridiculous I just didn't
care, ext3 works fine :). I rebooted my gecko (712/60) 2 times since
then, no fsck occured so far.

some info on my machine/setup :

 uname -a :
Linux hitomi 2.4.18-32 #1 Sat Mar 30 18:26:22 MST 2002 parisc unknown

 dumpe2fs /dev/sda3 :
...
Filesystem features:      has_journal filetype needs_recovery sparse_super
Filesystem state:         clean
...
Last mount time:          Mon Jun 17 01:36:18 2002
Last write time:          Mon Jun 17 01:46:57 2002
Mount count:              10
Maximum mount count:      29
Last checked:             Sat Apr  6 08:32:16 2002
Check interval:           15552000 (6 months)
Next check after:         Thu Oct  3 08:32:16 2002
...

 versions of tune2fs and mke2fs : 1.27 (8-Mar-2002)

Ciao,
	martin der hettich



-- 
Interpunktion und Orthographie dieser Email ist frei erfunden.
Eine Uebereinstimmung mit aktuellen oder ehemaligen Regeln
waere rein zufaellig und ist nicht beabsichtigt.
