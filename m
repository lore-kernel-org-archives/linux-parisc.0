Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A42F4837
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Mar 2002 18:16:55 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16rqRI-0008N3-00; Mon, 01 Apr 2002 02:16:52 +0100
Date: Mon, 1 Apr 2002 02:16:52 +0100
From: Matthew Wilcox <willy@debian.org>
To: ccollet@gmu.edu
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux semi-booting on an HP 3000 947
Message-ID: <20020401021652.J7279@parcelfarce.linux.theplanet.co.uk>
References: <271520c2711900.2711900271520c@gmu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <271520c2711900.2711900271520c@gmu.edu>; from ccollet@gmu.edu on Sun, Mar 31, 2002 at 07:38:18PM -0500
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

On Sun, Mar 31, 2002 at 07:38:18PM -0500, ccollet@gmu.edu wrote:
> Hi,
>    Just for fun I though I'd try running parisc-linux on my HP 3000 947
> which is in need of an OS since I don't have MPE/iX tapes. It actually
> booted off the latest CD image, but it freezes once it gets to the "If
> this is the last message you see, you need to switch your console"
> message. From what I've read, I assume this means that there's no
> console driver written for this machine, which isn't suprising since it
> isn't on the list of supported machines. Any idea if there's a way
> around this, or if the NetBSD or OpenBSD ports might support it? Thanks
> in advance.

According to my search of the mailing list archives, it's equivalent to a
G30 in HPUX land.  The console driver is indeed the problem.  You could
use Christoph Plattner's hack to get console output, but I'm not sure
what other devices you might have that would work.  Probably the ethernet
will work, and the SCSI won't.

-- 
Revolutions do not require corporate support.
